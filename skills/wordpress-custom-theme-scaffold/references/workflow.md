# Future Workflow

This reference describes the intended execution flow for the WordPress custom
theme scaffold skill. Local project generation is now handled by
`scripts/create-wp-custom-theme.sh`. Local WP symlinks, Git initialization,
GitHub repository creation, and pushes remain future steps.

## Steps

1. Collect inputs
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

2. Validate slugs and prefixes
   - Ensure slugs use lowercase letters, numbers, and hyphens.
   - Ensure PHP prefixes use lowercase letters, numbers, and underscores.
   - Ensure the text domain is stable and compatible with WordPress translation
     conventions.
   - Ensure the output directory exists.
   - Ensure the target project directory does not already exist.
   - Ensure the plugin slug is present when a companion plugin is requested.
   - Ensure requested paths are explicit before creating symlinks.

3. Generate the local project
   - Run `scripts/create-wp-custom-theme.sh` with the confirmed inputs.
   - The script creates the root project folder.
   - The script creates the theme folder.
   - The script creates the optional plugin folder when requested.
   - The script creates `README.md` and `docs/setup.md`.

4. Copy scaffold files
   - The script copies files from `scaffolds/wordpress-classic-theme/` into the
     theme folder.
   - The script copies files from `scaffolds/wordpress-core-plugin/` into the
     plugin folder when requested.
   - Keep theme and plugin responsibilities separated.

5. Replace placeholders
   - The script replaces `{{PROJECT_NAME}}`, `{{PROJECT_SLUG}}`,
     `{{THEME_NAME}}`, `{{THEME_SLUG}}`, `{{TEXT_DOMAIN}}`, `{{PHP_PREFIX}}`,
     and `{{AUTHOR_NAME}}` in theme scaffold files.
   - The script replaces `{{PROJECT_NAME}}`, `{{PROJECT_SLUG}}`,
     `{{PLUGIN_NAME}}`, `{{PLUGIN_SLUG}}`, `{{TEXT_DOMAIN}}`, `{{PHP_PREFIX}}`,
     and `{{AUTHOR_NAME}}` in plugin scaffold files when a companion plugin is
     requested.
   - The script renames `.tpl` files by removing the `.tpl` suffix.
   - Review generated names for consistency.

6. Create optional Local WP symlinks in a future step
   - Verify the Local WP project path.
   - Link the generated theme into the Local WP `wp-content/themes` directory.
   - Link the generated plugin into the Local WP `wp-content/plugins` directory
     when a companion plugin exists.
   - Do not overwrite existing folders or links without explicit confirmation.

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
