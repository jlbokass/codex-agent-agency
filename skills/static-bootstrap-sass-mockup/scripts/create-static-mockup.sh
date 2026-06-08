#!/usr/bin/env bash
set -euo pipefail

DEFAULT_OUTPUT_DIR="/Users/jean-le-grandbokassa/Sites"
DEFAULT_PAGES="index,about,services,works,contact"

usage() {
  cat <<'USAGE'
Usage:
  create-static-mockup.sh \
    --project-name "Project Name" \
    --project-slug project-slug \
    --author-name "Author Name" \
    [--pages index,about,services,works,contact] \
    [--output-dir /path/to/output]

Options:
  --project-name   Human-readable project name. Required.
  --project-slug   Project folder slug. Lowercase letters, numbers, hyphens. Required.
  --author-name    Author name for package metadata and docs. Required.
  --pages          Comma-separated page slugs. Defaults to index,about,services,works,contact.
  --output-dir     Existing directory where the project folder will be created.
                  Defaults to /Users/jean-le-grandbokassa/Sites.
  --help           Show this help message.

This script generates a local static mockup project from the reusable scaffold.
It does not install dependencies, run npm, initialize Git, create GitHub
repositories, use Vite, use Webpack, or add backend/CMS-specific files.
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

title_from_slug() {
  local slug="$1"
  local title=""
  local part
  local first
  local rest

  IFS='-' read -r -a parts <<< "$slug"
  for part in "${parts[@]}"; do
    first="$(printf '%s' "${part:0:1}" | tr '[:lower:]' '[:upper:]')"
    rest="${part:1}"
    if [[ -n "$title" ]]; then
      title="$title "
    fi
    title="$title$first$rest"
  done

  printf '%s' "$title"
}

replace_placeholders_in_file() {
  local file="$1"

  PROJECT_NAME="$PROJECT_NAME" \
  PROJECT_SLUG="$PROJECT_SLUG" \
  AUTHOR_NAME="$AUTHOR_NAME" \
  PAGES="$PAGES" \
  PAGE_TITLE="$PAGE_TITLE" \
  perl -0pi -e '
    s/\{\{PROJECT_NAME\}\}/$ENV{PROJECT_NAME}/g;
    s/\{\{PROJECT_SLUG\}\}/$ENV{PROJECT_SLUG}/g;
    s/\{\{AUTHOR_NAME\}\}/$ENV{AUTHOR_NAME}/g;
    s/\{\{PAGES\}\}/$ENV{PAGES}/g;
    s/\{\{PAGE_TITLE\}\}/$ENV{PAGE_TITLE}/g;
  ' "$file"
}

replace_placeholders() {
  local directory="$1"

  find "$directory" -type f -print | while IFS= read -r file; do
    PAGE_TITLE=""
    replace_placeholders_in_file "$file"
  done
}

remove_tpl_suffixes() {
  local directory="$1"

  find "$directory" -type f -name '*.tpl' -print | while IFS= read -r file; do
    mv "$file" "${file%.tpl}"
  done
}

page_requested() {
  local page="$1"
  local requested

  for requested in "${PAGE_LIST[@]}"; do
    if [[ "$requested" == "$page" ]]; then
      return 0
    fi
  done

  return 1
}

build_nav_items() {
  local active_page="$1"
  local nav_items='          <ul class="navbar-nav ms-auto">'
  local page
  local page_title
  local active_class
  local aria_current

  for page in "${PAGE_LIST[@]}"; do
    if [[ "$page" == "index" ]]; then
      page_title="Home"
    else
      page_title="$(title_from_slug "$page")"
    fi

    active_class=""
    aria_current=""
    if [[ "$page" == "$active_page" ]]; then
      active_class=" active"
      aria_current=' aria-current="page"'
    fi

    nav_items="$nav_items
            <li class=\"nav-item\"><a class=\"nav-link$active_class\" href=\"$page.html\"$aria_current>$page_title</a></li>"
  done

  nav_items="$nav_items
          </ul>"

  printf '%s' "$nav_items"
}

replace_nav_items() {
  local public_dir="$1"
  local file
  local filename
  local page
  local nav_items

  find "$public_dir" -maxdepth 1 -type f \( -name '*.html.tpl' -o -name '*.html' \) -print | while IFS= read -r file; do
    filename="$(basename "$file")"
    page="${filename%.tpl}"
    page="${page%.html}"
    nav_items="$(build_nav_items "$page")"

    NAV_ITEMS="$nav_items" perl -0pi -e '
      s#          <ul class="navbar-nav ms-auto">.*?          </ul>#$ENV{NAV_ITEMS}#s;
    ' "$file"
  done
}

normalize_internal_links() {
  local public_dir="$1"
  local default_page
  local file

  for default_page in about services works contact; do
    if page_requested "$default_page"; then
      continue
    fi

    find "$public_dir" -maxdepth 1 -type f \( -name '*.html.tpl' -o -name '*.html' \) -print | while IFS= read -r file; do
      MISSING_PAGE="$default_page" perl -0pi -e '
        s/href="\Q$ENV{MISSING_PAGE}\E\.html"/href="index.html"/g;
      ' "$file"
    done
  done
}

write_generic_page() {
  local target="$1"
  local page_slug="$2"
  local page_title

  page_title="$(title_from_slug "$page_slug")"

  cat > "$target" <<EOF
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>{{PROJECT_NAME}} | $page_title</title>
  <link rel="stylesheet" href="../assets/css/main.css">
</head>
<body>
  <header class="site-header">
    <nav class="navbar navbar-expand-lg" aria-label="Primary navigation">
      <div class="container">
        <a class="navbar-brand" href="index.html">{{PROJECT_NAME}}</a>
        <button class="navbar-toggler" type="button" data-menu-toggle aria-controls="primary-navigation" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="site-header__menu" id="primary-navigation" data-menu>
          <ul class="navbar-nav ms-auto"></ul>
        </div>
      </div>
    </nav>
  </header>

  <main>
    <section class="page-intro section">
      <div class="container">
        <p class="section-eyebrow">Static page</p>
        <h1>$page_title</h1>
        <p>Use this generic page template for layout validation before integration.</p>
      </div>
    </section>

    <section class="section">
      <div class="container">
        <div class="feature-card">
          <h2>Reusable content section</h2>
          <p>Replace this neutral placeholder content when the mockup needs a project-specific section.</p>
        </div>
      </div>
    </section>
  </main>

  <footer class="site-footer">
    <div class="container">
      <p>&copy; <span data-current-year></span> {{PROJECT_NAME}}. Static mockup.</p>
    </div>
  </footer>

  <script src="../assets/js/main.js"></script>
</body>
</html>
EOF
}

select_pages() {
  local public_dir="$1"
  local template_source
  local default_page
  local page

  for default_page in about services works contact; do
    if ! page_requested "$default_page"; then
      rm -f "$public_dir/$default_page.html.tpl" "$public_dir/$default_page.html"
    fi
  done

  for page in "${PAGE_LIST[@]}"; do
    if [[ "$page" == "index" ]]; then
      continue
    fi

    if [[ -e "$public_dir/$page.html.tpl" || -e "$public_dir/$page.html" ]]; then
      continue
    fi

    template_source="$public_dir/about.html.tpl"
    if [[ -e "$template_source" ]]; then
      cp "$template_source" "$public_dir/$page.html.tpl"
    else
      write_generic_page "$public_dir/$page.html.tpl" "$page"
    fi
  done
}

write_project_readme() {
  local project_dir="$1"
  local page_list_markdown=""
  local page

  for page in "${PAGE_LIST[@]}"; do
    page_list_markdown="$page_list_markdown- \`public/$page.html\`
"
  done

  cat > "$project_dir/README.md" <<EOF
# $PROJECT_NAME

Static HTML, SCSS, Bootstrap, Sass CLI, BrowserSync, and JavaScript mockup.

## Purpose

This project is a static frontend mockup for validating visual design, spacing,
responsive behavior, and UI components before backend, CMS, or framework
integration.

## Project Structure

- \`public/\` - static HTML pages.
- \`src/scss/\` - source SCSS architecture.
- \`assets/css/\` - compiled CSS output.
- \`assets/js/main.js\` - simple JavaScript edited directly and loaded by static pages.
- \`assets/images/\` - mockup image assets.

## Pages

$page_list_markdown
## Development

Install dependencies:

\`\`\`bash
npm install
\`\`\`

Start Sass watch and BrowserSync:

\`\`\`bash
npm run dev
\`\`\`

Build compressed CSS:

\`\`\`bash
npm run build
\`\`\`

## Frontend Workflow

- BrowserSync serves the project root and opens \`public/index.html\`.
- SCSS source files live in \`src/scss/\`.
- Compiled CSS is generated at \`assets/css/main.css\`.
- JavaScript is simple, unbundled, and edited directly in \`assets/js/main.js\`.
- Vite is not used.
- Webpack is not used.
- JavaScript bundling is not used by default.
EOF
}

PROJECT_NAME=""
PROJECT_SLUG=""
AUTHOR_NAME=""
PAGES="$DEFAULT_PAGES"
OUTPUT_DIR="$DEFAULT_OUTPUT_DIR"

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
    --author-name)
      require_value "$1" "${2:-}"
      AUTHOR_NAME="$2"
      shift 2
      ;;
    --pages)
      require_value "$1" "${2:-}"
      PAGES="$2"
      shift 2
      ;;
    --output-dir)
      require_value "$1" "${2:-}"
      OUTPUT_DIR="$2"
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
[[ -n "$AUTHOR_NAME" ]] || error "--author-name is required."
[[ -n "$OUTPUT_DIR" ]] || error "--output-dir is required."

validate_slug "Project slug" "$PROJECT_SLUG"
[[ -d "$OUTPUT_DIR" ]] || error "Output directory does not exist: $OUTPUT_DIR"

IFS=',' read -r -a PAGE_LIST <<< "$PAGES"
[[ "${#PAGE_LIST[@]}" -gt 0 ]] || error "--pages must include at least one page slug."

has_index=0
for page in "${PAGE_LIST[@]}"; do
  [[ -n "$page" ]] || error "--pages contains an empty page slug."
  validate_slug "Page slug" "$page"
  if [[ "$page" == "index" ]]; then
    has_index=1
  fi
done

if [[ "$has_index" -eq 0 ]]; then
  PAGE_LIST=("index" "${PAGE_LIST[@]}")
  PAGES="index,$PAGES"
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/../../.." && pwd)"
SCAFFOLD_DIR="$REPO_DIR/scaffolds/static-bootstrap-sass"

[[ -d "$SCAFFOLD_DIR" ]] || error "Static scaffold not found: $SCAFFOLD_DIR"

PROJECT_DIR="$OUTPUT_DIR/$PROJECT_SLUG"
[[ ! -e "$PROJECT_DIR" ]] || error "Target project directory already exists: $PROJECT_DIR"

mkdir -p "$PROJECT_DIR"
cp -R "$SCAFFOLD_DIR"/. "$PROJECT_DIR"/.

select_pages "$PROJECT_DIR/public"
replace_nav_items "$PROJECT_DIR/public"
normalize_internal_links "$PROJECT_DIR/public"
replace_placeholders "$PROJECT_DIR"
remove_tpl_suffixes "$PROJECT_DIR"

write_project_readme "$PROJECT_DIR"

printf 'Generated static mockup project: %s\n' "$PROJECT_DIR"
printf 'Pages: %s\n' "$PAGES"
printf 'Next steps: cd %s && npm install && npm run dev\n' "$PROJECT_DIR"
