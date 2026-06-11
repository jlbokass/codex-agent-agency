# Netlify Workflow

The Netlify workflow is for generated static projects. It prepares and links a
Git-backed static project to Netlify, but it does not run deployment commands or
store credentials.

## Netlify-Ready Static Project

A static project must include:

- `package.json`
- `netlify.toml`
- `public/`
- `public/index.html`

The build must create:

```text
public/assets/css/main.css
```

## Netlify Configuration

Generated static projects should include `netlify.toml` with:

```toml
[build]
  command = "npm run build"
  publish = "public"
```

The publish directory is:

```text
public
```

## Build Locally

From the generated static project:

```bash
npm install
npm run build
```

## Authenticate Netlify CLI

Install and authenticate the Netlify CLI before initialization:

```bash
netlify login
netlify status
```

Authentication confirms that the local CLI can access your Netlify account. It
does not mean the current project is already linked to a Netlify site.

## Check Netlify Readiness

From the repository root:

```bash
./scripts/project-netlify/check-netlify-ready.sh \
  --project-dir "/path/to/static-project"
```

This helper validates the expected files, runs `npm run build`, and confirms
the expected CSS output exists.

## Initialize the Netlify Site

The static project must be a Git repository and must already have a remote.

```bash
./scripts/project-netlify/init-netlify-site.sh \
  --project-dir "/path/to/static-project"
```

The helper runs `netlify status` and then `netlify init`. `netlify init` may ask
interactive questions about team, site name, and repository connection.

## Workflow Navigation

- [Workflows Home](index.md)
- [WordPress Custom Project](wordpress-custom-project.md)
- [Static Mockup](static-mockup.md)
- [Git and GitHub Helpers](git-github.md)

## Documentation Navigation

- [Documentation Home](../index.md)
- [Quick Start](../quick-start.md)
- [Command Reference](../command-reference.md)
- [Troubleshooting](../troubleshooting.md)
