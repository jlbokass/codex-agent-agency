# Usage Guide

Use `scripts/bootstrap-static-mockup.sh` for the recommended interactive
workflow. Use `scripts/create-static-mockup.sh` directly when you already know
all values and want manual generation.

Both scripts generate a local static HTML, SCSS, Bootstrap-through-Sass,
BrowserSync, and JavaScript mockup from the reusable scaffold.

Generated static projects are Netlify-ready: `public/` is a self-contained
publish directory and `netlify.toml` prepares the future deployment workflow.
The interactive bootstrap can optionally launch the shared Netlify workflow, and
manual deploy remains optional and off by default.

## Recommended Interactive Usage

```bash
skills/static-bootstrap-sass-mockup/scripts/bootstrap-static-mockup.sh
```

The interactive bootstrap asks for:

- project name
- project slug
- author name
- pages to create
- output directory
- whether to run `npm install`
- whether to run `npm run dev`
- whether to initialize Git
- initial branch name
- initial commit message
- whether to create a GitHub repository
- repository name
- repository visibility
- repository description
- whether to prepare or connect the project with Netlify

If `npm run dev` is selected, the script starts it only after dependencies have
been installed by the script. The terminal remains occupied by BrowserSync and
Sass watch until the dev command is stopped.

## Git Initialization

The interactive bootstrap can initialize Git after the static project is
generated. If selected, it calls the shared helper:

```bash
scripts/project-git/init-git-project.sh
```

Defaults:

- initial branch: `main`
- initial commit message: `Initial commit`

Git initialization fails safely if the generated project is already a Git
repository.

## GitHub Repository Creation

The interactive bootstrap can create a GitHub repository after Git
initialization. If selected, it calls the shared helper:

```bash
scripts/project-git/create-github-repo.sh
```

Defaults:

- repository name: project slug
- repository visibility: `private`

Allowed visibility values are `private` and `public`. Use `private` for work
that should not be visible publicly. Use `public` only when the repository is
intended to be open.

GitHub repository creation requires GitHub CLI:

```bash
gh auth status
```

If `gh` is missing or not authenticated, the shared helper fails clearly. The
scripts do not store credentials, tokens, or secrets.

If GitHub repository creation is requested without Git being initialized, the
interactive bootstrap skips GitHub creation safely and prints a clear message.

## Optional Netlify Connection

The interactive `staticbootstrap` workflow can launch the shared Netlify
bootstrap after project generation and optional Git/GitHub setup. It delegates
to:

```bash
scripts/project-netlify/bootstrap-netlify-site.sh
```

The generated project directory is passed to the shared helper. The Netlify
helper still performs its own readiness, Git, Netlify CLI, and deployment
prompts.

A GitHub remote is recommended before Netlify initialization because
`netlify init` is used to connect the project for continuous deployment.
Manual deploy is optional and is not the default.

The standalone alias remains available after sourcing the shell aliases:

```bash
netlifybootstrap
```

## Manual Generator Usage

```bash
skills/static-bootstrap-sass-mockup/scripts/create-static-mockup.sh \
  --project-name "Example Static Mockup" \
  --project-slug example-static-mockup \
  --author-name "Jean Le Grand Bokassa" \
  --output-dir "/Users/jean-le-grandbokassa/Sites"
```

The default pages are:

```text
index,about,services,works,contact
```

Use `--pages` to provide a custom comma-separated list. `index` is always kept.
Known templates are used when available; otherwise the generator creates a
simple generic page.

## Pharmacie Static Demo

```bash
skills/static-bootstrap-sass-mockup/scripts/create-static-mockup.sh \
  --project-name "Pharmacie Static Demo" \
  --project-slug pharmacie-static-demo \
  --author-name "Jean Le Grand Bokassa" \
  --pages index,about,services,works,contact \
  --output-dir "/Users/jean-le-grandbokassa/Sites"
```

## Install Dependencies

```bash
cd "/Users/jean-le-grandbokassa/Sites/pharmacie-static-demo"
npm install
```

## Run Development Server

```bash
npm run dev
```

`npm run dev` runs Sass in watch mode and starts BrowserSync. BrowserSync serves
`public/`, opens `public/index.html`, and reloads on HTML, CSS, and JavaScript
changes.

## Build CSS

```bash
npm run build
```

SCSS compiles from `src/scss/main.scss` to `public/assets/css/main.css`. The
generated project does not use Vite or Webpack. JavaScript is simple,
unbundled, and edited directly in `public/assets/js/main.js`. Bootstrap Sass
dependency deprecation warnings are hidden with `--quiet-deps`.

## Netlify-Ready Output

Generated projects include `netlify.toml` with:

- build command: `npm run build`
- publish directory: `public`

This prepares the project for a future Netlify deployment workflow. It does not
force `netlify init`, `netlify deploy`, or any CI/CD automation. Netlify setup
only runs when selected from `staticbootstrap` or when launched separately with
`netlifybootstrap`.

## Troubleshooting

- `Output directory does not exist`: create the directory or pass a valid
  `--output-dir`.
- `Target project directory already exists`: choose another project slug or
  remove the existing generated project intentionally.
- `Page slug must use lowercase letters, numbers, and hyphens only`: check the
  comma-separated `--pages` value.
- `npm run dev` does not start: run `npm install` first.
- Git initialization fails: confirm the generated project does not already have
  a `.git` directory.
- GitHub repository creation fails because `gh` is missing: install GitHub CLI
  and rerun the GitHub step manually.
- GitHub repository creation fails because authentication is missing: run
  `gh auth status`, then `gh auth login` if needed.
- GitHub repository creation fails because the remote exists: inspect
  `git remote -v` before retrying.
- BrowserSync reports a busy port: check port 3000 with `lsof -i :3000` and
  port 3001 with `lsof -i :3001`; kill stale processes only when needed.
- BrowserSync does not reload: confirm generated pages live in `public/` and
  compiled CSS lives in `public/assets/css/main.css`.
