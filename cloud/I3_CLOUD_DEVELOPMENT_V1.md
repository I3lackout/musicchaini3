# I3 Cloud Staging Plan

## Manual plan check

The GitHub Actions workflow accepts the `plan` input and checks that this guide is present. The job uses read-only repository permissions. It has no Google Cloud credentials or deployment steps.

Before the first run, configure the `musicchain-staging` GitHub environment with required reviewers and restrict it to `main`. The workflow file must be on the default branch before it can be dispatched.

## Staging acceptance criteria

- Use a dedicated Cloud Run staging service in `europe-west3` and deploy an approved image by digest. Keep the existing service outside the rollout.
- Use GitHub OIDC through Workload Identity Federation for any future cloud job. Restrict federation by numeric repository and owner IDs and the approved workflow context. Give separately scoped permissions to the plan, deployment, runtime and smoke-test identities. Use short-lived credentials.
- Choose ingress to match the approved caller's network path. Keep the Cloud Run Invoker IAM check enabled and grant invocation only to the approved caller on the staging service. Verify effective IAM before testing.
- Send a fixed synthetic fixture request over HTTPS with a Google-signed ID token whose audience is the staging service URL. Verify the fixture response, denial without a token and denial for an identity without invocation rights. Use synthetic data throughout and keep authorization headers out of logs.
- Start at zero minimum instances and one maximum instance at service level, with 1 CPU, 256 MiB, concurrency 10 and a 60-second request timeout. Set a 600-second build timeout if a build is needed. Verify the billing account, available trial credits, budget scope and alert recipients. Use a €10–20 trial target with alerts at 50% and 100%. Alerts alone do not stop spending. Account for build, registry and logging charges when setting the limits.
- Keep the runtime isolated from production systems and credentials.

## Rollback

Before deployment, assign an owner and record the image digest, service settings and IAM changes. Treat a failed authentication or fixture check as a rollback trigger. On the first rollout, have the owner disable the staging service if the check fails. On subsequent rollouts, restore traffic to the last verified revision and repeat the smoke test. Revert IAM and ingress changes separately if they caused the failure.
