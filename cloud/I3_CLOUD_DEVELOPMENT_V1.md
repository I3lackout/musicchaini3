# I3 Cloud Development Environment V1

The GitHub repository `I3lackout/musicchaini3` is the public documentation tree. It is not the Flask application checkout. The 63 isolated application tests live in the private working tree and are not part of this repository.

This document describes the development and test path for Cursor Cloud Agents, GitHub Actions, and Google Cloud. It does not authorize a production deployment.

Production stays on the Debian VPS (`musicchaini3.com`). Nothing in this setup restarts Waitress, changes DNS, or connects agents to the production database.

The existing `docs` path is a file about subgraph deployment, so this guide lives under `cloud/`.

## What was verified on 2026-11-11

Repository checkout used for this work:

- Local git repository has no commits and no remote.
- There is no committed GitHub Actions history in this checkout.
- Application entry points are `app.py` and `wsgi.py`.
- `app.py` opens a database connection while it is imported. Cloud scripts must not import it.
- The repository root `__init__.py` also builds a Flask app at import time. `scripts/cloud/test.sh` forces an in-memory SQLite URI before pytest starts, because pytest imports that package file.
- The application entry points read the database URI from the environment. Keep credentials out of Git, Cloud Agents, and this document. Rotate any database password that was previously stored in local files or backups.
- Isolated economics tests live in `economics/tests` and use an in-memory SQLite database.
- `requirements.txt` is unpinned and includes audio, video, and payment libraries. Cloud install uses `requirements-ci.txt` unless `MUSICCHAIN_FULL_DEPS=1` is set deliberately.
- Several files under `musicchain/adapters` and `musicchain/core` already fail `compileall`. The cloud test command compiles only `economics` and `musicchain/economics`.

Google Cloud, read-only:

| Check | Result |
| --- | --- |
| Active gcloud project | `musicchain-i3-lab` |
| Cloud Run in `europe-west3` | `i3-economics-intelligence` |
| `musicchaini3-gemini` Cloud Run in `europe-west3` | none listed |
| Artifact Registry `europe-west3` | `i3-services` (Docker) in `musicchain-i3-lab`; none listed in `musicchaini3-gemini` |
| Container | port 8080, 1 CPU, 256Mi memory, concurrency 10, request timeout 60s |
| Maximum instances | annotation `run.googleapis.com/maxScale=1` |
| Minimum instances | no minScale annotation was present |
| Ingress | `all` |
| IAM bindings on the service | none returned |
| Workload Identity pools | none listed |
| Runtime service account | default Compute Engine service account |

An empty IAM policy does not by itself prove every network path is private. Do not grant `allUsers` or `allAuthenticatedUsers`.

Remaining trial credit and the February 2027 expiration were not queried. Billing reads were not required for this setup.

## Cursor environment

Schema used: [cursor.com/schemas/environment.schema.json](https://www.cursor.com/schemas/environment.schema.json).

Official resolution order:

1. Personal saved environment
2. Team saved environment
3. `.cursor/environment.json` for a single-repository run

A saved environment reads the repository file only when its environment.json location points at that file. The dashboard for this repository already points the personal environment at `.cursor/environment.json`. Builds use the default branch. A feature-branch copy of the file is used when an agent is started on that branch after the file has been pushed.

Configured commands:

| Field | Value | Purpose |
| --- | --- | --- |
| `install` | `bash scripts/cloud/install.sh` | Create `.venv` and install pinned test dependencies during a Build |
| `start` | `bash scripts/cloud/start.sh` | Confirm the virtualenv imports. It does not start Flask |
| `enable_testing` | `true` | Leaves cloud testing available |
| `ports` | `5000` | Reserved for a future local test server |

MCP allowlists and egress rules are omitted on purpose. An empty allowlist does not disable MCP, and this repository does not yet name the exact servers that should be allowed. Add `mcpServerAllowlist` only after those server URLs or commands are known.

`start` must stay free of Flask. Importing `app.py` tries to reach the configured MySQL database immediately.

## Local commands

```bash
bash scripts/cloud/install.sh
bash scripts/cloud/start.sh
bash scripts/cloud/test.sh
```

The test script exits if `DATABASE_URL`, `SQLALCHEMY_DATABASE_URI`, or `DEFAULT_MYSQL_URI` is set to anything other than SQLite. It then forces all three to `sqlite:///:memory:` so the repository root package cannot open MySQL while pytest imports it.

To install the full unpinned application stack inside the same virtualenv:

```bash
MUSICCHAIN_FULL_DEPS=1 bash scripts/cloud/install.sh
```

That install needs system libraries such as ffmpeg for several packages in `requirements.txt`. It is not part of the default Cloud Agent build.

## GitHub Actions

`.github/workflows/ci.yml` has two separate results:

| Job | Meaning |
| --- | --- |
| Configuration only | The environment file and shell scripts parsed. This does not run the 63 application tests. |
| Application tests | Runs only when `economics/tests` exists. On this public repository that job is skipped. Skipped is not a passing application-test result. |

The workflow runs on pull requests and on pushes to `main` or `feat/cloud-dev-env-v1-from-main`. Its token permission is `contents: read`. It has no cloud credentials.

`feat/cloud-dev-env-v1` remains the unrelated root-commit backup. It has no common ancestor with `main` and is not the integration branch.

`.github/workflows/gcp-staging-plan.yml` is manual (`workflow_dispatch`) and only accepts `plan`. It checks out the repository and does not call `gcloud`. It uses the GitHub environment name `musicchain-staging`. Create that environment and add required reviewers before the first manual run, so GitHub does not leave an unprotected environment behind.

## Google Cloud authentication

Do not create a service-account JSON key.

Create these identities only after approval, in project `musicchain-i3-lab`:

1. A Workload Identity Pool, for example `musicchain-github`, location `global`.
2. A GitHub provider limited to repository `I3lackout/musicchaini3`.
3. A dedicated service account, for example `musicchain-github-ci`.
4. A second service account for a future staging runtime. Do not reuse the default Compute Engine service account.

Suggested attribute condition on the GitHub provider:

```text
assertion.repository == 'I3lackout/musicchaini3'
```

For a plan job, grant only:

- `roles/run.viewer`
- `roles/artifactregistry.reader`
- `roles/cloudbuild.builds.viewer`

Add writer roles only on the deployment account, and only when a staging deploy has been approved:

- `roles/cloudbuild.builds.editor`
- `roles/artifactregistry.writer`
- `roles/run.developer`
- `roles/iam.serviceAccountUser` on the staging runtime service account

Store the provider resource name and service-account email as GitHub environment variables on `musicchain-staging`, not as a downloaded key. A future deploy job must request `id-token: write` and use Workload Identity Federation. Pull-request workflows from forks must not receive that token. Keep deployment off `pull_request` and on `workflow_dispatch` with the protected environment.

Example shape for a later auth step, after the identities exist:

```yaml
permissions:
  contents: read
  id-token: write
steps:
  - uses: google-github-actions/auth@v2
    with:
      workload_identity_provider: ${{ vars.GCP_WORKLOAD_IDENTITY_PROVIDER }}
      service_account: ${{ vars.GCP_SERVICE_ACCOUNT }}
```

## Staging plan

Leave `i3-economics-intelligence` unchanged. When a staging deploy is approved, create a separate Cloud Run service such as `i3-economics-intelligence-staging` from the existing `i3-services` Artifact Registry.

Recommended limits for that new service:

- Region `europe-west3`
- Minimum instances `0`
- Maximum instances `1`
- Memory `256Mi`
- CPU `1`
- Concurrency `10`
- Request timeout `60`
- Ingress authenticated invocation only
- Cloud Build timeout `600` seconds
- No production `DATABASE_URL`, payment keys, or VPS SSH keys

MusicChain-iThree itself is not packaged for Cloud Run in this version. Do not point a Cloud Run service at the production MariaDB instance.

## Economics Intelligence

The service is not part of this repository. On this machine it lives in `MusicChain-iThree-lab/i3-economics-intelligence`. Its checked-in app version is `0.4.0-dev`. `requirements.txt` there pins FastAPI `0.142.2` and Uvicorn `0.54.0`. The Dockerfile uses `python:3.12-slim`.

Routes present in that app include:

- `GET /health`
- `POST /api/v1/economics/resources/analyze`
- `POST /api/v1/economics/participation/analyze`
- `POST /api/v1/economics/participation/score`
- `POST /api/v1/economics/pricing/simulate`
- `POST /api/v1/economics/forecast`
- `POST /api/v1/integration/economics/evaluate`
- `POST /api/v1/economics/events/analyze`
- `POST /api/v1/economics/events/reconcile`

`musicchain/economics/ithree_engine.py` already records the Cloud Run URL and sets `connected_to_ithree` to false. It states that member events are not sent. Keep that boundary.

Integration to add later, after approval:

1. Keep the service in its own repository and image.
2. Give the MusicChain staging runtime `roles/run.invoker` on the staging Cloud Run service only.
3. Call it with a Google-signed ID token audience equal to the staging URL.
4. Send synthetic or explicitly approved fixtures. Do not export member ledgers, balances, or payment records.
5. Treat XP and thermodynamic resources as separate ledgers. This cloud task does not change either one.

The previously reported image tag `0.4.3-dev` and a count of about 150 passing tests were not re-verified inside that repository. Do not overwrite that project from this checkout.

## Cost and retention

Target the first experiments at €10–20. Create a budget in Google Cloud billing with alerts at 50% and 100%. Alerts do not stop spend. The hard limits are the technical ones above: scale from zero, max one instance, small memory, and no automatic deploy.

Also configure, when billing changes are approved:

- Cloud Logging retention at 30 days or less for this project, with exclusions for health-check noise
- Artifact Registry cleanup of untagged images older than 14 days
- Cloud Build timeout of 10 minutes
- No new public IP, SQL instance, or NAT gateway for V1

## Owner approval still required

- Push this branch to `github.com/I3lackout/musicchaini3`
- Create the protected GitHub environment `musicchain-staging`
- Create the Workload Identity pool, provider, and service accounts
- Create the billing budget
- Decide whether a staging Cloud Run service may be created
- Rotate the database credential that previously lived in local application files and backups
