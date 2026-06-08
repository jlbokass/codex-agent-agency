---
name: static-bootstrap-sass-mockup
description: Define the workflow for creating static HTML, SCSS, custom Bootstrap through Sass, JavaScript, npm script, Sass CLI, and BrowserSync mockups before backend, CMS, or framework integration.
---

# Static Bootstrap Sass Mockup

Use this skill when asked to create or plan a static frontend mockup before
backend, CMS, or framework integration. The default future workflow should use
HTML, SCSS, Bootstrap customized through Sass, JavaScript without bundling by
default, optional jQuery, npm scripts, Sass CLI, and BrowserSync for local
development and live reload.

This skill now has a first reusable scaffold at
`scaffolds/static-bootstrap-sass/`.

This skill also includes a first local generator script:
`scripts/create-static-mockup.sh`. The script generates a local static mockup
project from the scaffold. It does not install dependencies, initialize Git,
create GitHub repositories, use Vite, use Webpack, or add backend/CMS-specific
files.

Vite is not used by default. Webpack is not used by default. JavaScript bundling
is not used by default. Vite or Webpack may be considered later only for
projects that justify that additional tooling.

For the detailed workflow, read `references/workflow.md`. For command examples
and troubleshooting, read `references/usage.md`.

## Purpose

The skill is intended to support a future workflow that can:

- create static mockups before backend or CMS integration
- use HTML, SCSS, Bootstrap customized through Sass, and lightweight JavaScript
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
- whether Bootstrap should be customized through Sass
- whether custom Sass structure should be included
- whether custom mixins should be included
- whether JavaScript interactions should be included
- whether jQuery should be included
- whether BrowserSync should be included
- whether Git should be initialized later
- whether GitHub repository creation should be handled later

## Expected Outputs

The future mockup workflow should produce:

- project folder
- `package.json`
- npm scripts
- `src/` folder
- `src/scss/`
- `src/scss/abstracts/_variables.scss`
- `src/scss/abstracts/_mixins.scss`
- `src/js/main.js`
- `public/` HTML pages
- SCSS architecture
- JavaScript entry point
- assets folder
- `assets/css/`
- `assets/js/`
- documentation folder
- root `README.md`
- root `.gitignore`

## Expected npm Scripts

The future scaffold should define:

- `npm run dev`
- `npm run serve`
- `npm run watch:scss`
- `npm run build`

`npm run dev` should run Sass watch, start a local static server, and reload on
HTML, CSS, and JavaScript changes.

## Boundaries

- This skill creates static mockups only.
- This skill does not create WordPress themes.
- This skill does not create Laravel or Symfony projects.
- This skill does not connect to a CMS.
- This skill does not generate client-specific production content unless
  explicitly requested.
- This skill focuses on frontend structure and visual validation.
