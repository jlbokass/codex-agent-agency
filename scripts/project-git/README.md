# Project Git Helpers

Stack-agnostic Git and GitHub helper scripts for generated projects.

These helpers are intended for reusable workflows such as WordPress, static
mockups, Symfony, Laravel, Astro, or future project generators. They should not
contain stack-specific assumptions.

Existing skill-specific script paths may delegate to these helpers for backward
compatibility, but new reusable Git/GitHub behavior should live here.

## Available Scripts

- `init-git-project.sh` initializes a local Git repository and creates the
  initial commit.
- `create-github-repo.sh` creates a GitHub repository with GitHub CLI, adds the
  remote, and pushes the current branch.

## Examples

Initialize Git:

```bash
scripts/project-git/init-git-project.sh \
  --project-dir "/path/to/project" \
  --initial-branch main \
  --commit-message "Initial commit"
```

Create a private GitHub repository:

```bash
scripts/project-git/create-github-repo.sh \
  --project-dir "/path/to/project" \
  --repo-name example-project \
  --visibility private \
  --description "Example generated project"
```

## Safety Rules

- Scripts fail if the project directory does not exist.
- Git initialization fails if the directory already contains `.git`.
- GitHub repository creation fails if the project is not already a Git
  repository.
- GitHub repository creation fails if the target remote already exists.
- Repository visibility must be `private` or `public`.
- No credentials, tokens, or secrets are stored by these scripts.

## GitHub CLI

`create-github-repo.sh` requires GitHub CLI:

```bash
gh auth status
```

If authentication is missing, run `gh auth login` manually before using the
helper.
