# Static Mockup Workflow

Use this workflow to create a static HTML, Sass, Bootstrap-through-Sass,
BrowserSync, and JavaScript mockup.

This workflow has been validated end to end: static project generation, npm
workflow, Git/GitHub setup, Netlify connection, and client URL.

## 1. Run the Static Bootstrap Script

```bash
./skills/static-bootstrap-sass-mockup/scripts/bootstrap-static-mockup.sh
```

The bootstrap prompts for the project name, project slug, author, pages, output
directory, dependency installation, local dev startup, Git, GitHub setup, and
optional Netlify setup.

## 2. Choose Pages

The default pages are:

```text
index,about,services,works,contact
```

Use `index` for the homepage. Custom page slugs should use lowercase letters,
numbers, and hyphens.

## 3. Install npm Dependencies

If the bootstrap did not install dependencies, run:

```bash
cd "/Users/jean-le-grandbokassa/Sites/example-static-mockup"
npm install
```

## 4. Run the Development Server

```bash
npm run dev
```

The dev command runs Sass watch and BrowserSync. BrowserSync serves `public/`
and reloads when HTML, CSS, or JavaScript changes.

## 5. Optional Git and GitHub

The bootstrap can initialize Git and create a GitHub repository through the
shared helpers. GitHub setup requires:

```bash
gh auth status
```

Use private repositories for client work or experiments that should not be
public.

## 6. Optional Netlify

Generated static projects include `netlify.toml` and use:

- build command: `npm run build`
- publish directory: `public`

The static bootstrap can launch the shared Netlify workflow when it asks:

```text
Prepare/connect project with Netlify [y/N]
```

The default is no. If selected, it passes the generated project directory to the
shared Netlify bootstrap. The project should already be a Git repository and
should already have a GitHub remote before `netlify init`.

The standalone Netlify workflow remains available:

```bash
./scripts/project-netlify/bootstrap-netlify-site.sh \
  --project-dir "/Users/jean-le-grandbokassa/Sites/example-static-mockup"
```

Manual deploy is optional and not the default. Continuous deployment through
`netlify init` is the preferred workflow.

Authenticate the Netlify CLI before initialization:

```bash
netlify login
```

## Workflow Navigation

- [Workflows Home](index.md)
- [WordPress Custom Project](wordpress-custom-project.md)
- [Git and GitHub Helpers](git-github.md)
- [Netlify Workflow](netlify.md)

## Documentation Navigation

- [Documentation Home](../index.md)
- [Quick Start](../quick-start.md)
- [Command Reference](../command-reference.md)
- [Troubleshooting](../troubleshooting.md)
