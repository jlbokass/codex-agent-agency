#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  bootstrap-netlify-site.sh [options]

Options:
  --project-dir    Existing static project directory. Optional.
  -h, --help    Show this help message.

Interactive Netlify workflow for static projects. The script can run the
Netlify readiness check, initialize or link the project with Netlify for
continuous deployment, and optionally run a manual Netlify deploy.

This script does not store Netlify tokens, credentials, or secrets.
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

prompt_required_path() {
  local prompt="$1"
  local default_value="$2"
  local value=""

  while [[ -z "$value" ]]; do
    printf '%s [%s]: ' "$prompt" "$default_value" >&2
    read -r value

    if [[ -z "$value" ]]; then
      value="$default_value"
    fi
  done

  printf '%s\n' "$value"
}

prompt_yes_no() {
  local prompt="$1"
  local default_value="$2"
  local answer=""
  local suffix=""

  case "$default_value" in
    yes)
      suffix="Y/n"
      ;;
    no)
      suffix="y/N"
      ;;
    *)
      error "Invalid yes/no default: $default_value"
      ;;
  esac

  while true; do
    printf '%s [%s]: ' "$prompt" "$suffix" >&2
    read -r answer

    if [[ -z "$answer" ]]; then
      answer="$default_value"
    fi

    case "$answer" in
      y|Y|yes|YES|Yes)
        return 0
        ;;
      n|N|no|NO|No)
        return 1
        ;;
      *)
        printf 'Please answer yes or no.\n' >&2
        ;;
    esac
  done
}

print_summary() {
  local project_dir="$1"
  local readiness_status="$2"
  local init_status="$3"
  local deploy_status="$4"

  printf '\nNetlify workflow summary\n'
  printf 'Project directory: %s\n' "$project_dir"
  printf 'Readiness check: %s\n' "$readiness_status"
  printf 'Netlify init/link: %s\n' "$init_status"
  printf 'Manual deploy: %s\n' "$deploy_status"
  printf '\nNext steps:\n'
  printf '%s\n' '- Review Netlify site settings in the Netlify dashboard.'
  printf '%s\n' '- Confirm the build command is npm run build.'
  printf '%s\n' '- Confirm the publish directory is public.'
  printf '%s\n' '- Prefer continuous deployment from the connected Git repository.'
}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CHECK_SCRIPT="$SCRIPT_DIR/check-netlify-ready.sh"
INIT_SCRIPT="$SCRIPT_DIR/init-netlify-site.sh"
DEFAULT_PROJECT_DIR="/Users/jean-le-grandbokassa/Sites"
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

[[ -x "$CHECK_SCRIPT" ]] || error "Readiness checker is not executable: $CHECK_SCRIPT"
[[ -x "$INIT_SCRIPT" ]] || error "Netlify init helper is not executable: $INIT_SCRIPT"

printf 'Netlify static project bootstrap\n'
printf 'Use this workflow after static project generation and Git/GitHub setup.\n'
printf 'Continuous deployment through netlify init is the preferred workflow.\n\n'

if [[ -z "$PROJECT_DIR" ]]; then
  PROJECT_DIR="$(prompt_required_path "Full project directory path" "$DEFAULT_PROJECT_DIR")"
else
  printf 'Project directory: %s\n' "$PROJECT_DIR"
fi

[[ -d "$PROJECT_DIR" ]] || error "Project directory does not exist: $PROJECT_DIR"

READINESS_STATUS="skipped"
INIT_STATUS="skipped"
DEPLOY_STATUS="skipped"
READINESS_SUCCEEDED="no"

if prompt_yes_no "Run Netlify readiness check now?" "yes"; then
  printf '\nRunning Netlify readiness check...\n'

  if "$CHECK_SCRIPT" --project-dir "$PROJECT_DIR"; then
    READINESS_STATUS="passed"
    READINESS_SUCCEEDED="yes"
  else
    READINESS_STATUS="failed"
    INIT_STATUS="not run because readiness check failed"
    DEPLOY_STATUS="not run because readiness check failed"
    printf '\nNetlify readiness check failed. Fix the reported issues before running Netlify init.\n' >&2
    print_summary "$PROJECT_DIR" "$READINESS_STATUS" "$INIT_STATUS" "$DEPLOY_STATUS"
    exit 1
  fi
else
  printf 'Skipping readiness check. Make sure npm run build succeeds before Netlify setup.\n'
fi

INIT_DEFAULT="no"
if [[ "$READINESS_SUCCEEDED" == "yes" ]]; then
  INIT_DEFAULT="yes"
fi

if prompt_yes_no "Initialize or link this project with Netlify?" "$INIT_DEFAULT"; then
  printf '\nBefore Netlify init:\n'
  printf '%s\n' '- Netlify CLI may ask interactive questions.'
  printf '%s\n' '- The project must already be a Git repository.'
  printf '%s\n' '- The project should already have a GitHub remote.'
  printf '%s\n\n' '- netlify init connects the project for continuous deployment.'

  if "$INIT_SCRIPT" --project-dir "$PROJECT_DIR"; then
    INIT_STATUS="completed"
  else
    INIT_STATUS="failed"
    DEPLOY_STATUS="not run because Netlify init failed"
    printf '\nNetlify init failed. Fix the reported issues before retrying.\n' >&2
    print_summary "$PROJECT_DIR" "$READINESS_STATUS" "$INIT_STATUS" "$DEPLOY_STATUS"
    exit 1
  fi
else
  INIT_STATUS="skipped"
fi

if prompt_yes_no "Run an optional manual deploy now?" "no"; then
  if ! command -v netlify >/dev/null 2>&1; then
    DEPLOY_STATUS="failed because Netlify CLI is missing"
    printf '\nNetlify CLI is not installed or not available in PATH.\n' >&2
    print_summary "$PROJECT_DIR" "$READINESS_STATUS" "$INIT_STATUS" "$DEPLOY_STATUS"
    exit 1
  fi

  printf 'Manual deploy assumes this project is already linked to a Netlify site.\n'

  if prompt_yes_no "Run this manual deploy to production?" "no"; then
    printf '\nWarning: production deploy selected. This will publish to the production site.\n'

    if prompt_yes_no "Continue with production deploy?" "no"; then
      if (cd "$PROJECT_DIR" && netlify deploy --prod); then
        DEPLOY_STATUS="production deploy completed"
      else
        DEPLOY_STATUS="production deploy failed"
        print_summary "$PROJECT_DIR" "$READINESS_STATUS" "$INIT_STATUS" "$DEPLOY_STATUS"
        exit 1
      fi
    else
      DEPLOY_STATUS="production deploy cancelled"
    fi
  else
    if (cd "$PROJECT_DIR" && netlify deploy); then
      DEPLOY_STATUS="draft deploy completed"
    else
      DEPLOY_STATUS="draft deploy failed"
      print_summary "$PROJECT_DIR" "$READINESS_STATUS" "$INIT_STATUS" "$DEPLOY_STATUS"
      exit 1
    fi
  fi
else
  DEPLOY_STATUS="skipped"
fi

print_summary "$PROJECT_DIR" "$READINESS_STATUS" "$INIT_STATUS" "$DEPLOY_STATUS"
