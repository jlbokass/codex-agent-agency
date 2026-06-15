#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  promptcopy <prompt-name>
  promptcopy <prompt-name.md>
  promptcopy --list
  promptcopy --help
  promptcopy -h

Copies a Markdown prompt from the repository prompts/ directory into the
macOS clipboard. Prompt files are instructions, not executable scripts.
USAGE
}

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "${script_dir}/../.." && pwd)"
prompts_dir="${repo_root}/prompts"

list_prompts() {
  if [[ ! -d "${prompts_dir}" ]]; then
    printf 'Prompt directory not found: %s\n' "${prompts_dir}" >&2
    exit 1
  fi

  find "${prompts_dir}" -maxdepth 1 -type f -name '*.md' -print \
    | sort \
    | while IFS= read -r prompt_path; do
        basename "${prompt_path}"
      done
}

if [[ $# -ne 1 ]]; then
  usage >&2
  exit 1
fi

case "$1" in
  -h|--help)
    usage
    exit 0
    ;;
  --list)
    list_prompts
    exit 0
    ;;
esac

if ! command -v pbcopy >/dev/null 2>&1; then
  printf 'Error: pbcopy is required but was not found. This helper is intended for macOS.\n' >&2
  exit 1
fi

prompt_name="$1"
if [[ "${prompt_name}" != *.md ]]; then
  prompt_name="${prompt_name}.md"
fi

prompt_path="${prompts_dir}/${prompt_name}"

if [[ ! -f "${prompt_path}" ]]; then
  printf 'Error: prompt not found: %s\n\n' "${prompt_name}" >&2
  printf 'Available prompts:\n' >&2
  list_prompts >&2
  exit 1
fi

pbcopy < "${prompt_path}"

printf 'Copied prompt to clipboard: %s\n' "${prompt_name}"
