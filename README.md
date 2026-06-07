# Codex Agent Agency

Clean, GitHub-ready backup of reusable Codex agent agency assets from `~/.codex`.

This repository intentionally stores only shareable operating instructions, workflows, prompts, templates, checklists, and design-system notes. It does not include credentials, sessions, logs, cache files, memories, local runtime configuration, tokens, or temporary state.

## Contents

- `AGENTS.md` - global Codex operating instructions.
- `agents/` - specialized technical profiles for specific stacks, roles, and review modes.
- `prompts/` - reusable task prompts for common engineering work.
- `workflows/` - repeatable procedures for features, bug fixes, reviews, refactors, releases, and onboarding.
- `checklists/` - quality gates for delivery, security, release readiness, and UI/UX checks.
- `templates/` - reusable project instruction templates for copying into specific repositories, not generated code scaffolds.
- `design-system/` - UI/UX guidance for layout, typography, motion, spacing, and visual quality.
- `scripts/` - sync utilities for backing up and restoring the public-safe Codex assets.

Future directory boundaries:

- `scaffolds/` would contain generated project code templates if added later.
- `skills/` would contain executable Codex workflows if added later.

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
