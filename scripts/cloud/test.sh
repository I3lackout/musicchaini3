#!/usr/bin/env bash
# Isolated test entrypoint. Refuses non-SQLite DATABASE_URL values and does
# not import app.py, which opens a database connection at import time.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT"

if [[ ! -d "$ROOT/economics/tests" ]]; then
  python3 -m json.tool "$ROOT/.cursor/environment.json" >/dev/null
  bash -n "$ROOT/scripts/cloud/install.sh"
  bash -n "$ROOT/scripts/cloud/start.sh"
  bash -n "$ROOT/scripts/cloud/test.sh"
  echo "CONFIGURATION_ONLY"
  echo "APPLICATION_TESTS=not-run"
  echo "economics/tests is not in this checkout. This is not a passing application-test result."
  exit 0
fi

VENV="${MUSICCHAIN_VENV:-$ROOT/.venv}"
PY="$VENV/bin/python"

if [[ ! -x "$PY" ]]; then
  echo "Virtualenv missing at $VENV. Run scripts/cloud/install.sh first." >&2
  exit 1
fi

# Root __init__.py builds the Flask app on import and would otherwise use
# DEFAULT_MYSQL_URI. Force the isolated SQLite URI before pytest starts.
for name in DATABASE_URL SQLALCHEMY_DATABASE_URI DEFAULT_MYSQL_URI; do
  value="${!name:-}"
  if [[ -n "$value" ]]; then
    case "$value" in
      sqlite:*|sqlite3:*) ;;
      *)
        echo "Refusing tests because $name is not SQLite." >&2
        exit 1
        ;;
    esac
  fi
done
export DATABASE_URL="sqlite:///:memory:"
export SQLALCHEMY_DATABASE_URI="sqlite:///:memory:"
export DEFAULT_MYSQL_URI="sqlite:///:memory:"

"$PY" -m compileall -q economics musicchain/economics
"$PY" -m pytest -q --tb=short
