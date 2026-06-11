#!/usr/bin/env bash
set -euo pipefail

SOURCE_DIR="${CODEX_HOME:-$HOME/.codex}"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

PATHS=(
  "AGENTS.md"
  "agents"
  "workflows"
  "checklists"
  "prompts"
  "templates"
  "skills"
  "scaffolds"
  "design-system"
)

if [[ ! -d "$SOURCE_DIR" ]]; then
  echo "Source directory not found: $SOURCE_DIR" >&2
  exit 1
fi

for path in "${PATHS[@]}"; do
  source_path="$SOURCE_DIR/$path"
  target_path="$REPO_DIR/$path"

  if [[ ! -e "$source_path" ]]; then
    echo "Skipping missing path: $source_path" >&2
    continue
  fi

  if [[ -d "$source_path" ]]; then
    mkdir -p "$target_path"
    rsync -a --delete --exclude ".DS_Store" "$source_path/" "$target_path/"
  else
    mkdir -p "$(dirname "$target_path")"
    cp -p "$source_path" "$target_path"
  fi
done

echo "Backup complete: $REPO_DIR"
