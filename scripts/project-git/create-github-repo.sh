#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  create-github-repo.sh --project-dir /path/to/project --repo-name repo-name [options]

Options:
  --project-dir    Existing Git project directory. Required.
  --repo-name      GitHub repository name, or owner/name. Required.
  --visibility     Repository visibility: private or public. Defaults to private.
  --description    Optional repository description.
  --remote-name    Git remote name. Defaults to origin.
  --help           Show this help message.

This stack-agnostic helper uses GitHub CLI to create a repository, add the
remote, and push the current branch with upstream tracking. It never stores
credentials. GitHub CLI must already be installed and authenticated.
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

PROJECT_DIR=""
REPO_NAME=""
VISIBILITY="private"
DESCRIPTION=""
REMOTE_NAME="origin"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --project-dir)
      require_value "$1" "${2:-}"
      PROJECT_DIR="$2"
      shift 2
      ;;
    --repo-name)
      require_value "$1" "${2:-}"
      REPO_NAME="$2"
      shift 2
      ;;
    --visibility)
      require_value "$1" "${2:-}"
      VISIBILITY="$2"
      shift 2
      ;;
    --description)
      require_value "$1" "${2:-}"
      DESCRIPTION="$2"
      shift 2
      ;;
    --remote-name)
      require_value "$1" "${2:-}"
      REMOTE_NAME="$2"
      shift 2
      ;;
    --help)
      usage
      exit 0
      ;;
    *)
      error "Unknown option: $1"
      ;;
  esac
done

[[ -n "$PROJECT_DIR" ]] || error "--project-dir is required."
[[ -n "$REPO_NAME" ]] || error "--repo-name is required."
[[ -d "$PROJECT_DIR" ]] || error "Project directory does not exist: $PROJECT_DIR"
[[ -d "$PROJECT_DIR/.git" ]] || error "Project directory is not a Git repository: $PROJECT_DIR"

case "$VISIBILITY" in
  private|public)
    ;;
  *)
    error "--visibility must be private or public."
    ;;
esac

command -v git >/dev/null 2>&1 || error "git is not installed or not available in PATH."
command -v gh >/dev/null 2>&1 || error "GitHub CLI (gh) is not installed or not available in PATH."

if ! gh auth status >/dev/null 2>&1; then
  error "GitHub CLI is not authenticated. Run 'gh auth status' to inspect, then 'gh auth login' if needed."
fi

if git -C "$PROJECT_DIR" remote get-url "$REMOTE_NAME" >/dev/null 2>&1; then
  error "Git remote already exists: $REMOTE_NAME"
fi

CURRENT_BRANCH="$(git -C "$PROJECT_DIR" rev-parse --abbrev-ref HEAD)"
[[ "$CURRENT_BRANCH" != "HEAD" ]] || error "Project is in detached HEAD state and cannot be pushed safely."

gh_args=(repo create "$REPO_NAME" "--$VISIBILITY" --source "$PROJECT_DIR" --remote "$REMOTE_NAME")

if [[ -n "$DESCRIPTION" ]]; then
  gh_args+=(--description "$DESCRIPTION")
fi

gh "${gh_args[@]}"
git -C "$PROJECT_DIR" push -u "$REMOTE_NAME" "$CURRENT_BRANCH"

REMOTE_URL="$(git -C "$PROJECT_DIR" remote get-url "$REMOTE_NAME" 2>/dev/null || true)"

printf 'Success: created GitHub repository and pushed %s.\n' "$CURRENT_BRANCH"
printf 'Repository: %s\n' "$REPO_NAME"
printf 'Remote: %s\n' "$REMOTE_NAME"

if [[ -n "$REMOTE_URL" ]]; then
  printf 'Repository URL: %s\n' "$REMOTE_URL"
fi
