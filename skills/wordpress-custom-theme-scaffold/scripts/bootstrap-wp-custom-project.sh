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
  --yes
  --help

This orchestrator calls:
  scripts/create-wp-custom-theme.sh
  scripts/link-localwp.sh when Local WP linking is requested

It does not initialize Git, create GitHub repositories, push code, modify
scaffold files, or duplicate placeholder replacement or symlink logic.
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

  if [[ ! -t 0 ]]; then
    if [[ -n "$default_value" ]]; then
      printf '%s: %s\n' "$label" "$default_value" >&2
      printf '%s' "$default_value"
      return
    fi

    if [[ "$required" -eq 1 ]]; then
      error "$label is required in non-interactive mode."
    fi
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

[[ -x "$CREATE_SCRIPT" ]] || error "Generator script is not executable: $CREATE_SCRIPT"
[[ -x "$LINK_SCRIPT" ]] || error "Local WP link script is not executable: $LINK_SCRIPT"

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

printf '\nBootstrap complete.\n'
printf 'Project path: %s\n' "$PROJECT_PATH"
printf 'Theme slug: %s\n' "$THEME_SLUG"

if [[ "$WITH_PLUGIN" -eq 1 ]]; then
  printf 'Plugin slug: %s\n' "$PLUGIN_SLUG"
fi

if [[ "$LINK_LOCALWP" -eq 1 ]]; then
  printf 'Local WP site slug: %s\n' "$LOCAL_SITE_SLUG"
fi

printf '\nNext WordPress admin actions:\n'
printf '1. Open the WordPress admin for the target site.\n'
printf '2. Activate the theme: %s\n' "$THEME_SLUG"

if [[ "$WITH_PLUGIN" -eq 1 ]]; then
  printf '3. Activate the plugin: %s\n' "$PLUGIN_SLUG"
fi
