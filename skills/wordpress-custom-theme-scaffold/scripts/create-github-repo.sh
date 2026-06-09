#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/../../.." && pwd)"
SHARED_SCRIPT="$REPO_DIR/scripts/project-git/create-github-repo.sh"

[[ -x "$SHARED_SCRIPT" ]] || {
  printf 'Error: shared GitHub helper is not executable: %s\n' "$SHARED_SCRIPT" >&2
  exit 1
}

exec "$SHARED_SCRIPT" "$@"
