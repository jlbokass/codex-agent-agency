# Codex Agent Agency

Clean, GitHub-ready backup of reusable Codex agent agency assets from `~/.codex`.

This repository intentionally stores only shareable operating instructions, workflows, prompts, templates, checklists, and design-system notes. It does not include credentials, sessions, logs, cache files, memories, local runtime configuration, tokens, or temporary state.

## Contents

- `AGENTS.md` - global Codex operating instructions.
- `agents/` - specialized agent instruction profiles.
- `workflows/` - repeatable engineering and product workflows.
- `checklists/` - quality gates and release readiness checks.
- `prompts/` - reusable prompt templates.
- `templates/` - reusable agent/project templates.
- `design-system/` - UI, UX, motion, spacing, and typography guidance.

## Sync Scripts

Refresh this repository from local Codex assets:

```bash
./scripts/backup-from-local.sh
```

Preview restoring this repository back into `~/.codex`:

```bash
./scripts/sync-to-local.sh
```

Apply the restore/sync to `~/.codex`:

```bash
./scripts/sync-to-local.sh --apply
```

Both scripts use a strict allowlist and only touch the public-safe paths listed above.

## GitHub Workflow

Before publishing, review the diff and verify that no private files were added:

```bash
git status
git diff --stat
```

Then create a commit and add a GitHub remote when ready.
