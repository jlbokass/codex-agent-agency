# Shell Aliases

These aliases are optional conveniences. Add only the ones you use to your shell
profile, such as `~/.zshrc`.

Set the repository path once:

```bash
export CODEX_AGENT_AGENCY="/Users/jean-le-grandbokassa/CodexProjects/codex-agent-agency"
```

## Project Bootstrap

```bash
alias codex-wp-bootstrap="$CODEX_AGENT_AGENCY/skills/wordpress-custom-theme-scaffold/scripts/bootstrap-wp-custom-project.sh"
alias codex-static-bootstrap="$CODEX_AGENT_AGENCY/skills/static-bootstrap-sass-mockup/scripts/bootstrap-static-mockup.sh"
```

Usage:

```bash
codex-wp-bootstrap
codex-static-bootstrap
```

## Netlify

```bash
alias codex-netlify-check="$CODEX_AGENT_AGENCY/scripts/project-netlify/check-netlify-ready.sh"
alias codex-netlify-init="$CODEX_AGENT_AGENCY/scripts/project-netlify/init-netlify-site.sh"
```

Usage:

```bash
codex-netlify-check --project-dir "/path/to/static-project"
codex-netlify-init --project-dir "/path/to/static-project"
```

## Git and GitHub Helpers

```bash
alias codex-git-init="$CODEX_AGENT_AGENCY/scripts/project-git/init-git-project.sh"
alias codex-gh-create="$CODEX_AGENT_AGENCY/scripts/project-git/create-github-repo.sh"
```

Usage:

```bash
codex-git-init --project-dir "/path/to/project"
codex-gh-create --project-dir "/path/to/project" --repo-name example-project
```
