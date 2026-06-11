# WordPress Classic Theme Scaffold

Reusable classic WordPress theme scaffold for `{{THEME_NAME}}`.

This scaffold keeps presentation, template rendering, assets, and theme setup in
the theme. It intentionally avoids Custom Post Types, taxonomies, metadata, and
business logic. Those responsibilities belong in a companion plugin when the
project needs them.

## Placeholders

- `{{THEME_NAME}}`
- `{{THEME_SLUG}}`
- `{{TEXT_DOMAIN}}`
- `{{PHP_PREFIX}}`
- `{{AUTHOR_NAME}}`

## Expected Structure

- `functions.php` loads small files from `inc/`.
- `inc/setup.php` registers theme supports and menus.
- `inc/enqueue.php` enqueues frontend assets.
- `template-parts/` contains reusable presentation fragments.
- `assets/src/` contains source Sass and JavaScript.
- `assets/dist/` is reserved for compiled assets.

Do not add client-specific content to this scaffold.
