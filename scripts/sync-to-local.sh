#!/usr/bin/env bash
set -euo pipefail

TARGET_DIR="${CODEX_HOME:-$HOME/.codex}"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
APPLY=0

if [[ "${1:-}" == "--apply" ]]; then
  APPLY=1
elif [[ $# -gt 0 ]]; then
  echo "Usage: $0 [--apply]" >&2
  exit 1
fi

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

if [[ "$APPLY" -eq 0 ]]; then
  echo "Dry run only. Re-run with --apply to write to: $TARGET_DIR"
fi

for path in "${PATHS[@]}"; do
  source_path="$REPO_DIR/$path"
  target_path="$TARGET_DIR/$path"

  if [[ ! -e "$source_path" ]]; then
    echo "Skipping missing path: $source_path" >&2
    continue
  fi

  if [[ -d "$source_path" ]]; then
    if [[ "$APPLY" -eq 1 ]]; then
      mkdir -p "$target_path"
      rsync -a --delete --exclude ".DS_Store" "$source_path/" "$target_path/"
    else
      mkdir -p "$target_path"
      rsync -ani --delete --exclude ".DS_Store" "$source_path/" "$target_path/"
    fi
  else
    if [[ "$APPLY" -eq 1 ]]; then
      mkdir -p "$(dirname "$target_path")"
      cp -p "$source_path" "$target_path"
    elif [[ ! -e "$target_path" ]] || ! cmp -s "$source_path" "$target_path"; then
      echo "would copy $path"
    fi
  fi
done

if [[ "$APPLY" -eq 1 ]]; then
  echo "Sync complete: $TARGET_DIR"
fi
