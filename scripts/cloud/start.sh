#!/usr/bin/env bash
# Cloud Agent session check. This does not start Flask, Waitress, MariaDB,
# or any process that could reach the production VPS.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
VENV="${MUSICCHAIN_VENV:-$ROOT/.venv}"

if [[ ! -d "$ROOT/economics/tests" ]]; then
  echo "cloud-start-ok"
  echo "mode=repository-without-application-tests"
  exit 0
fi

if [[ ! -x "$VENV/bin/python" ]]; then
  echo "Virtualenv missing at $VENV. Run scripts/cloud/install.sh first." >&2
  exit 1
fi

"$VENV/bin/python" - <<'PY'
import flask
import pytest
import sqlalchemy
print("cloud-start-ok")
print("flask-test-server", "not-started")
PY
