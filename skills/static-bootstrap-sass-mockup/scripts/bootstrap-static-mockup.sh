#!/usr/bin/env bash
set -euo pipefail

DEFAULT_OUTPUT_DIR="/Users/jean-le-grandbokassa/Sites"
DEFAULT_AUTHOR_NAME="Jean Le Grand Bokassa"
DEFAULT_PAGES="index,about,services,works,contact"

usage() {
  cat <<'USAGE'
Usage:
  bootstrap-static-mockup.sh [-h|--help]

Interactive prompts collect:
  project name
  project slug
  author name
  pages to create
  output directory
  whether to run npm install
  whether to run npm run dev after generation
  whether to initialize Git
  whether to create a GitHub repository
  whether to prepare or connect the project with Netlify

Defaults:
  output directory: /Users/jean-le-grandbokassa/Sites
  author name: Jean Le Grand Bokassa
  pages: index,about,services,works,contact

This orchestrator calls scripts/create-static-mockup.sh with the collected
values. Optional Git and GitHub automation delegates to the shared helpers in
scripts/project-git/. Optional Netlify setup delegates to the shared helper in
scripts/project-netlify/. It does not use Vite, use Webpack, or duplicate
scaffold, Git, GitHub, or Netlify logic.
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
  printf 'Git initialized: %s\n' "$GIT_INIT_STATUS"
  printf 'GitHub repository created: %s\n' "$GITHUB_STATUS"
  printf 'Netlify step: %s\n' "$NETLIFY_STATUS"

  if [[ -n "$REPO_NAME" ]]; then
    printf 'GitHub repository name: %s\n' "$REPO_NAME"
  fi

  if [[ -n "$REPO_VISIBILITY" ]]; then
    printf 'GitHub repository visibility: %s\n' "$REPO_VISIBILITY"
  fi

  if [[ -n "$REPOSITORY_URL" ]]; then
    printf 'GitHub repository URL: %s\n' "$REPOSITORY_URL"
  fi

  printf '\nNext steps:\n'

  if [[ "$NPM_INSTALL_STATUS" != "yes" ]]; then
    printf '%s\n' '- Run npm install before local development or Netlify readiness checks.'
  elif [[ "$NPM_DEV_STATUS" != "yes" ]]; then
    printf '%s\n' '- Run npm run dev when you are ready to review the mockup locally.'
  fi

  if [[ "$NETLIFY_STATUS" == "skipped" ]]; then
    printf '%s\n' '- Run netlifybootstrap later if you want to connect the project to Netlify.'
  elif [[ "$NETLIFY_STATUS" == "completed" ]]; then
    printf '%s\n' '- Review the connected Netlify site settings and deployment configuration.'
  fi
}

if [[ $# -gt 0 ]]; then
  case "$1" in
    -h|--help)
      usage
      exit 0
      ;;
    *)
      error "Unknown option: $1"
      ;;
  esac
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/../../.." && pwd)"
CREATE_SCRIPT="$SCRIPT_DIR/create-static-mockup.sh"
INIT_GIT_SCRIPT="$REPO_DIR/scripts/project-git/init-git-project.sh"
CREATE_GITHUB_SCRIPT="$REPO_DIR/scripts/project-git/create-github-repo.sh"
NETLIFY_BOOTSTRAP_SCRIPT="$REPO_DIR/scripts/project-netlify/bootstrap-netlify-site.sh"

[[ -x "$CREATE_SCRIPT" ]] || error "Generator script is not executable: $CREATE_SCRIPT"
[[ -x "$INIT_GIT_SCRIPT" ]] || error "Shared Git helper is not executable: $INIT_GIT_SCRIPT"
[[ -x "$CREATE_GITHUB_SCRIPT" ]] || error "Shared GitHub helper is not executable: $CREATE_GITHUB_SCRIPT"
[[ -x "$NETLIFY_BOOTSTRAP_SCRIPT" ]] || error "Shared Netlify helper is not executable: $NETLIFY_BOOTSTRAP_SCRIPT"

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
GIT_INIT_STATUS="no"
GITHUB_STATUS="no"
REPO_NAME=""
REPO_VISIBILITY=""
REPOSITORY_URL=""
RUN_NETLIFY=0
NETLIFY_STATUS="skipped"

if prompt_yes_no "Initialize Git repository" "no"; then
  INITIAL_BRANCH="$(prompt_value "Initial branch name" "main" 1)"
  COMMIT_MESSAGE="$(prompt_value "Initial commit message" "Initial commit" 1)"

  printf '\nInitializing Git repository...\n'
  "$INIT_GIT_SCRIPT" \
    --project-dir "$PROJECT_PATH" \
    --initial-branch "$INITIAL_BRANCH" \
    --commit-message "$COMMIT_MESSAGE"
  GIT_INIT_STATUS="yes"
fi

if prompt_yes_no "Create GitHub repository" "no"; then
  if [[ "$GIT_INIT_STATUS" != "yes" ]]; then
    printf '\nSkipping GitHub repository creation because Git was not initialized by this script.\n' >&2
  else
    REPO_NAME="$(prompt_value "GitHub repository name" "$PROJECT_SLUG" 1)"
    REPO_VISIBILITY="$(prompt_value "Repository visibility" "private" 1)"
    REPO_DESCRIPTION="$(prompt_value "Repository description" "" 0)"

    github_args=(
      --project-dir "$PROJECT_PATH"
      --repo-name "$REPO_NAME"
      --visibility "$REPO_VISIBILITY"
    )

    if [[ -n "$REPO_DESCRIPTION" ]]; then
      github_args+=(--description "$REPO_DESCRIPTION")
    fi

    printf '\nCreating GitHub repository...\n'
    "$CREATE_GITHUB_SCRIPT" "${github_args[@]}"
    GITHUB_STATUS="yes"
    REPOSITORY_URL="$(git -C "$PROJECT_PATH" remote get-url origin 2>/dev/null || true)"
  fi
fi

if prompt_yes_no "Prepare/connect project with Netlify" "no"; then
  RUN_NETLIFY=1

  printf '\nBefore Netlify setup:\n'
  printf '%s\n' '- The project should already be a Git repository.'
  printf '%s\n' '- The project should already have a GitHub remote.'
  printf '%s\n' '- The shared Netlify bootstrap will run its own readiness, Git, Netlify CLI, and deploy prompts.'

  if ! git -C "$PROJECT_PATH" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    printf '%s\n' 'Warning: this project is not currently a Git repository. Netlify init will fail unless that is fixed first.' >&2
  elif [[ -z "$(git -C "$PROJECT_PATH" remote 2>/dev/null)" ]]; then
    printf '%s\n' 'Warning: this project does not currently have a Git remote. Netlify init expects a GitHub remote or another Git remote.' >&2
  fi
fi

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

if [[ "$RUN_NETLIFY" -eq 1 ]]; then
  printf '\nStarting shared Netlify bootstrap...\n'

  if "$NETLIFY_BOOTSTRAP_SCRIPT" --project-dir "$PROJECT_PATH"; then
    NETLIFY_STATUS="completed"
  else
    NETLIFY_STATUS="failed"
    print_summary
    exit 1
  fi
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
