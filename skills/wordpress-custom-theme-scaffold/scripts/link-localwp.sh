#!/usr/bin/env bash
set -euo pipefail

DEFAULT_PROJECTS_ROOT="/Users/jean-le-grandbokassa/Sites"
DEFAULT_LOCAL_SITES_ROOT="/Users/jean-le-grandbokassa/Local Sites"

usage() {
  cat <<'USAGE'
Usage:
  link-localwp.sh \
    --project-slug project-slug \
    --local-site-slug local-site-slug \
    --theme-slug theme-slug \
    [--with-plugin --plugin-slug plugin-slug] \
    [--projects-root "/Users/jean-le-grandbokassa/Sites"] \
    [--local-sites-root "/Users/jean-le-grandbokassa/Local Sites"] \
    [--force]

Options:
  --project-slug       Generated project folder slug. Required.
  --local-site-slug    Local WP site folder slug. Required.
  --theme-slug         Theme folder slug. Required.
  --with-plugin        Also link the generated companion plugin.
  --plugin-slug        Plugin folder slug. Required with --with-plugin.
  --projects-root      Root containing generated projects.
  --local-sites-root   Root containing Local WP sites.
  --force              Replace existing symlink destinations only.
  --help               Show this help message.

This script links an already generated project into an existing Local WP site.
It does not initialize Git, create GitHub repositories, push code, or generate
new scaffold files.
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

validate_slug() {
  local label="$1"
  local value="$2"

  if [[ ! "$value" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]]; then
    error "$label must use lowercase letters, numbers, and hyphens only."
  fi
}

prepare_destination() {
  local destination="$1"
  local force="$2"

  if [[ -L "$destination" ]]; then
    if [[ "$force" -eq 1 ]]; then
      rm "$destination"
      return
    fi

    error "Destination already exists as a symlink: $destination. Re-run with --force to replace it."
  fi

  if [[ -e "$destination" ]]; then
    error "Destination already exists and is not a symlink: $destination. Refusing to delete real files or directories."
  fi
}

create_symlink() {
  local source="$1"
  local destination="$2"
  local force="$3"

  printf 'Source: %s\n' "$source"
  printf 'Destination: %s\n' "$destination"

  prepare_destination "$destination" "$force"
  ln -s "$source" "$destination"

  printf 'Linked: %s -> %s\n' "$destination" "$source"
}

PROJECT_SLUG=""
LOCAL_SITE_SLUG=""
THEME_SLUG=""
WITH_PLUGIN=0
PLUGIN_SLUG=""
PROJECTS_ROOT="$DEFAULT_PROJECTS_ROOT"
LOCAL_SITES_ROOT="$DEFAULT_LOCAL_SITES_ROOT"
FORCE=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --project-slug)
      require_value "$1" "${2:-}"
      PROJECT_SLUG="$2"
      shift 2
      ;;
    --local-site-slug)
      require_value "$1" "${2:-}"
      LOCAL_SITE_SLUG="$2"
      shift 2
      ;;
    --theme-slug)
      require_value "$1" "${2:-}"
      THEME_SLUG="$2"
      shift 2
      ;;
    --with-plugin)
      WITH_PLUGIN=1
      shift
      ;;
    --plugin-slug)
      require_value "$1" "${2:-}"
      PLUGIN_SLUG="$2"
      shift 2
      ;;
    --projects-root)
      require_value "$1" "${2:-}"
      PROJECTS_ROOT="$2"
      shift 2
      ;;
    --local-sites-root)
      require_value "$1" "${2:-}"
      LOCAL_SITES_ROOT="$2"
      shift 2
      ;;
    --force)
      FORCE=1
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

[[ -n "$PROJECT_SLUG" ]] || error "--project-slug is required."
[[ -n "$LOCAL_SITE_SLUG" ]] || error "--local-site-slug is required."
[[ -n "$THEME_SLUG" ]] || error "--theme-slug is required."

validate_slug "Project slug" "$PROJECT_SLUG"
validate_slug "Local site slug" "$LOCAL_SITE_SLUG"
validate_slug "Theme slug" "$THEME_SLUG"

if [[ "$WITH_PLUGIN" -eq 1 ]]; then
  [[ -n "$PLUGIN_SLUG" ]] || error "--plugin-slug is required when --with-plugin is provided."
  validate_slug "Plugin slug" "$PLUGIN_SLUG"
elif [[ -n "$PLUGIN_SLUG" ]]; then
  error "--plugin-slug requires --with-plugin."
fi

PROJECT_DIR="$PROJECTS_ROOT/$PROJECT_SLUG"
LOCAL_WP_SITE_DIR="$LOCAL_SITES_ROOT/$LOCAL_SITE_SLUG"
THEME_SOURCE="$PROJECT_DIR/theme/$THEME_SLUG"
THEMES_DIR="$LOCAL_WP_SITE_DIR/app/public/wp-content/themes"
THEME_DESTINATION="$THEMES_DIR/$THEME_SLUG"
PLUGIN_SOURCE="$PROJECT_DIR/plugin/$PLUGIN_SLUG"
PLUGINS_DIR="$LOCAL_WP_SITE_DIR/app/public/wp-content/plugins"
PLUGIN_DESTINATION="$PLUGINS_DIR/$PLUGIN_SLUG"

[[ -d "$PROJECT_DIR" ]] || error "Project directory does not exist: $PROJECT_DIR"
[[ -d "$LOCAL_WP_SITE_DIR" ]] || error "Local WP site directory does not exist: $LOCAL_WP_SITE_DIR"
[[ -d "$THEME_SOURCE" ]] || error "Theme source directory does not exist: $THEME_SOURCE"
[[ -d "$THEMES_DIR" ]] || error "Local WP themes directory does not exist: $THEMES_DIR"

if [[ "$WITH_PLUGIN" -eq 1 ]]; then
  [[ -d "$PLUGIN_SOURCE" ]] || error "Plugin source directory does not exist: $PLUGIN_SOURCE"
  [[ -d "$PLUGINS_DIR" ]] || error "Local WP plugins directory does not exist: $PLUGINS_DIR"
fi

printf 'Preparing Local WP symlinks...\n'
create_symlink "$THEME_SOURCE" "$THEME_DESTINATION" "$FORCE"

if [[ "$WITH_PLUGIN" -eq 1 ]]; then
  create_symlink "$PLUGIN_SOURCE" "$PLUGIN_DESTINATION" "$FORCE"
fi

printf '\nSuccess: Local WP symlink setup complete.\n'
printf '\nNext steps:\n'
printf '1. Open the WordPress admin for the Local WP site.\n'
printf '2. Activate the theme: %s\n' "$THEME_SLUG"

if [[ "$WITH_PLUGIN" -eq 1 ]]; then
  printf '3. Activate the plugin: %s\n' "$PLUGIN_SLUG"
fi
