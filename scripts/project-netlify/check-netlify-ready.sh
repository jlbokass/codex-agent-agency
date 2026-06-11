#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  check-netlify-ready.sh --project-dir /path/to/static-project

Options:
  --project-dir    Existing static project directory. Required.
  -h, --help       Show this help message.

This stack-agnostic helper validates that a static project is ready for the
future Netlify workflow. It runs npm run build and confirms that the expected
publish asset exists. It does not run Netlify CLI commands or store credentials.
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

[[ -n "$PROJECT_DIR" ]] || error "--project-dir is required."
[[ -d "$PROJECT_DIR" ]] || error "Project directory does not exist: $PROJECT_DIR"
[[ -f "$PROJECT_DIR/package.json" ]] || error "package.json does not exist: $PROJECT_DIR/package.json"
[[ -f "$PROJECT_DIR/netlify.toml" ]] || error "netlify.toml does not exist: $PROJECT_DIR/netlify.toml"
[[ -d "$PROJECT_DIR/public" ]] || error "public directory does not exist: $PROJECT_DIR/public"
[[ -f "$PROJECT_DIR/public/index.html" ]] || error "public/index.html does not exist: $PROJECT_DIR/public/index.html"

command -v npm >/dev/null 2>&1 || error "npm is not installed or not available in PATH."

BUILD_SCRIPT="$(cd "$PROJECT_DIR" && npm pkg get scripts.build 2>/dev/null || true)"
[[ -n "$BUILD_SCRIPT" && "$BUILD_SCRIPT" != "null" && "$BUILD_SCRIPT" != "{}" ]] || error "package.json does not define npm run build."

printf 'Running npm run build in %s\n' "$PROJECT_DIR"
(cd "$PROJECT_DIR" && npm run build)

[[ -f "$PROJECT_DIR/public/assets/css/main.css" ]] || error "Build did not create public/assets/css/main.css"

printf 'Success: project is Netlify-ready: %s\n' "$PROJECT_DIR"
printf 'Build command: npm run build\n'
printf 'Publish directory: public\n'
