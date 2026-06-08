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

- `public/` contains static HTML pages.
- `src/scss/` contains source Sass files.
- `assets/css/` is the compiled CSS output target.
- `assets/js/main.js` is edited directly and loaded by static pages.
- `assets/images/` is reserved for mockup imagery.

## Development Server

- BrowserSync serves the project root.
- Pages are opened from `public/index.html`.
- SCSS compiles from `src/scss/main.scss` to `assets/css/main.css`.
- JavaScript is edited directly in `assets/js/main.js`.

## Troubleshooting

- Check BrowserSync port 3000 with `lsof -i :3000`.
- Check BrowserSync UI port 3001 with `lsof -i :3001`.
- Kill stale processes only when a stopped dev command leaves a port busy.
- Bootstrap Sass dependency deprecation warnings are hidden with `--quiet-deps`.

Do not add client-specific production content to this scaffold unless explicitly
requested.
