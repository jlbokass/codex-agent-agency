# Static Bootstrap Sass Scaffold

Reusable static HTML, SCSS, and JavaScript scaffold for `{{PROJECT_NAME}}`.

This scaffold is for static mockups before integration into WordPress, Laravel,
Symfony, Astro, Vue, or another frontend stack. It uses a lightweight npm,
Sass CLI, Bootstrap-through-Sass, and BrowserSync workflow.

It does not use Vite or Webpack. JavaScript is loaded directly without bundling
or transpilation by default.

## Placeholders

- `{{PROJECT_NAME}}`
- `{{PROJECT_SLUG}}`
- `{{AUTHOR_NAME}}`

## Structure

- `public/` contains static HTML pages and runtime assets. It is the
  publishable directory.
- `public/assets/css/` is the compiled CSS output target.
- `public/assets/js/main.js` is edited directly and loaded by static pages.
- `public/assets/images/` is reserved for mockup imagery.
- `src/scss/` contains source Sass files.
- `netlify.toml` configures the future Netlify build and publish settings.

## Development Server

- BrowserSync serves `public/`.
- Pages are opened from `public/index.html`.
- SCSS compiles from `src/scss/main.scss` to `public/assets/css/main.css`.
- JavaScript is edited directly in `public/assets/js/main.js`.

## Build

```bash
npm run build
```

Netlify settings:

- build command: `npm run build`
- publish directory: `public`

## Troubleshooting

- Check BrowserSync port 3000 with `lsof -i :3000`.
- Check BrowserSync UI port 3001 with `lsof -i :3001`.
- Kill stale processes only when a stopped dev command leaves a port busy.
- Bootstrap Sass dependency deprecation warnings are hidden with `--quiet-deps`.

Do not add client-specific production content to this scaffold unless explicitly
requested.
