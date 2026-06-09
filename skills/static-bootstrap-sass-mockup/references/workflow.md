# Future Workflow

This reference describes the intended execution flow for the static Bootstrap
and Sass mockup skill. A first reusable scaffold now exists at
`scaffolds/static-bootstrap-sass/`. Local project generation is now handled by
`scripts/create-static-mockup.sh`. Interactive generation is handled by
`scripts/bootstrap-static-mockup.sh`. Optional Git and GitHub automation is
handled through the shared helpers in `scripts/project-git/`.

The default future tooling is npm scripts, Sass CLI, and BrowserSync. Vite,
Webpack, and JavaScript bundling are not default choices and should be
considered later only when a project clearly justifies them.

## Steps

1. Run the interactive bootstrap workflow
   - Use `scripts/bootstrap-static-mockup.sh` for the recommended interactive
     workflow.
   - The script prompts for project name, project slug, author name, page list,
     output directory, whether to run `npm install`, and whether to run
     `npm run dev`.
   - The script delegates project generation to `scripts/create-static-mockup.sh`
     instead of duplicating scaffold copy or placeholder replacement logic.
   - The script delegates optional Git and GitHub automation to
     `scripts/project-git/`.
   - If `npm run dev` is selected, the script explains that the terminal will
     stay occupied by BrowserSync and Sass watch.

2. Collect inputs
   - Confirm the project name.
   - Confirm the project slug.
   - Confirm the author name.
   - Confirm the number of pages.
   - Confirm page names.
   - Confirm design style notes.
   - Ask whether Bootstrap should be included.
   - Ask whether Bootstrap should be customized through Sass.
   - Ask whether a custom Sass structure should be included.
   - Ask whether custom mixins should be included.
   - Ask whether JavaScript interactions should be included.
   - Ask whether jQuery should be included.
   - Ask whether BrowserSync should be included.
   - Ask whether Git should be initialized.
   - Ask whether GitHub repository creation should be handled.
   - Ask for repository name, visibility, and description when GitHub creation
     is requested.

3. Validate project slug
   - Ensure the project slug uses lowercase letters, numbers, and hyphens.
   - Ensure the target project directory does not already exist.
   - Ensure the output location exists before writing files.

4. Create project folder
   - Run `scripts/create-static-mockup.sh` with the confirmed inputs.
   - The script creates the root project folder.
   - The script creates folders for source files, static pages, assets, and
     documentation.
   - The generated `public/` directory is self-contained and ready to use as a
     future Netlify publish directory.
   - Keep the structure framework-agnostic so it can be integrated later.

5. Copy static scaffold files
   - The script copies files from `scaffolds/static-bootstrap-sass/` into the
     project folder.
   - Include Bootstrap-related files only when requested.
   - Customize Bootstrap through Sass when requested.
   - Include Sass architecture only when requested.
   - Include small project-oriented mixins only when requested.
   - Include JavaScript entry files only when requested.
   - Include jQuery only when requested.
   - Keep runtime assets under `public/assets/` so `public/` can be deployed as
     a static publish directory.

6. Replace placeholders
   - The script replaces `{{PROJECT_NAME}}`, `{{PROJECT_SLUG}}`,
     `{{AUTHOR_NAME}}`, and `{{PAGES}}`.
   - The script renames `.tpl` files by removing the `.tpl` suffix.
   - When custom page lists are provided, the script keeps `index.html`, creates
     requested pages from known templates or a generic page template, and removes
     unused default pages.
   - Review generated names for consistency.

7. Initialize Git when requested
   - Git initialization is optional.
   - If selected, call `scripts/project-git/init-git-project.sh`.
   - Ask for the initial branch name, defaulting to `main`.
   - Ask for the initial commit message, defaulting to `Initial commit`.
   - Do not duplicate Git initialization logic in the static orchestrator.

8. Create GitHub repository when requested
   - GitHub repository creation is optional.
   - If selected, call `scripts/project-git/create-github-repo.sh`.
   - Ask for repository name, defaulting to the project slug.
   - Ask for repository visibility, defaulting to `private`.
   - Ask for an optional repository description.
   - Require GitHub CLI to be installed and authenticated; the shared helper
     performs the validation.
   - If Git was not initialized by the orchestrator, skip GitHub creation safely
     with a clear message.
   - Do not store credentials or tokens.

9. Install dependencies when requested
   - The interactive orchestrator can run `npm install` after generation.
   - Manual users can enter the generated project directory and run
     `npm install`.
   - Dependency installation remains optional.

10. Run local dev server when requested
   - The interactive orchestrator can run `npm run dev` only after dependencies
     are installed by the script.
   - The default dev server uses BrowserSync, not Vite or Webpack.
   - `npm run dev` should run Sass watch, start a local static server, and
     reload on HTML, CSS, and JavaScript changes.
   - `npm run serve` should start the local static server.
   - `npm run watch:scss` should run Sass watch.
   - `npm run build` should compile production CSS.
   - `netlify.toml` prepares the future Netlify settings with build command
     `npm run build` and publish directory `public`.
   - Do not run Netlify deployment automation in this step.

11. Display final next steps
    - Show the generated project path.
    - Show included pages.
    - Show whether Bootstrap, Sass, and JavaScript were included.
    - Show whether jQuery, BrowserSync, and custom mixins were included.
    - Show whether Git was initialized.
    - Show whether a GitHub repository was created.
    - Show repository name, visibility, and URL when available.
    - Show whether `npm install` was run.
    - Show whether `npm run dev` was started.
    - Show remaining manual setup steps.
    - List visual QA checks before backend or CMS integration.

## Mixins

- Mixins are allowed.
- Mixins should stay small and project-oriented.
- Do not recreate Bootstrap mixins.
- Keep mixins readable and documented.
