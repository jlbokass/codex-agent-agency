# Quick Start

These commands are the main entry points for project generation and deployment
preparation. Run them from the repository root unless a command changes into a
generated project directory.

Optional short aliases are available after sourcing the versioned alias file:

```zsh
source /Users/jean-le-grandbokassa/Sites/codex-agent-agency/scripts/shell/aliases.zsh
```

## WordPress Custom Project Bootstrap

Interactive mode:

```bash
./skills/wordpress-custom-theme-scaffold/scripts/bootstrap-wp-custom-project.sh
```

Example with common options:

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
  --local-site-slug example-project \
  --init-git \
  --create-github \
  --visibility private
```

## Static Mockup Bootstrap

Interactive mode:

```bash
./skills/static-bootstrap-sass-mockup/scripts/bootstrap-static-mockup.sh
```

After generation, install dependencies and start the local server if the
bootstrap did not already do it:

```bash
cd "/Users/jean-le-grandbokassa/Sites/example-static-mockup"
npm install
npm run dev
```

## Netlify Readiness Check

Use this after a static project exists and has dependencies installed:

```bash
./scripts/project-netlify/check-netlify-ready.sh \
  --project-dir "/Users/jean-le-grandbokassa/Sites/example-static-mockup"
```

The helper runs `npm run build` and confirms the expected `public/` output.

## Netlify Initialization

Authenticate the Netlify CLI first:

```bash
netlify login
```

Then initialize the Netlify site from a Git-backed static project:

```bash
./scripts/project-netlify/init-netlify-site.sh \
  --project-dir "/Users/jean-le-grandbokassa/Sites/example-static-mockup"
```

## Static to WordPress Integration

After a static mockup is validated and approved, use the
[Static to WordPress Integration](workflows/static-to-wordpress-integration.md)
workflow to plan the WordPress conversion before coding.

## Documentation Navigation

- [Documentation Home](index.md)
- [Folder Roles](folder-roles.md)
- [Command Reference](command-reference.md)
- [Aliases](aliases.md)
- [Workflows](workflows/index.md)
- [Troubleshooting](troubleshooting.md)
- [Roadmap](roadmap.md)
