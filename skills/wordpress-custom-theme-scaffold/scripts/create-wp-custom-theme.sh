#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  create-wp-custom-theme.sh \
    --project-name "Project Name" \
    --project-slug project-slug \
    --theme-name "Theme Name" \
    --theme-slug theme-slug \
    --php-prefix project_prefix \
    --text-domain project-text-domain \
    --author-name "Author Name" \
    --output-dir /path/to/output \
    [--with-plugin --plugin-name "Plugin Name" --plugin-slug plugin-slug]

Options:
  --project-name   Human-readable project name. Required.
  --project-slug   Project folder slug. Lowercase letters, numbers, hyphens. Required.
  --theme-name     Human-readable theme name. Required.
  --theme-slug     Theme folder slug. Lowercase letters, numbers, hyphens. Required.
  --php-prefix     PHP function/constant prefix. Lowercase letters, numbers, underscores. Required.
  --text-domain    WordPress text domain. Lowercase letters, numbers, hyphens. Required.
  --author-name    Author name for headers and docs. Required.
  --output-dir     Existing directory where the project folder will be created. Required.
  --with-plugin    Also generate a companion plugin.
  --plugin-name    Human-readable plugin name. Required with --with-plugin.
  --plugin-slug    Plugin folder slug. Required with --with-plugin.
  --help           Show this help message.

This script only generates a local project folder from existing scaffolds.
It does not create Local WP symlinks, initialize Git, create GitHub repositories,
push code, install npm dependencies, or add client-specific content.
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

validate_php_prefix() {
  local value="$1"

  if [[ ! "$value" =~ ^[a-z0-9]+(_[a-z0-9]+)*$ ]]; then
    error "PHP prefix must use lowercase letters, numbers, and underscores only."
  fi
}

replace_placeholders_in_file() {
  local file="$1"

  PROJECT_NAME="$PROJECT_NAME" \
  PROJECT_SLUG="$PROJECT_SLUG" \
  THEME_NAME="$THEME_NAME" \
  THEME_SLUG="$THEME_SLUG" \
  PLUGIN_NAME="$PLUGIN_NAME" \
  PLUGIN_SLUG="$PLUGIN_SLUG" \
  TEXT_DOMAIN="$TEXT_DOMAIN" \
  PHP_PREFIX="$PHP_PREFIX" \
  AUTHOR_NAME="$AUTHOR_NAME" \
  perl -0pi -e '
    s/\{\{PROJECT_NAME\}\}/$ENV{PROJECT_NAME}/g;
    s/\{\{PROJECT_SLUG\}\}/$ENV{PROJECT_SLUG}/g;
    s/\{\{THEME_NAME\}\}/$ENV{THEME_NAME}/g;
    s/\{\{THEME_SLUG\}\}/$ENV{THEME_SLUG}/g;
    s/\{\{PLUGIN_NAME\}\}/$ENV{PLUGIN_NAME}/g;
    s/\{\{PLUGIN_SLUG\}\}/$ENV{PLUGIN_SLUG}/g;
    s/\{\{TEXT_DOMAIN\}\}/$ENV{TEXT_DOMAIN}/g;
    s/\{\{PHP_PREFIX\}\}/$ENV{PHP_PREFIX}/g;
    s/\{\{AUTHOR_NAME\}\}/$ENV{AUTHOR_NAME}/g;
  ' "$file"
}

replace_placeholders() {
  local directory="$1"

  find "$directory" -type f -print | while IFS= read -r file; do
    replace_placeholders_in_file "$file"
  done
}

remove_tpl_suffixes() {
  local directory="$1"

  find "$directory" -type f -name '*.tpl' -print | while IFS= read -r file; do
    mv "$file" "${file%.tpl}"
  done
}

write_project_gitignore() {
  local project_dir="$1"

  cat > "$project_dir/.gitignore" <<'EOF'
# OS and editor files
.DS_Store
Thumbs.db
.idea/
.vscode/
*.swp
*.swo

# Local environment files
.env
.env.*
!.env.example

# Logs
*.log
logs/
log/
npm-debug.log*
yarn-debug.log*
yarn-error.log*
pnpm-debug.log*

# Temporary files
tmp/
temp/
.tmp/
*.tmp
*.temp

# Dependencies
node_modules/
vendor/

# Local caches
.cache/
.parcel-cache/
.sass-cache/
.eslintcache
.stylelintcache
EOF
}

write_project_docs() {
  local project_dir="$1"
  local theme_dir="$2"
  local plugin_dir="$3"

  cat > "$project_dir/README.md" <<EOF
# $PROJECT_NAME

Generated local WordPress project scaffold.

## Project Structure

- \`theme/$THEME_SLUG/\` - custom WordPress theme for presentation, templates, assets, and frontend rendering.
EOF

  if [[ "$WITH_PLUGIN" -eq 1 ]]; then
    cat >> "$project_dir/README.md" <<EOF
- \`plugin/$PLUGIN_SLUG/\` - companion plugin for Custom Post Types, taxonomies, metadata, admin customizations, and business logic.
EOF
  fi

  cat >> "$project_dir/README.md" <<'EOF'
- `docs/setup.md` - setup notes and next manual steps.

## Workflow State

- No Local WP symlinks were created.
- Git was not initialized.
- No GitHub repository was created.
- No npm dependencies were installed.

## Notes

- No client-specific content was generated.
EOF

  cat > "$project_dir/docs/setup.md" <<EOF
# Setup Notes

## Generated Paths

- Project: \`$project_dir\`
- Theme: \`$theme_dir\`
EOF

  if [[ "$WITH_PLUGIN" -eq 1 ]]; then
    cat >> "$project_dir/docs/setup.md" <<EOF
- Plugin: \`$plugin_dir\`
EOF
  fi

  cat >> "$project_dir/docs/setup.md" <<'EOF'

## Next Manual Steps

1. Review generated placeholders and file names.
2. Copy or link the theme into a WordPress installation when ready.
3. Copy or link the plugin into a WordPress installation when applicable.
4. Activate the theme from the WordPress admin.
5. Activate the plugin from the WordPress admin when applicable.
6. Add project-specific content and functionality intentionally.

## Not Performed By This Script

- Local WP symlink creation
- Git initialization
- GitHub repository creation
- Dependency installation
- Deployment configuration
EOF
}

PROJECT_NAME=""
PROJECT_SLUG=""
THEME_NAME=""
THEME_SLUG=""
PHP_PREFIX=""
TEXT_DOMAIN=""
AUTHOR_NAME=""
OUTPUT_DIR=""
WITH_PLUGIN=0
PLUGIN_NAME=""
PLUGIN_SLUG=""

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
    --output-dir)
      require_value "$1" "${2:-}"
      OUTPUT_DIR="$2"
      shift 2
      ;;
    --with-plugin)
      WITH_PLUGIN=1
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
    --help)
      usage
      exit 0
      ;;
    *)
      error "Unknown option: $1"
      ;;
  esac
done

[[ -n "$PROJECT_NAME" ]] || error "--project-name is required."
[[ -n "$PROJECT_SLUG" ]] || error "--project-slug is required."
[[ -n "$THEME_NAME" ]] || error "--theme-name is required."
[[ -n "$THEME_SLUG" ]] || error "--theme-slug is required."
[[ -n "$PHP_PREFIX" ]] || error "--php-prefix is required."
[[ -n "$TEXT_DOMAIN" ]] || error "--text-domain is required."
[[ -n "$AUTHOR_NAME" ]] || error "--author-name is required."
[[ -n "$OUTPUT_DIR" ]] || error "--output-dir is required."

validate_slug "Project slug" "$PROJECT_SLUG"
validate_slug "Theme slug" "$THEME_SLUG"
validate_slug "Text domain" "$TEXT_DOMAIN"
validate_php_prefix "$PHP_PREFIX"

if [[ "$WITH_PLUGIN" -eq 1 ]]; then
  [[ -n "$PLUGIN_NAME" ]] || error "--plugin-name is required when --with-plugin is provided."
  [[ -n "$PLUGIN_SLUG" ]] || error "--plugin-slug is required when --with-plugin is provided."
  validate_slug "Plugin slug" "$PLUGIN_SLUG"
else
  if [[ -n "$PLUGIN_NAME" || -n "$PLUGIN_SLUG" ]]; then
    error "--plugin-name and --plugin-slug require --with-plugin."
  fi
fi

[[ -d "$OUTPUT_DIR" ]] || error "Output directory does not exist: $OUTPUT_DIR"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/../../.." && pwd)"
THEME_SCAFFOLD="$REPO_DIR/scaffolds/wordpress-classic-theme"
PLUGIN_SCAFFOLD="$REPO_DIR/scaffolds/wordpress-core-plugin"

[[ -d "$THEME_SCAFFOLD" ]] || error "Theme scaffold not found: $THEME_SCAFFOLD"
[[ -d "$PLUGIN_SCAFFOLD" ]] || error "Plugin scaffold not found: $PLUGIN_SCAFFOLD"

PROJECT_DIR="$OUTPUT_DIR/$PROJECT_SLUG"
THEME_DIR="$PROJECT_DIR/theme/$THEME_SLUG"
PLUGIN_DIR="$PROJECT_DIR/plugin/$PLUGIN_SLUG"

[[ ! -e "$PROJECT_DIR" ]] || error "Target project directory already exists: $PROJECT_DIR"

mkdir -p "$THEME_DIR" "$PROJECT_DIR/docs"
cp -R "$THEME_SCAFFOLD"/. "$THEME_DIR"/.

if [[ "$WITH_PLUGIN" -eq 1 ]]; then
  mkdir -p "$PLUGIN_DIR"
  cp -R "$PLUGIN_SCAFFOLD"/. "$PLUGIN_DIR"/.
fi

replace_placeholders "$PROJECT_DIR"
remove_tpl_suffixes "$PROJECT_DIR"
write_project_gitignore "$PROJECT_DIR"
write_project_docs "$PROJECT_DIR" "$THEME_DIR" "$PLUGIN_DIR"

printf 'Generated project: %s\n' "$PROJECT_DIR"
printf 'Theme folder: %s\n' "$THEME_DIR"

if [[ "$WITH_PLUGIN" -eq 1 ]]; then
  printf 'Plugin folder: %s\n' "$PLUGIN_DIR"
fi

printf 'Next steps: review %s and %s\n' "$PROJECT_DIR/README.md" "$PROJECT_DIR/docs/setup.md"
