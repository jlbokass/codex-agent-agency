# Command Reference

Run repository commands from the repository root unless noted otherwise.

## WordPress Custom Project Bootstrap

```bash
./skills/wordpress-custom-theme-scaffold/scripts/bootstrap-wp-custom-project.sh
```

Alias after sourcing `scripts/shell/aliases.zsh`:

```bash
wpbootstrap
```

Purpose: interactive orchestrator for generating a WordPress custom theme
project, optional companion plugin, optional Local WP symlinks, optional Git
initialization, and optional GitHub repository creation.

Common options:

```bash
./skills/wordpress-custom-theme-scaffold/scripts/bootstrap-wp-custom-project.sh \
  --project-name "Example Project" \
  --project-slug example-project \
  --theme-name "Example Project Theme" \
  --theme-slug example-project-theme \
  --php-prefix example_project \
  --text-domain example-project \
  --author-name "Jean Le Grand Bokassa" \
  --with-plugin \
  --plugin-name "Example Project Core" \
  --plugin-slug example-project-core \
  --link-localwp \
  --local-site-slug example-project \
  --init-git \
  --create-github \
  --visibility private
```

## Static Mockup Bootstrap

```bash
./skills/static-bootstrap-sass-mockup/scripts/bootstrap-static-mockup.sh
```

Alias after sourcing `scripts/shell/aliases.zsh`:

```bash
staticbootstrap
```

Purpose: interactive orchestrator for generating a static HTML, Sass,
Bootstrap-through-Sass, BrowserSync, and JavaScript mockup.

The script prompts for project name, slug, author, pages, output directory,
dependency installation, local dev server startup, optional Git, and optional
GitHub setup. It can also optionally launch the shared Netlify bootstrap for
the generated project.

## Initialize Git

```bash
./scripts/project-git/init-git-project.sh \
  --project-dir "/path/to/project" \
  --initial-branch main \
  --commit-message "Initial commit"
```

Purpose: initialize a local Git repository and create the initial commit.

Safe failures:

- Fails if the project directory does not exist.
- Fails if the project already contains `.git`.
- Does not create remotes, push code, or store credentials.

## Create GitHub Repository

```bash
./scripts/project-git/create-github-repo.sh \
  --project-dir "/path/to/project" \
  --repo-name example-project \
  --visibility private \
  --description "Example project" \
  --remote-name origin
```

Purpose: use GitHub CLI to create a repository, add a remote, and push the
current branch with upstream tracking.

Requirements:

- GitHub CLI (`gh`) must be installed.
- `gh auth status` must succeed.
- Visibility must be `private` or `public`.

## Check Netlify Readiness

```bash
./scripts/project-netlify/check-netlify-ready.sh \
  --project-dir "/path/to/static-project"
```

Alias after sourcing `scripts/shell/aliases.zsh`:

```bash
netlifycheck --project-dir "/path/to/static-project"
```

Purpose: validate that a static project has the expected Netlify structure, run
`npm run build`, and confirm `public/assets/css/main.css` exists.

Expected project files:

- `package.json`
- `netlify.toml`
- `public/`
- `public/index.html`

## Initialize Netlify Site

```bash
./scripts/project-netlify/init-netlify-site.sh \
  --project-dir "/path/to/static-project"
```

Alias after sourcing `scripts/shell/aliases.zsh`:

```bash
netlifyinit --project-dir "/path/to/static-project"
```

Purpose: validate Git and Netlify CLI state, then run `netlify init` from the
project directory.

Requirements:

- Project must be a Git repository.
- Project must have a Git remote.
- Netlify CLI must be installed.
- Netlify CLI must be authenticated with `netlify login`.

## Interactive Netlify Bootstrap

```bash
./scripts/project-netlify/bootstrap-netlify-site.sh \
  --project-dir "/path/to/static-project"
```

Alias after sourcing `scripts/shell/aliases.zsh`:

```bash
netlifybootstrap
```

Purpose: guide the user through Netlify readiness checks, optional Netlify
initialization/linking, and optional manual deploy.

This command can run standalone or from the static mockup orchestrator. Manual
deploy is optional and not the default.

## Documentation Navigation

- [Documentation Home](index.md)
- [Quick Start](quick-start.md)
- [Folder Roles](folder-roles.md)
- [Aliases](aliases.md)
- [Workflows](workflows/index.md)
- [Troubleshooting](troubleshooting.md)
- [Roadmap](roadmap.md)
