# Project Instruction Templates

The `templates/` directory contains reusable Codex project instruction templates.
These files are meant to be copied or adapted into project-level `AGENTS.md`
files when setting up Codex behavior for a specific repository.

These templates describe operating context and engineering expectations. They do
not contain generated application code, starter themes, plugin skeletons, or
other code scaffolds.

## Current Templates

- `AGENTS.astro-vue-sanity-netlify.md` - Astro / Vue / Sanity / Netlify projects.
- `AGENTS.symfony-ui.md` - Symfony projects with UI-focused implementation needs.
- `AGENTS.wordpress-bedrock.md` - WordPress projects using Bedrock-style structure.
- `AGENTS.wordpress-custom.md` - custom WordPress theme and plugin projects.

## Naming Convention

Template files should use this pattern:

```text
AGENTS.<stack-or-context>.md
```

Each template should describe:

- project context
- stack assumptions
- quality rules
- expected workflows
