#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  init-git-project.sh --project-dir /path/to/project [options]

Options:
  --project-dir       Existing project directory. Required.
  --initial-branch    Initial branch name. Defaults to main.
  --commit-message    Initial commit message. Defaults to "Initial commit".
  --help              Show this help message.

This stack-agnostic helper initializes a local Git repository and creates the
initial commit. It does not create GitHub repositories, configure remotes, push
code, or store credentials.
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
INITIAL_BRANCH="main"
COMMIT_MESSAGE="Initial commit"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --project-dir)
      require_value "$1" "${2:-}"
      PROJECT_DIR="$2"
      shift 2
      ;;
    --initial-branch)
      require_value "$1" "${2:-}"
      INITIAL_BRANCH="$2"
      shift 2
      ;;
    --commit-message)
      require_value "$1" "${2:-}"
      COMMIT_MESSAGE="$2"
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
[[ -d "$PROJECT_DIR" ]] || error "Project directory does not exist: $PROJECT_DIR"
[[ ! -e "$PROJECT_DIR/.git" ]] || error "Project directory is already a Git repository: $PROJECT_DIR"

command -v git >/dev/null 2>&1 || error "git is not installed or not available in PATH."

git -C "$PROJECT_DIR" init -b "$INITIAL_BRANCH"
git -C "$PROJECT_DIR" add .
git -C "$PROJECT_DIR" commit -m "$COMMIT_MESSAGE"

printf 'Success: initialized Git repository in %s\n' "$PROJECT_DIR"
printf 'Initial branch: %s\n' "$INITIAL_BRANCH"
printf 'Initial commit: %s\n' "$COMMIT_MESSAGE"
