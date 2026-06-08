#!/usr/bin/env bash
set -euo pipefail

DEFAULT_PROJECTS_ROOT="/Users/jean-le-grandbokassa/Sites"
DEFAULT_LOCAL_SITES_ROOT="/Users/jean-le-grandbokassa/Local Sites"
DEFAULT_AUTHOR_NAME="Jean Le Grand Bokassa"

usage() {
  cat <<'USAGE'
Usage:
  bootstrap-wp-custom-project.sh [options]

Interactive options may be prefilled with long options:
  --project-name "Project Name"
  --project-slug project-slug
  --theme-name "Theme Name"
  --theme-slug theme-slug
  --php-prefix project_prefix
  --text-domain project-slug
  --author-name "Author Name"
  --projects-root "/Users/jean-le-grandbokassa/Sites"
  --with-plugin
  --plugin-name "Plugin Name"
  --plugin-slug project-slug-core
  --link-localwp
  --local-site-slug local-site-slug
  --local-sites-root "/Users/jean-le-grandbokassa/Local Sites"
  --force-localwp
  --init-git
  --initial-branch main
  --commit-message "Initial commit"
  --create-github
  --repo-name project-slug
  --visibility private
  --description "Repository description"
  --remote-name origin
  --yes
  --help

This orchestrator calls:
  scripts/create-wp-custom-theme.sh
  scripts/link-localwp.sh when Local WP linking is requested
  scripts/init-git-project.sh when Git initialization is requested
  scripts/create-github-repo.sh when GitHub repository creation is requested

Git and GitHub automation are optional. This script does not store credentials,
modify scaffold files, or duplicate placeholder replacement or symlink logic.
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

prompt_value() {
  local label="$1"
  local current="$2"
  local default_value="$3"
  local required="$4"
  local answer

  if [[ -n "$current" ]]; then
    printf '%s: %s\n' "$label" "$current" >&2
    printf '%s' "$current"
    return
  fi

  if [[ "$ASSUME_YES" -eq 1 && -n "$default_value" ]]; then
    printf '%s: %s\n' "$label" "$default_value" >&2
    printf '%s' "$default_value"
    return
  fi

  if [[ "$ASSUME_YES" -eq 1 && "$required" -eq 0 ]]; then
    printf '%s: \n' "$label" >&2
    printf ''
    return
  fi

  if [[ ! -t 0 ]]; then
    if [[ -n "$default_value" ]]; then
      printf '%s: %s\n' "$label" "$default_value" >&2
      printf '%s' "$default_value"
      return
    fi

    if [[ "$required" -eq 1 ]]; then
      error "$label is required in non-interactive mode."
    fi

    printf '%s: \n' "$label" >&2
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
  local current="$2"
  local default_value="$3"
  local answer

  if [[ -n "$current" ]]; then
    printf '%s: %s\n' "$label" "$current" >&2
    [[ "$current" == "yes" ]] && return 0 || return 1
  fi

  if [[ "$ASSUME_YES" -eq 1 ]]; then
    printf '%s: %s\n' "$label" "$default_value" >&2
    [[ "$default_value" == "yes" ]] && return 0 || return 1
  fi

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

update_project_readme_metadata() {
  local readme_file="$PROJECT_PATH/README.md"
  local metadata_file
  local theme_source="$PROJECT_PATH/theme/$THEME_SLUG"
  local theme_destination=""
  local plugin_source=""
  local plugin_destination=""

  [[ -f "$readme_file" ]] || return

  metadata_file="$(mktemp)"

  {
    printf '## Workflow State\n\n'

    if [[ "$LINK_LOCALWP" -eq 1 ]]; then
      theme_destination="$LOCAL_SITES_ROOT/$LOCAL_SITE_SLUG/app/public/wp-content/themes/$THEME_SLUG"

      printf '### Local WP Symlinks\n\n'
      printf '%s\n' '- Theme symlink created: yes'
      printf '%s `%s`\n' '- Theme source:' "$theme_source"
      printf '%s `%s`\n' '- Theme destination:' "$theme_destination"

      if [[ "$WITH_PLUGIN" -eq 1 ]]; then
        plugin_source="$PROJECT_PATH/plugin/$PLUGIN_SLUG"
        plugin_destination="$LOCAL_SITES_ROOT/$LOCAL_SITE_SLUG/app/public/wp-content/plugins/$PLUGIN_SLUG"
        printf '%s\n' '- Plugin symlink created: yes'
        printf '%s `%s`\n' '- Plugin source:' "$plugin_source"
        printf '%s `%s`\n' '- Plugin destination:' "$plugin_destination"
      else
        printf '%s\n' '- Plugin symlink created: no companion plugin was generated'
      fi
    else
      printf '%s\n' '- No Local WP symlinks were created.'
    fi

    printf '\n'

    if [[ "$INIT_GIT" -eq 1 ]]; then
      printf '%s\n' '- Git initialized: yes'
      printf '%s `%s`\n' '- Initial branch:' "$INITIAL_BRANCH"
      printf '%s `%s`\n' '- Initial commit message:' "$COMMIT_MESSAGE"
    else
      printf '%s\n' '- Git initialized: no'
    fi

    if [[ "$CREATE_GITHUB" -eq 1 ]]; then
      printf '%s\n' '- GitHub repository created: yes'
      printf '%s `%s`\n' '- Repository name:' "$REPO_NAME"
      printf '%s `%s`\n' '- Repository visibility:' "$VISIBILITY"

      if [[ -n "$GITHUB_REMOTE_URL" ]]; then
        printf '%s `%s`\n' '- Repository URL:' "$GITHUB_REMOTE_URL"
      fi
    else
      printf '%s\n' '- GitHub repository created: no'
    fi

    printf '%s\n' '- npm dependencies installed: no'
  } > "$metadata_file"

  METADATA_CONTENT="$(cat "$metadata_file")" perl -0pi -e '
    s/## Workflow State\n\n.*?\n## Notes/$ENV{METADATA_CONTENT} . "\n\n## Notes"/se;
  ' "$readme_file"

  rm -f "$metadata_file"
}

PROJECT_NAME=""
PROJECT_SLUG=""
THEME_NAME=""
THEME_SLUG=""
PHP_PREFIX=""
TEXT_DOMAIN=""
AUTHOR_NAME=""
PROJECTS_ROOT="$DEFAULT_PROJECTS_ROOT"
WITH_PLUGIN_CHOICE=""
PLUGIN_NAME=""
PLUGIN_SLUG=""
LINK_LOCALWP_CHOICE=""
LOCAL_SITE_SLUG=""
LOCAL_SITES_ROOT="$DEFAULT_LOCAL_SITES_ROOT"
FORCE_LOCALWP=0
INIT_GIT_CHOICE=""
INITIAL_BRANCH="main"
COMMIT_MESSAGE="Initial commit"
CREATE_GITHUB_CHOICE=""
REPO_NAME=""
VISIBILITY="private"
DESCRIPTION=""
REMOTE_NAME="origin"
GITHUB_REMOTE_URL=""
INIT_GIT=0
CREATE_GITHUB=0
ASSUME_YES=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --project-name)
      require_value "$1" "${2:-}"
      PROJECT_NAME="$2"
      shift 2
      ;;
    --project-slug)
      require_value "$1" "${2:-}"
      PROJECT_SLUG="$2"
      shift 2
      ;;
    --theme-name)
      require_value "$1" "${2:-}"
      THEME_NAME="$2"
      shift 2
      ;;
    --theme-slug)
      require_value "$1" "${2:-}"
      THEME_SLUG="$2"
      shift 2
      ;;
    --php-prefix)
      require_value "$1" "${2:-}"
      PHP_PREFIX="$2"
      shift 2
      ;;
    --text-domain)
      require_value "$1" "${2:-}"
      TEXT_DOMAIN="$2"
      shift 2
      ;;
    --author-name)
      require_value "$1" "${2:-}"
      AUTHOR_NAME="$2"
      shift 2
      ;;
    --projects-root)
      require_value "$1" "${2:-}"
      PROJECTS_ROOT="$2"
      shift 2
      ;;
    --with-plugin)
      WITH_PLUGIN_CHOICE="yes"
      shift
      ;;
    --plugin-name)
      require_value "$1" "${2:-}"
      PLUGIN_NAME="$2"
      shift 2
      ;;
    --plugin-slug)
      require_value "$1" "${2:-}"
      PLUGIN_SLUG="$2"
      shift 2
      ;;
    --link-localwp)
      LINK_LOCALWP_CHOICE="yes"
      shift
      ;;
    --local-site-slug)
      require_value "$1" "${2:-}"
      LOCAL_SITE_SLUG="$2"
      shift 2
      ;;
    --local-sites-root)
      require_value "$1" "${2:-}"
      LOCAL_SITES_ROOT="$2"
      shift 2
      ;;
    --force-localwp)
      FORCE_LOCALWP=1
      shift
      ;;
    --init-git)
      INIT_GIT_CHOICE="yes"
      shift
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
    --create-github)
      CREATE_GITHUB_CHOICE="yes"
      shift
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
    --yes)
      ASSUME_YES=1
      shift
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

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CREATE_SCRIPT="$SCRIPT_DIR/create-wp-custom-theme.sh"
LINK_SCRIPT="$SCRIPT_DIR/link-localwp.sh"
INIT_GIT_SCRIPT="$SCRIPT_DIR/init-git-project.sh"
GITHUB_SCRIPT="$SCRIPT_DIR/create-github-repo.sh"

[[ -x "$CREATE_SCRIPT" ]] || error "Generator script is not executable: $CREATE_SCRIPT"
[[ -x "$LINK_SCRIPT" ]] || error "Local WP link script is not executable: $LINK_SCRIPT"
[[ -x "$INIT_GIT_SCRIPT" ]] || error "Git init script is not executable: $INIT_GIT_SCRIPT"
[[ -x "$GITHUB_SCRIPT" ]] || error "GitHub repo script is not executable: $GITHUB_SCRIPT"

printf 'WordPress custom project bootstrap\n'
printf '%s\n' '----------------------------------'

PROJECT_NAME="$(prompt_value "Project name" "$PROJECT_NAME" "" 1)"
PROJECT_SLUG="$(prompt_value "Project slug" "$PROJECT_SLUG" "" 1)"
THEME_NAME="$(prompt_value "Theme name" "$THEME_NAME" "$PROJECT_NAME" 1)"
THEME_SLUG="$(prompt_value "Theme slug" "$THEME_SLUG" "$PROJECT_SLUG-theme" 1)"
PHP_PREFIX="$(prompt_value "PHP prefix" "$PHP_PREFIX" "" 1)"
TEXT_DOMAIN="$(prompt_value "Text domain" "$TEXT_DOMAIN" "$PROJECT_SLUG" 1)"
AUTHOR_NAME="$(prompt_value "Author name" "$AUTHOR_NAME" "$DEFAULT_AUTHOR_NAME" 1)"
PROJECTS_ROOT="$(prompt_value "Projects root" "$PROJECTS_ROOT" "$DEFAULT_PROJECTS_ROOT" 1)"

if prompt_yes_no "Create companion plugin" "$WITH_PLUGIN_CHOICE" "no"; then
  WITH_PLUGIN=1
else
  WITH_PLUGIN=0
fi

if [[ "$WITH_PLUGIN" -eq 1 ]]; then
  PLUGIN_NAME="$(prompt_value "Plugin name" "$PLUGIN_NAME" "$PROJECT_NAME Core" 1)"
  PLUGIN_SLUG="$(prompt_value "Plugin slug" "$PLUGIN_SLUG" "$PROJECT_SLUG-core" 1)"
fi

if prompt_yes_no "Create Local WP symlinks" "$LINK_LOCALWP_CHOICE" "no"; then
  LINK_LOCALWP=1
else
  LINK_LOCALWP=0
fi

if [[ "$LINK_LOCALWP" -eq 1 ]]; then
  LOCAL_SITE_SLUG="$(prompt_value "Local WP site slug" "$LOCAL_SITE_SLUG" "$PROJECT_SLUG" 1)"
  LOCAL_SITES_ROOT="$(prompt_value "Local WP sites root" "$LOCAL_SITES_ROOT" "$DEFAULT_LOCAL_SITES_ROOT" 1)"
fi

create_args=(
  --project-name "$PROJECT_NAME"
  --project-slug "$PROJECT_SLUG"
  --theme-name "$THEME_NAME"
  --theme-slug "$THEME_SLUG"
  --php-prefix "$PHP_PREFIX"
  --text-domain "$TEXT_DOMAIN"
  --author-name "$AUTHOR_NAME"
  --output-dir "$PROJECTS_ROOT"
)

if [[ "$WITH_PLUGIN" -eq 1 ]]; then
  create_args+=(--with-plugin --plugin-name "$PLUGIN_NAME" --plugin-slug "$PLUGIN_SLUG")
fi

printf '\nGenerating local project...\n'
"$CREATE_SCRIPT" "${create_args[@]}"

if [[ "$LINK_LOCALWP" -eq 1 ]]; then
  link_args=(
    --project-slug "$PROJECT_SLUG"
    --local-site-slug "$LOCAL_SITE_SLUG"
    --theme-slug "$THEME_SLUG"
    --projects-root "$PROJECTS_ROOT"
    --local-sites-root "$LOCAL_SITES_ROOT"
  )

  if [[ "$WITH_PLUGIN" -eq 1 ]]; then
    link_args+=(--with-plugin --plugin-slug "$PLUGIN_SLUG")
  fi

  if [[ "$FORCE_LOCALWP" -eq 1 ]]; then
    link_args+=(--force)
  fi

  printf '\nCreating Local WP symlinks...\n'
  "$LINK_SCRIPT" "${link_args[@]}"
fi

PROJECT_PATH="$PROJECTS_ROOT/$PROJECT_SLUG"

if prompt_yes_no "Initialize Git repository" "$INIT_GIT_CHOICE" "no"; then
  INIT_GIT=1
else
  INIT_GIT=0
fi

if [[ "$INIT_GIT" -eq 1 ]]; then
  INITIAL_BRANCH="$(prompt_value "Initial branch name" "$INITIAL_BRANCH" "main" 1)"
  COMMIT_MESSAGE="$(prompt_value "Initial commit message" "$COMMIT_MESSAGE" "Initial commit" 1)"

  update_project_readme_metadata

  printf '\nInitializing Git repository...\n'
  "$INIT_GIT_SCRIPT" \
    --project-dir "$PROJECT_PATH" \
    --initial-branch "$INITIAL_BRANCH" \
    --commit-message "$COMMIT_MESSAGE"
fi

if prompt_yes_no "Create GitHub repository" "$CREATE_GITHUB_CHOICE" "no"; then
  CREATE_GITHUB=1
else
  CREATE_GITHUB=0
fi

if [[ "$CREATE_GITHUB" -eq 1 && "$INIT_GIT" -ne 1 ]]; then
  printf '\nGitHub repository creation requires Git initialization first. Skipping GitHub creation safely.\n' >&2
  CREATE_GITHUB=0
fi

if [[ "$CREATE_GITHUB" -eq 1 ]]; then
  REPO_NAME="$(prompt_value "GitHub repository name" "$REPO_NAME" "$PROJECT_SLUG" 1)"
  VISIBILITY="$(prompt_value "Repository visibility" "$VISIBILITY" "private" 1)"
  DESCRIPTION="$(prompt_value "Repository description" "$DESCRIPTION" "" 0)"
  REMOTE_NAME="$(prompt_value "Git remote name" "$REMOTE_NAME" "origin" 1)"

  printf '\nCreating GitHub repository...\n'
  github_args=(
    --project-dir "$PROJECT_PATH"
    --repo-name "$REPO_NAME"
    --visibility "$VISIBILITY"
    --remote-name "$REMOTE_NAME"
  )

  if [[ -n "$DESCRIPTION" ]]; then
    github_args+=(--description "$DESCRIPTION")
  fi

  "$GITHUB_SCRIPT" "${github_args[@]}"
  GITHUB_REMOTE_URL="$(git -C "$PROJECT_PATH" remote get-url "$REMOTE_NAME" 2>/dev/null || true)"
fi

update_project_readme_metadata

printf '\nBootstrap complete.\n'
printf 'Project path: %s\n' "$PROJECT_PATH"
printf 'Theme slug: %s\n' "$THEME_SLUG"

if [[ "$WITH_PLUGIN" -eq 1 ]]; then
  printf 'Plugin slug: %s\n' "$PLUGIN_SLUG"
fi

if [[ "$LINK_LOCALWP" -eq 1 ]]; then
  printf 'Local WP site slug: %s\n' "$LOCAL_SITE_SLUG"
fi

if [[ "$INIT_GIT" -eq 1 ]]; then
  printf 'Git initialized: yes\n'
  printf 'Initial branch: %s\n' "$INITIAL_BRANCH"
fi

if [[ "$CREATE_GITHUB" -eq 1 ]]; then
  printf 'GitHub repository: %s\n' "$REPO_NAME"
  printf 'Repository visibility: %s\n' "$VISIBILITY"
fi

printf '\nNext WordPress admin actions:\n'
printf '1. Open the WordPress admin for the target site.\n'
printf '2. Activate the theme: %s\n' "$THEME_SLUG"

if [[ "$WITH_PLUGIN" -eq 1 ]]; then
  printf '3. Activate the plugin: %s\n' "$PLUGIN_SLUG"
fi
