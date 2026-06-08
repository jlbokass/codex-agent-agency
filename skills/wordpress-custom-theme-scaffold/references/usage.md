# Usage Guide

Use `scripts/bootstrap-wp-custom-project.sh` for the recommended interactive
workflow. Use the lower-level scripts directly when you need separate generation
and Local WP linking steps.

## Recommended Interactive Usage

```bash
skills/wordpress-custom-theme-scaffold/scripts/bootstrap-wp-custom-project.sh
```

The orchestrator prompts for project values, calls
`scripts/create-wp-custom-theme.sh`, and optionally calls
`scripts/link-localwp.sh`.

Defaults:

- projects root: `/Users/jean-le-grandbokassa/Sites`
- Local WP sites root: `/Users/jean-le-grandbokassa/Local Sites`
- author name: `Jean Le Grand Bokassa`
- text domain: project slug
- theme slug: `<project-slug>-theme`
- plugin slug: `<project-slug>-core`

## Manual Generation Usage

```bash
skills/wordpress-custom-theme-scaffold/scripts/create-wp-custom-theme.sh \
  --project-name "Example Project" \
  --project-slug example-project \
  --theme-name "Example Project Theme" \
  --theme-slug example-project-theme \
  --php-prefix example_project \
  --text-domain example-project \
  --author-name "Jean Le Grand Bokassa" \
  --output-dir "/Users/jean-le-grandbokassa/Sites" \
  --with-plugin \
  --plugin-name "Example Project Core" \
  --plugin-slug example-project-core
```

## Manual Local WP Symlink Usage

```bash
skills/wordpress-custom-theme-scaffold/scripts/link-localwp.sh \
  --project-slug example-project \
  --local-site-slug example-local-site \
  --theme-slug example-project-theme \
  --with-plugin \
  --plugin-slug example-project-core
```

Use `--projects-root` or `--local-sites-root` when the generated project or
Local WP site lives outside the defaults.

## Complete Pharmacie Demo Example

```bash
skills/wordpress-custom-theme-scaffold/scripts/bootstrap-wp-custom-project.sh \
  --project-name "Pharmacie Demo" \
  --project-slug pharmacie-demo \
  --theme-name "Pharmacie Demo Theme" \
  --theme-slug pharmacie-demo-theme \
  --php-prefix pharmacie_demo \
  --text-domain pharmacie-demo \
  --author-name "Jean Le Grand Bokassa" \
  --with-plugin \
  --plugin-name "Pharmacie Demo Core" \
  --plugin-slug pharmacie-demo-core \
  --link-localwp \
  --local-site-slug pharmacie-demo \
  --yes
```

This creates:

- `/Users/jean-le-grandbokassa/Sites/pharmacie-demo`
- `theme/pharmacie-demo-theme`
- `plugin/pharmacie-demo-core`
- optional Local WP symlinks when the `pharmacie-demo` Local WP site exists

## Verify Symlinks

```bash
ls -l "/Users/jean-le-grandbokassa/Local Sites/pharmacie-demo/app/public/wp-content/themes/pharmacie-demo-theme"
ls -l "/Users/jean-le-grandbokassa/Local Sites/pharmacie-demo/app/public/wp-content/plugins/pharmacie-demo-core"
```

Expected output should show each path points back to the generated project under
`/Users/jean-le-grandbokassa/Sites/pharmacie-demo`.

## Remove Symlinks Safely

Only remove symlinks, never real directories:

```bash
test -L "/Users/jean-le-grandbokassa/Local Sites/pharmacie-demo/app/public/wp-content/themes/pharmacie-demo-theme" \
  && rm "/Users/jean-le-grandbokassa/Local Sites/pharmacie-demo/app/public/wp-content/themes/pharmacie-demo-theme"

test -L "/Users/jean-le-grandbokassa/Local Sites/pharmacie-demo/app/public/wp-content/plugins/pharmacie-demo-core" \
  && rm "/Users/jean-le-grandbokassa/Local Sites/pharmacie-demo/app/public/wp-content/plugins/pharmacie-demo-core"
```

## Troubleshooting

- `Output directory does not exist`: create the projects root or pass
  `--projects-root`.
- `Target project directory already exists`: choose a new project slug or remove
  the existing generated project intentionally.
- `Local WP site directory does not exist`: create the site in Local WP first or
  pass the correct `--local-site-slug`.
- `Destination already exists and is not a symlink`: remove or rename the real
  file or directory manually after confirming it is safe.
- `Destination already exists as a symlink`: re-run with `--force-localwp` for
  the orchestrator or `--force` for `link-localwp.sh`.
- `Plugin slug is required`: pass `--plugin-slug` whenever plugin creation or
  plugin linking is requested.
