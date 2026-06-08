#!/usr/bin/env bash
set -euo pipefail

DEFAULT_OUTPUT_DIR="/Users/jean-le-grandbokassa/Sites"
DEFAULT_AUTHOR_NAME="Jean Le Grand Bokassa"
DEFAULT_PAGES="index,about,services,works,contact"

usage() {
  cat <<'USAGE'
Usage:
  bootstrap-static-mockup.sh [--help]

Interactive prompts collect:
  project name
  project slug
  author name
  pages to create
  output directory
  whether to run npm install
  whether to run npm run dev after generation

Defaults:
  output directory: /Users/jean-le-grandbokassa/Sites
  author name: Jean Le Grand Bokassa
  pages: index,about,services,works,contact

This orchestrator calls scripts/create-static-mockup.sh with the collected
values. It does not initialize Git, create GitHub repositories, use Vite, use
Webpack, or duplicate scaffold generation logic.
USAGE
}

error() {
  printf 'Error: %s\n' "$1" >&2
  exit 1
}

prompt_value() {
  local label="$1"
  local default_value="$2"
  local required="$3"
  local answer

  if [[ ! -t 0 ]]; then
    if [[ -n "$default_value" ]]; then
      printf '%s: %s\n' "$label" "$default_value" >&2
      printf '%s' "$default_value"
      return
    fi

    if [[ "$required" -eq 1 ]]; then
      error "$label is required in non-interactive mode."
    fi

    printf ''
    return
  fi

  while true; do
    if [[ -n "$default_value" ]]; then
      printf '%s [%s]: ' "$label" "$default_value" >&2
    else
      printf '%s: ' "$label" >&2
    fi

    IFS= read -r answer
    answer="${answer:-$default_value}"

    if [[ -n "$answer" || "$required" -eq 0 ]]; then
      printf '%s' "$answer"
      return
    fi

    printf 'Please provide a value.\n' >&2
  done
}

prompt_yes_no() {
  local label="$1"
  local default_value="$2"
  local answer

  if [[ ! -t 0 ]]; then
    printf '%s: %s\n' "$label" "$default_value" >&2
    [[ "$default_value" == "yes" ]] && return 0 || return 1
  fi

  while true; do
    if [[ "$default_value" == "yes" ]]; then
      printf '%s [Y/n]: ' "$label" >&2
    else
      printf '%s [y/N]: ' "$label" >&2
    fi

    IFS= read -r answer
    answer="${answer:-$default_value}"

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

print_manual_steps() {
  printf '\nManual next steps:\n'
  printf 'cd "%s"\n' "$PROJECT_PATH"
  printf 'npm install\n'
  printf 'npm run dev\n'
}

print_summary() {
  printf '\nBootstrap summary\n'
  printf '%s\n' '-----------------'
  printf 'Project path: %s\n' "$PROJECT_PATH"
  printf 'Pages created: %s\n' "$PAGES"
  printf 'npm install run: %s\n' "$NPM_INSTALL_STATUS"
  printf 'npm run dev started: %s\n' "$NPM_DEV_STATUS"
}

if [[ $# -gt 0 ]]; then
  case "$1" in
    --help)
      usage
      exit 0
      ;;
    *)
      error "Unknown option: $1"
      ;;
  esac
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CREATE_SCRIPT="$SCRIPT_DIR/create-static-mockup.sh"

[[ -x "$CREATE_SCRIPT" ]] || error "Generator script is not executable: $CREATE_SCRIPT"

printf 'Static Bootstrap Sass mockup bootstrap\n'
printf '%s\n' '--------------------------------------'

PROJECT_NAME="$(prompt_value "Project name" "" 1)"
PROJECT_SLUG="$(prompt_value "Project slug" "" 1)"
AUTHOR_NAME="$(prompt_value "Author name" "$DEFAULT_AUTHOR_NAME" 1)"
PAGES="$(prompt_value "Pages to create" "$DEFAULT_PAGES" 1)"
OUTPUT_DIR="$(prompt_value "Output directory" "$DEFAULT_OUTPUT_DIR" 1)"

if prompt_yes_no "Run npm install after generation" "no"; then
  RUN_NPM_INSTALL=1
else
  RUN_NPM_INSTALL=0
fi

if prompt_yes_no "Run npm run dev after generation" "no"; then
  RUN_NPM_DEV=1
else
  RUN_NPM_DEV=0
fi

printf '\nGenerating static mockup project...\n'
"$CREATE_SCRIPT" \
  --project-name "$PROJECT_NAME" \
  --project-slug "$PROJECT_SLUG" \
  --author-name "$AUTHOR_NAME" \
  --pages "$PAGES" \
  --output-dir "$OUTPUT_DIR"

PROJECT_PATH="$OUTPUT_DIR/$PROJECT_SLUG"
NPM_INSTALL_STATUS="no"
NPM_DEV_STATUS="no"

if [[ "$RUN_NPM_INSTALL" -eq 1 ]]; then
  printf '\nInstalling npm dependencies...\n'
  (cd "$PROJECT_PATH" && npm install)
  NPM_INSTALL_STATUS="yes"
else
  if [[ "$RUN_NPM_DEV" -eq 1 ]]; then
    printf '\nSkipping npm run dev because dependencies were not installed by this script.\n' >&2
  fi

  RUN_NPM_DEV=0
fi

if [[ "$RUN_NPM_DEV" -eq 1 ]]; then
  NPM_DEV_STATUS="yes"
fi

print_summary

if [[ "$RUN_NPM_INSTALL" -ne 1 ]]; then
  print_manual_steps
elif [[ "$RUN_NPM_DEV" -ne 1 ]]; then
  printf '\nNext manual step:\n'
  printf 'cd "%s"\n' "$PROJECT_PATH"
  printf 'npm run dev\n'
fi

if [[ "$RUN_NPM_DEV" -eq 1 ]]; then
  printf '\nStarting npm run dev now.\n'
  printf 'This terminal will stay occupied by BrowserSync and Sass watch until you stop it.\n'
  (cd "$PROJECT_PATH" && npm run dev)
fi
