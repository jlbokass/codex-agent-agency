# WordPress Custom Project Workflow

Use this workflow when creating a custom WordPress theme project, with an
optional companion plugin and optional Local WP integration.

This workflow has been validated end to end: theme/plugin generation, Local WP
symlinks, WordPress activation, and Git/GitHub setup.

## 1. Create the Local WP Site First

Create the site in Local WP before linking generated theme or plugin files. The
Local WP folder slug can differ from the visible site name, so confirm the
actual folder under:

```text
/Users/jean-le-grandbokassa/Local Sites
```

## 2. Run the WordPress Bootstrap Script

Interactive mode:

```bash
./skills/wordpress-custom-theme-scaffold/scripts/bootstrap-wp-custom-project.sh
```

Use long options when the project values are already known:

```bash
./skills/wordpress-custom-theme-scaffold/scripts/bootstrap-wp-custom-project.sh \
  --project-name "Example Project" \
  --project-slug example-project \
  --theme-name "Example Project Theme" \
  --theme-slug example-project-theme \
  --php-prefix example_project \
  --text-domain example-project \
  --with-plugin \
  --plugin-name "Example Project Core" \
  --plugin-slug example-project-core \
  --link-localwp \
  --local-site-slug example-project
```

## 3. Generate Theme and Optional Plugin

The bootstrap script delegates generation to the WordPress scaffold scripts. It
creates the project folder, theme folder, and optional plugin folder from the
repository scaffolds.

Keep theme and plugin responsibilities separate:

- Theme: presentation, templates, frontend assets, and WordPress theme support.
- Plugin: reusable business logic, custom post types, integrations, or
  functionality that should survive a theme change.

## 4. Create Local WP Symlinks

When `--link-localwp` is used, the workflow links the generated theme into the
Local WP `wp-content/themes` directory. If a plugin is generated, it also links
the plugin into `wp-content/plugins`.

Use `--force-localwp` only when replacing existing symlinks. Do not use it to
replace real theme or plugin directories.

## 5. Activate Theme and Plugin

Open the WordPress admin for the Local WP site:

- Activate the generated theme under Appearance.
- Activate the generated plugin under Plugins when a plugin was created.
- Confirm the frontend renders without PHP errors.

## 6. Optional Git and GitHub

The bootstrap script can initialize Git and create a GitHub repository:

```bash
./skills/wordpress-custom-theme-scaffold/scripts/bootstrap-wp-custom-project.sh \
  --project-name "Example Project" \
  --project-slug example-project \
  --theme-name "Example Project Theme" \
  --theme-slug example-project-theme \
  --php-prefix example_project \
  --text-domain example-project \
  --init-git \
  --create-github \
  --visibility private
```

GitHub creation requires GitHub CLI authentication:

```bash
gh auth status
```

## Workflow Navigation

- [Workflows Home](index.md)
- [Static Mockup](static-mockup.md)
- [Git and GitHub Helpers](git-github.md)
- [Netlify Workflow](netlify.md)

## Documentation Navigation

- [Documentation Home](../index.md)
- [Quick Start](../quick-start.md)
- [Command Reference](../command-reference.md)
- [Troubleshooting](../troubleshooting.md)
