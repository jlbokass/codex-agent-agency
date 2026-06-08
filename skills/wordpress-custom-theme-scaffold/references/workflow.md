# Future Workflow

This reference describes the intended execution flow for the WordPress custom
theme scaffold skill. The recommended interactive path is
`scripts/bootstrap-wp-custom-project.sh`, which calls
`scripts/create-wp-custom-theme.sh` and optionally calls
`scripts/link-localwp.sh`, `scripts/init-git-project.sh`, and
`scripts/create-github-repo.sh`.

## Steps

1. Start the interactive bootstrap workflow
   - Run `scripts/bootstrap-wp-custom-project.sh` for guided usage.
   - Use long-option overrides for known values when useful.
   - Use `references/usage.md` for full command examples and troubleshooting.

2. Collect inputs
   - Confirm the human project name.
   - Confirm the project slug.
   - Confirm the theme name.
   - Confirm the theme slug, PHP prefix, and text domain.
   - Confirm the author name.
   - Confirm the output directory.
   - Ask whether to create a companion plugin.
   - If a companion plugin is requested, confirm the plugin name and plugin
     slug.
   - Ask whether Local WP symlinks are needed.
   - If symlinks are requested, confirm the Local WP project path.
   - Ask whether to initialize Git.
   - Ask whether to create a GitHub repository.
   - If GitHub setup is requested, confirm repository visibility.

3. Validate slugs and prefixes
   - Ensure slugs use lowercase letters, numbers, and hyphens.
   - Ensure PHP prefixes use lowercase letters, numbers, and underscores.
   - Ensure the text domain is stable and compatible with WordPress translation
     conventions.
   - Ensure the output directory exists.
   - Ensure the target project directory does not already exist.
   - Ensure the plugin slug is present when a companion plugin is requested.
   - Ensure requested paths are explicit before creating symlinks.

4. Generate the local project
   - The bootstrap script calls `scripts/create-wp-custom-theme.sh` with the
     confirmed inputs.
   - The generator creates the root project folder.
   - The generator creates the theme folder.
   - The generator creates the optional plugin folder when requested.
   - The generator creates `README.md` and `docs/setup.md`.
   - The generator copies files from `scaffolds/wordpress-classic-theme/` into the
     theme folder.
   - The generator copies files from `scaffolds/wordpress-core-plugin/` into the
     plugin folder when requested.
   - Keep theme and plugin responsibilities separated.

5. Replace placeholders
   - The generator replaces `{{PROJECT_NAME}}`, `{{PROJECT_SLUG}}`,
     `{{THEME_NAME}}`, `{{THEME_SLUG}}`, `{{TEXT_DOMAIN}}`, `{{PHP_PREFIX}}`,
     and `{{AUTHOR_NAME}}` in theme scaffold files.
   - The generator replaces `{{PROJECT_NAME}}`, `{{PROJECT_SLUG}}`,
     `{{PLUGIN_NAME}}`, `{{PLUGIN_SLUG}}`, `{{TEXT_DOMAIN}}`, `{{PHP_PREFIX}}`,
     and `{{AUTHOR_NAME}}` in plugin scaffold files when a companion plugin is
     requested.
   - The generator renames `.tpl` files by removing the `.tpl` suffix.
   - Review generated names for consistency.

6. Create optional Local WP symlinks
   - The bootstrap script calls `scripts/link-localwp.sh` when Local WP linking
     is requested.
   - Confirm the project slug, Local WP site slug, and theme slug.
   - Confirm the plugin slug when plugin linking is requested.
   - Use the default projects root `/Users/jean-le-grandbokassa/Sites` unless
     `--projects-root` is provided.
   - Use the default Local WP sites root
     `/Users/jean-le-grandbokassa/Local Sites` unless `--local-sites-root` is
     provided.
   - The script links the generated theme into the Local WP
     `wp-content/themes` directory.
   - The script links the generated plugin into the Local WP
     `wp-content/plugins` directory when requested.
   - Use `--force` only to replace existing symlinks; never delete real files or
     directories.

7. Initialize Git when requested
   - The bootstrap script asks whether to initialize Git after project
     generation.
   - Confirm the initial branch name, default `main`.
   - Confirm the initial commit message, default `Initial commit`.
   - The bootstrap script calls `scripts/init-git-project.sh`.
   - The Git helper runs `git init -b`, `git add .`, and `git commit -m`.
   - The Git helper fails if the project directory is already a Git repository.

8. Create optional GitHub repository when requested
   - Ask whether to create a GitHub repository after Git initialization.
   - If GitHub creation is requested without Git initialization, explain that
     Git must be initialized first and skip GitHub creation safely.
   - Confirm the repository name, default project slug.
   - Confirm repository visibility, default `private`.
   - Confirm the optional repository description.
   - The bootstrap script calls `scripts/create-github-repo.sh`.
   - The GitHub helper requires GitHub CLI (`gh`) to be installed.
   - The GitHub helper requires `gh auth status` to succeed.
   - The GitHub helper fails if the requested remote already exists.
   - The GitHub helper creates the repository, adds the remote, and pushes the
     current branch with upstream tracking.

9. Display final next steps
   - Show the generated project path.
   - Show theme and plugin paths.
   - Show Local WP symlink status when applicable.
   - Show Git and GitHub status when applicable.
   - List manual checks needed before WordPress activation.
