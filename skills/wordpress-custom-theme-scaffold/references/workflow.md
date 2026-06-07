# Future Workflow

This reference describes the intended execution flow for the WordPress custom
theme scaffold skill. It is a workflow contract only; no scaffold files or shell
scripts are provided in this step.

## Steps

1. Collect inputs
   - Confirm the human project name.
   - Confirm the theme slug, PHP prefix, and text domain.
   - Ask whether to create a companion plugin.
   - If a companion plugin is requested, confirm the plugin slug.
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
   - Ensure the plugin slug is present when a companion plugin is requested.
   - Ensure requested paths are explicit before creating symlinks.

3. Create project folders
   - Create the root project folder.
   - Create the theme folder.
   - Create the optional plugin folder when requested.
   - Create a documentation folder for project notes and setup instructions.

4. Copy scaffold files
   - Copy the future theme scaffold files into the theme folder.
   - Copy the future plugin scaffold files into the plugin folder when requested.
   - Keep theme and plugin responsibilities separated.

5. Replace placeholders
   - Replace project name placeholders.
   - Replace theme slug, PHP prefix, and text domain placeholders.
   - Replace plugin slug and plugin prefix placeholders when a companion plugin
     is requested.
   - Review generated names for consistency.

6. Create optional Local WP symlinks
   - Verify the Local WP project path.
   - Link the generated theme into the Local WP `wp-content/themes` directory.
   - Link the generated plugin into the Local WP `wp-content/plugins` directory
     when a companion plugin exists.
   - Do not overwrite existing folders or links without explicit confirmation.

7. Initialize Git
   - Initialize a Git repository when requested.
   - Add an initial `.gitignore` suitable for the generated project.
   - Stage the generated scaffold files.
   - Commit only when explicitly requested by the user.

8. Create optional GitHub repository
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
