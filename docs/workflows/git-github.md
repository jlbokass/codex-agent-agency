# Git and GitHub Workflow

The shared Git and GitHub helpers live in `scripts/project-git/`. They are
stack-agnostic so WordPress, static mockup, Symfony, Laravel, Astro, and future
workflows can call the same behavior without duplicating Git logic.

## Purpose

- Initialize a local Git repository for a generated project.
- Create an initial commit.
- Optionally create a GitHub repository.
- Add the configured remote.
- Push the current branch with upstream tracking.

## Initialize Git

```bash
./scripts/project-git/init-git-project.sh \
  --project-dir "/path/to/project" \
  --initial-branch main \
  --commit-message "Initial commit"
```

The helper does not configure remotes or push code.

## Create a GitHub Repository

```bash
./scripts/project-git/create-github-repo.sh \
  --project-dir "/path/to/project" \
  --repo-name example-project \
  --visibility private \
  --description "Example project" \
  --remote-name origin
```

## GitHub CLI Requirement

GitHub repository creation requires GitHub CLI:

```bash
gh auth status
```

If authentication is missing, run:

```bash
gh auth login
```

The helpers do not store credentials, tokens, or secrets.

## Repository Visibility

Use `private` by default for client work, experiments, or work that has not been
reviewed for public release.

Use `public` only when the repository is intentionally public-safe.

## Safe Failure Cases

- Git initialization fails if the project directory does not exist.
- Git initialization fails if the project already contains `.git`.
- GitHub creation fails if the project is not already a Git repository.
- GitHub creation fails if GitHub CLI is missing.
- GitHub creation fails if `gh auth status` does not succeed.
- GitHub creation fails if the configured remote already exists.
- GitHub creation fails if visibility is not `private` or `public`.

## Workflow Navigation

- [Workflows Home](index.md)
- [WordPress Custom Project](wordpress-custom-project.md)
- [Static Mockup](static-mockup.md)
- [Netlify Workflow](netlify.md)

## Documentation Navigation

- [Documentation Home](../index.md)
- [Quick Start](../quick-start.md)
- [Command Reference](../command-reference.md)
- [Troubleshooting](../troubleshooting.md)
