---
name: static-bootstrap-sass-mockup
description: Define the workflow for creating static HTML, SCSS, custom Bootstrap, Sass, and JavaScript mockups before backend, CMS, or framework integration.
---

# Static Bootstrap Sass Mockup

Use this skill when asked to create or plan a static frontend mockup before
backend, CMS, or framework integration. The future workflow should use HTML,
SCSS, custom Bootstrap, Sass, and JavaScript to validate visual design,
spacing, responsive behavior, and UI components before implementation in a
production stack.

This skill currently defines the contract and workflow only. It does not include
static scaffold files, shell scripts, `package.json`, Vite configuration, or
generated HTML, CSS, SCSS, or JavaScript files.

For the detailed future execution sequence, read `references/workflow.md`.

## Purpose

The skill is intended to support a future workflow that can:

- create static mockups before backend or CMS integration
- use HTML, SCSS, custom Bootstrap, Sass, and JavaScript
- validate visual design, spacing, responsive behavior, and UI components before
  integration
- prepare mockups that can later be integrated into WordPress, Laravel, Symfony,
  Astro, Vue, or another frontend stack

## Expected Inputs

Collect and confirm these inputs before generating files:

- project name
- project slug
- author name
- number of pages
- page names
- design style notes
- whether Bootstrap should be included
- whether custom Sass structure should be included
- whether JavaScript interactions should be included
- whether Git should be initialized later
- whether GitHub repository creation should be handled later

## Expected Outputs

The future mockup workflow should produce:

- project folder
- `src/` folder
- `public/` folder or static HTML pages
- SCSS architecture
- JavaScript entry point
- assets folder
- documentation folder
- root `README.md`
- root `.gitignore`

## Boundaries

- This skill creates static mockups only.
- This skill does not create WordPress themes.
- This skill does not create Laravel or Symfony projects.
- This skill does not connect to a CMS.
- This skill does not generate client-specific production content unless
  explicitly requested.
- This skill focuses on frontend structure and visual validation.
