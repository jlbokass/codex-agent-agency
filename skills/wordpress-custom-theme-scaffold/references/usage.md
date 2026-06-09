# Usage Guide

Use `scripts/bootstrap-wp-custom-project.sh` for the recommended interactive
workflow. Use the lower-level scripts directly when you need separate generation
and Local WP linking, Git, or GitHub steps.

## Recommended Interactive Usage

```bash
skills/wordpress-custom-theme-scaffold/scripts/bootstrap-wp-custom-project.sh
```

The orchestrator prompts for project values, calls
`scripts/create-wp-custom-theme.sh`, and optionally calls
`scripts/link-localwp.sh` plus the shared Git/GitHub helpers in
`scripts/project-git/`.

Generated projects include:

- a root `.gitignore` for common local development files
- a workflow-aware root `README.md` describing project structure, symlink state,
  Git state, GitHub state, and the fact that npm dependencies are not installed
  yet

Defaults:

- projects root: `/Users/jean-le-grandbokassa/Sites`
- Local WP sites root: `/Users/jean-le-grandbokassa/Local Sites`
- author name: `Jean Le Grand Bokassa`
- text domain: project slug
- theme slug: `<project-slug>-theme`
- plugin slug: `<project-slug>-core`

Git defaults:

- initial branch: `main`
- initial commit message: `Initial commit`
- GitHub repository name: project slug
- GitHub repository visibility: `private`
- Git remote name: `origin`

## Manual Generation Usage

```bash
skills/wordpress-custom-theme-scaffold/scripts/create-wp-custom-theme.sh \
  --project-name "Example Project" \
  --project-slug example-project \
  --theme-name "Example Project Theme" \
  --theme-slug example-project-theme \
  --php-prefix example_project \
  --text-domain example-project \
  --author-name "Jean Le Grand Bokassa" \
  --output-dir "/Users/jean-le-grandbokassa/Sites" \
  --with-plugin \
  --plugin-name "Example Project Core" \
  --plugin-slug example-project-core
```

## Manual Local WP Symlink Usage

```bash
skills/wordpress-custom-theme-scaffold/scripts/link-localwp.sh \
  --project-slug example-project \
  --local-site-slug example-local-site \
  --theme-slug example-project-theme \
  --with-plugin \
  --plugin-slug example-project-core
```

Use `--projects-root` or `--local-sites-root` when the generated project or
Local WP site lives outside the defaults.

## Git Initialization

Interactive bootstrap asks whether to initialize Git after local project
generation. When enabled, it calls:

```bash
scripts/project-git/init-git-project.sh \
  --project-dir "/Users/jean-le-grandbokassa/Sites/example-project" \
  --initial-branch main \
  --commit-message "Initial commit"
```

The Git helper fails if the project directory does not exist or already contains
a `.git` directory. The generated root `.gitignore` is included before Git
initialization. Skill-local Git scripts are compatibility wrappers only; shared
Git behavior should live in `scripts/project-git/`.

## GitHub Repository Creation

GitHub creation is optional and requires Git to be initialized first. The helper
uses GitHub CLI and never stores credentials in the project.

Before using GitHub automation, verify:

```bash
gh auth status
```

If authentication is missing, run:

```bash
gh auth login
```

Manual usage:

```bash
scripts/project-git/create-github-repo.sh \
  --project-dir "/Users/jean-le-grandbokassa/Sites/example-project" \
  --repo-name example-project \
  --visibility private \
  --description "Example Project WordPress theme" \
  --remote-name origin
```

Visibility choices:

- `private` - default; use for client work or private experiments.
- `public` - use only when the repository is intentionally public-safe.

Safe failure cases:

- GitHub creation is skipped safely when requested without Git initialization.
- GitHub creation fails clearly if GitHub CLI is missing.
- GitHub creation fails clearly if `gh auth status` does not succeed.
- GitHub creation fails clearly if the configured remote already exists.
- No credentials, tokens, or secrets are stored by the helpers.

## Complete Pharmacie Demo Example

```bash
skills/wordpress-custom-theme-scaffold/scripts/bootstrap-wp-custom-project.sh \
  --project-name "Pharmacie Demo" \
  --project-slug pharmacie-demo \
  --theme-name "Pharmacie Demo Theme" \
  --theme-slug pharmacie-demo-theme \
  --php-prefix pharmacie_demo \
  --text-domain pharmacie-demo \
  --author-name "Jean Le Grand Bokassa" \
  --with-plugin \
  --plugin-name "Pharmacie Demo Core" \
  --plugin-slug pharmacie-demo-core \
  --link-localwp \
  --local-site-slug pharmacie-demo \
  --init-git \
  --initial-branch main \
  --commit-message "Initial commit" \
  --create-github \
  --repo-name pharmacie-demo \
  --visibility private \
  --description "Pharmacie Demo WordPress theme" \
  --yes
```

This creates:

- `/Users/jean-le-grandbokassa/Sites/pharmacie-demo`
- `theme/pharmacie-demo-theme`
- `plugin/pharmacie-demo-core`
- optional Local WP symlinks when the `pharmacie-demo` Local WP site exists
- optional Git repository when `--init-git` is provided
- optional private GitHub repository when `--create-github` is provided and
  `gh auth status` succeeds

## Verify Symlinks

```bash
ls -l "/Users/jean-le-grandbokassa/Local Sites/pharmacie-demo/app/public/wp-content/themes/pharmacie-demo-theme"
ls -l "/Users/jean-le-grandbokassa/Local Sites/pharmacie-demo/app/public/wp-content/plugins/pharmacie-demo-core"
```

Expected output should show each path points back to the generated project under
`/Users/jean-le-grandbokassa/Sites/pharmacie-demo`.

## Remove Symlinks Safely

Only remove symlinks, never real directories:

```bash
test -L "/Users/jean-le-grandbokassa/Local Sites/pharmacie-demo/app/public/wp-content/themes/pharmacie-demo-theme" \
  && rm "/Users/jean-le-grandbokassa/Local Sites/pharmacie-demo/app/public/wp-content/themes/pharmacie-demo-theme"

test -L "/Users/jean-le-grandbokassa/Local Sites/pharmacie-demo/app/public/wp-content/plugins/pharmacie-demo-core" \
  && rm "/Users/jean-le-grandbokassa/Local Sites/pharmacie-demo/app/public/wp-content/plugins/pharmacie-demo-core"
```

## Troubleshooting

- `Output directory does not exist`: create the projects root or pass
  `--projects-root`.
- `Target project directory already exists`: choose a new project slug or remove
  the existing generated project intentionally.
- `README.md still says no symlinks were created`: use the bootstrap script for
  end-to-end metadata updates, or update the README manually after running lower
  level scripts directly.
- `Local WP site directory does not exist`: create the site in Local WP first or
  pass the correct `--local-site-slug`.
- `Destination already exists and is not a symlink`: remove or rename the real
  file or directory manually after confirming it is safe.
- `Destination already exists as a symlink`: re-run with `--force-localwp` for
  the orchestrator or `--force` for `link-localwp.sh`.
- `Plugin slug is required`: pass `--plugin-slug` whenever plugin creation or
  plugin linking is requested.
- `Project directory is already a Git repository`: skip Git initialization or
  choose a fresh project slug.
- `GitHub CLI (gh) is not installed`: install GitHub CLI before using GitHub
  automation.
- `GitHub CLI is not authenticated`: run `gh auth status`, then `gh auth login`
  if needed.
- `Git remote already exists`: choose another `--remote-name` or inspect the
  existing remote before retrying.
- `GitHub repository creation requires Git initialization first`: re-run with
  `--init-git`, or create the Git repository manually before GitHub automation.
