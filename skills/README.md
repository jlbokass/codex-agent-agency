# Codex Skills

The `skills/` directory will contain executable or semi-executable Codex
workflows. Skills are for repeatable work that benefits from a defined process,
supporting scripts, reference material, or reusable assets.

Each skill should live in its own folder and normally include:

- `SKILL.md`
- optional `scripts/`
- optional `assets/`
- optional `references/`

## Example Skill Types

Skills may cover repeatable workflows such as:

- creating a WordPress custom theme
- creating a static Bootstrap/Sass mockup
- setting up project quality gates

## Current Skills

- `wordpress-custom-theme-scaffold/` - defines the contract and future workflow
  for generating a custom WordPress theme project, with optional companion
  plugin, Local WP symlinks, Git initialization, and GitHub setup.
- `static-bootstrap-sass-mockup/` - defines the contract and future workflow for
  creating static HTML, SCSS, Bootstrap customized through Sass, lightweight
  JavaScript, npm script, Sass CLI, and BrowserSync mockups before backend or
  CMS integration.
- `static-to-wordpress-integration/` - defines the contract and future workflow
  for converting validated static mockups into maintainable WordPress custom
  themes with optional companion plugin content modeling.

This directory is reserved for workflow definitions. It does not contain
generated project scaffolds.
