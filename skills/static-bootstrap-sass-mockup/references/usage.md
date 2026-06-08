# Usage Guide

Use `scripts/create-static-mockup.sh` to generate a local static HTML, SCSS,
Bootstrap-through-Sass, BrowserSync, and JavaScript mockup from the reusable
scaffold.

## Recommended Generation Command

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
the project root, opens `public/index.html`, and reloads on HTML, CSS, and
JavaScript changes.

## Build CSS

```bash
npm run build
```

SCSS compiles from `src/scss/main.scss` to `assets/css/main.css`. The generated
project does not use Vite or Webpack. JavaScript is simple, unbundled, and
edited directly in `assets/js/main.js`. Bootstrap Sass dependency deprecation
warnings are hidden with `--quiet-deps`.

## Troubleshooting

- `Output directory does not exist`: create the directory or pass a valid
  `--output-dir`.
- `Target project directory already exists`: choose another project slug or
  remove the existing generated project intentionally.
- `Page slug must use lowercase letters, numbers, and hyphens only`: check the
  comma-separated `--pages` value.
- `npm run dev` does not start: run `npm install` first.
- BrowserSync reports a busy port: check port 3000 with `lsof -i :3000` and
  port 3001 with `lsof -i :3001`; kill stale processes only when needed.
- BrowserSync does not reload: confirm generated pages live in `public/` and
  compiled CSS lives in `assets/css/main.css`.
