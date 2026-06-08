# Future Workflow

This reference describes the intended execution flow for the WordPress custom
theme scaffold skill. The recommended interactive path is
`scripts/bootstrap-wp-custom-project.sh`, which calls
`scripts/create-wp-custom-theme.sh` and optionally calls
`scripts/link-localwp.sh`. Git initialization, GitHub repository creation, and
pushes remain future steps.

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

7. Initialize Git in a future step
   - Initialize a Git repository when requested.
   - Add an initial `.gitignore` suitable for the generated project.
   - Stage the generated scaffold files.
   - Commit only when explicitly requested by the user.

8. Create optional GitHub repository in a future step
   - Create the GitHub repository only when requested.
   - Use the requested visibility.
   - Add the GitHub remote to the local repository.
   - Push only when explicitly requested by the user.

9. Display final next steps
   - Show the generated project path.
   - Show theme and plugin paths.
   - Show Local WP symlink status when applicable.
   - Show Git and GitHub status when applicable.
   - List manual checks needed before WordPress activation.
