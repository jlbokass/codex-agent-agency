# Codex Agent Agency

Reusable Codex agents, prompts, workflows, skills, scaffolds, scripts,
checklists, templates, and design-system guidance for local project work.

This repository is a development command center: it keeps repeatable project
generation and engineering procedures in one place without storing credentials,
sessions, logs, cache files, tokens, or temporary runtime state.

Detailed documentation lives in [docs/index.md](docs/index.md).

## Important Commands

WordPress custom project bootstrap:

```bash
./skills/wordpress-custom-theme-scaffold/scripts/bootstrap-wp-custom-project.sh
```

Static mockup bootstrap:

```bash
./skills/static-bootstrap-sass-mockup/scripts/bootstrap-static-mockup.sh
```

Initialize Git for a generated project:

```bash
./scripts/project-git/init-git-project.sh --project-dir "/path/to/project"
```

Create a GitHub repository for a generated Git project:

```bash
./scripts/project-git/create-github-repo.sh \
  --project-dir "/path/to/project" \
  --repo-name example-project
```

Check Netlify readiness:

```bash
./scripts/project-netlify/check-netlify-ready.sh \
  --project-dir "/path/to/static-project"
```

Run the interactive Netlify workflow:

```bash
./scripts/project-netlify/bootstrap-netlify-site.sh
```

Initialize a Netlify site with the low-level helper:

```bash
./scripts/project-netlify/init-netlify-site.sh \
  --project-dir "/path/to/static-project"
```

Start with [the documentation hub](docs/index.md) for folder roles, workflow
guides, command reference, aliases, troubleshooting, and roadmap.
