# Static Mockup Workflow

Use this workflow to create a static HTML, Sass, Bootstrap-through-Sass,
BrowserSync, and JavaScript mockup.

## 1. Run the Static Bootstrap Script

```bash
./skills/static-bootstrap-sass-mockup/scripts/bootstrap-static-mockup.sh
```

The bootstrap prompts for the project name, project slug, author, pages, output
directory, dependency installation, local dev startup, Git, and GitHub setup.

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

Before initializing Netlify, run the readiness check:

```bash
./scripts/project-netlify/check-netlify-ready.sh \
  --project-dir "/Users/jean-le-grandbokassa/Sites/example-static-mockup"
```

Then authenticate and initialize:

```bash
netlify login
./scripts/project-netlify/init-netlify-site.sh \
  --project-dir "/Users/jean-le-grandbokassa/Sites/example-static-mockup"
```
