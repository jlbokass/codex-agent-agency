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
- `src/js/main.js` contains the unbundled JavaScript entry point.
- `assets/css/` is the compiled CSS output target.
- `assets/js/` is the static JavaScript output target.
- `assets/images/` is reserved for mockup imagery.

Do not add client-specific production content to this scaffold unless explicitly
requested.
