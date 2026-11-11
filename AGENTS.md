# MusicChain-iThree agent notes

## Cursor Cloud specific instructions

- Install and test with `bash scripts/cloud/install.sh` and `bash scripts/cloud/test.sh`.
- Do not import `app.py` or start Waitress. Importing `app.py` connects to the configured database immediately.
- Do not deploy, change DNS, restart the production VPS, or read production secrets into logs.
- Google Cloud workflow `.github/workflows/gcp-staging-plan.yml` is plan-only.
- Setup, IAM, and cost limits are in `cloud/I3_CLOUD_DEVELOPMENT_V1.md`.
