#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  init-netlify-site.sh --project-dir /path/to/static-project

Options:
  --project-dir    Existing static project directory. Required.
  -h, --help       Show this help message.

This stack-agnostic helper runs netlify init for a Git-backed static project.
Netlify CLI may ask interactive questions. This script does not store Netlify
tokens, credentials, or secrets.
USAGE
}

error() {
  printf 'Error: %s\n' "$1" >&2
  exit 1
}

require_value() {
  local option="$1"
  local value="${2:-}"

  if [[ -z "$value" || "$value" == --* ]]; then
    error "$option requires a value."
  fi
}

status_output_indicates_unlinked_project() {
  local output="$1"

  printf '%s\n' "$output" | grep -Eiq 'netlify link|not .*linked|not .*connected|no linked site'
}

PROJECT_DIR=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --project-dir)
      require_value "$1" "${2:-}"
      PROJECT_DIR="$2"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      error "Unknown option: $1"
      ;;
  esac
done

[[ -n "$PROJECT_DIR" ]] || error "--project-dir is required."
[[ -d "$PROJECT_DIR" ]] || error "Project directory does not exist: $PROJECT_DIR"

command -v git >/dev/null 2>&1 || error "git is not installed or not available in PATH."

if ! git -C "$PROJECT_DIR" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  error "Project directory is not a Git repository: $PROJECT_DIR"
fi

if [[ -z "$(git -C "$PROJECT_DIR" remote 2>/dev/null)" ]]; then
  error "Project Git repository has no remote. Set up GitHub or another Git remote before Netlify initialization."
fi

command -v netlify >/dev/null 2>&1 || error "Netlify CLI is not installed or not available in PATH. Install it, then run 'netlify login'."

NETLIFY_STATUS_OUTPUT=""
if NETLIFY_STATUS_OUTPUT="$(cd "$PROJECT_DIR" && netlify status 2>&1)"; then
  if [[ -n "$NETLIFY_STATUS_OUTPUT" ]]; then
    printf '%s\n' "$NETLIFY_STATUS_OUTPUT"
  fi
else
  printf '%s\n' "$NETLIFY_STATUS_OUTPUT" >&2

  if status_output_indicates_unlinked_project "$NETLIFY_STATUS_OUTPUT"; then
    printf 'Netlify CLI is authenticated, but this project is not linked yet. Continuing to netlify init.\n'
  else
    error "Netlify CLI status check failed. Run 'netlify login' and try again."
  fi
fi

printf 'Running netlify init in %s\n' "$PROJECT_DIR"
printf 'Netlify CLI may ask interactive questions about your team, site, and repository.\n'
(cd "$PROJECT_DIR" && netlify init)

printf 'Success: Netlify site initialization completed for %s\n' "$PROJECT_DIR"
