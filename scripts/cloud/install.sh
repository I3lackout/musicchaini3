#!/usr/bin/env bash
# Idempotent Cloud Agent / CI dependency install.
# Creates an isolated virtualenv and installs the pinned test requirements.
# Does not read production secrets, contact the production VPS, or start services.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT"

VENV="${MUSICCHAIN_VENV:-$ROOT/.venv}"

python3 - <<'PY'
import sys
if sys.version_info < (3, 11):
    raise SystemExit("Python 3.11 or newer is required")
print(f"Using Python {sys.version.split()[0]}")
PY

python3 -m json.tool "$ROOT/.cursor/environment.json" >/dev/null

if [[ ! -d "$ROOT/economics/tests" ]]; then
  echo "No economics/tests in this checkout."
  echo "Dependency install skipped. The public GitHub repository does not contain the application test suite."
  exit 0
fi

python3 -m venv "$VENV"
"$VENV/bin/python" -m pip install --upgrade pip
"$VENV/bin/python" -m pip install -r "$ROOT/requirements-ci.txt"

if [[ "${MUSICCHAIN_FULL_DEPS:-0}" == "1" ]]; then
  echo "MUSICCHAIN_FULL_DEPS=1: installing unpinned requirements.txt"
  "$VENV/bin/python" -m pip install -r "$ROOT/requirements.txt"
fi

echo "Install complete: $VENV"
