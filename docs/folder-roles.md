# Folder Roles

This repository separates reusable instructions, generated file models, and
executable helpers so each layer has a clear responsibility.

## Key Distinctions

- Agent = technical capability profile.
- Prompt = reusable task request.
- Workflow = repeatable procedure.
- Template = reusable project instruction file.
- Skill = tool-backed workflow.
- Scaffold = generated project file model.
- Script = executable helper.

## Main Paths

`agents/`
: Specialized technical capability profiles for stacks, platforms, roles, and
review modes.

`prompts/`
: Reusable task requests for common engineering work such as feature creation,
bug fixing, reviews, refactors, release preparation, and onboarding.

`workflows/`
: Repeatable procedures that describe how to carry out common engineering
processes.

`checklists/`
: Quality gates for delivery, security, release readiness, UI/UX review, and
definition of done.

`templates/`
: Reusable project instruction files, especially AGENTS-style files that can be
copied into specific repositories.

`skills/`
: Tool-backed workflows that combine instructions, references, and scripts for
repeatable project generation or project operations.

`scaffolds/`
: Generated project file models and template fragments used by skills to create
new projects.

`scripts/`
: Shared executable helpers and sync utilities.

`scripts/project-git/`
: Stack-agnostic Git and GitHub helpers for generated projects.

`scripts/project-netlify/`
: Shared Netlify readiness and initialization helpers for static projects.

`design-system/`
: UI/UX guidance for layout, typography, spacing, motion, visual language, and
anti-patterns.

`docs/`
: Human-facing documentation hub for repository usage, commands, workflows,
troubleshooting, and roadmap.

`AGENTS.md`
: Repository-wide Codex operating rules.

`README.md`
: Short entry point that explains the repository purpose and links to the
documentation hub.

## Documentation Navigation

- [Documentation Home](index.md)
- [Quick Start](quick-start.md)
- [Command Reference](command-reference.md)
- [Aliases](aliases.md)
- [Workflows](workflows/index.md)
- [Troubleshooting](troubleshooting.md)
- [Roadmap](roadmap.md)
