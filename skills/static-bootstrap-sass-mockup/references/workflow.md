# Future Workflow

This reference describes the intended execution flow for the static Bootstrap
and Sass mockup skill. A first reusable scaffold now exists at
`scaffolds/static-bootstrap-sass/`. Local project generation is now handled by
`scripts/create-static-mockup.sh`. Interactive generation is handled by
`scripts/bootstrap-static-mockup.sh`. Git initialization and GitHub repository
creation remain future steps.

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
   - Ask whether Git initialization should be handled later.
   - Ask whether GitHub repository creation should be handled later.

3. Validate project slug
   - Ensure the project slug uses lowercase letters, numbers, and hyphens.
   - Ensure the target project directory does not already exist.
   - Ensure the output location exists before writing files.

4. Create project folder
   - Run `scripts/create-static-mockup.sh` with the confirmed inputs.
   - The script creates the root project folder.
   - The script creates folders for source files, static pages, assets, and
     documentation.
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

6. Replace placeholders
   - The script replaces `{{PROJECT_NAME}}`, `{{PROJECT_SLUG}}`,
     `{{AUTHOR_NAME}}`, and `{{PAGES}}`.
   - The script renames `.tpl` files by removing the `.tpl` suffix.
   - When custom page lists are provided, the script keeps `index.html`, creates
     requested pages from known templates or a generic page template, and removes
     unused default pages.
   - Review generated names for consistency.

7. Install dependencies when requested
   - The interactive orchestrator can run `npm install` after generation.
   - Manual users can enter the generated project directory and run
     `npm install`.
   - Dependency installation remains optional.

8. Run local dev server when requested
   - The interactive orchestrator can run `npm run dev` only after dependencies
     are installed by the script.
   - The default dev server uses BrowserSync, not Vite or Webpack.
   - `npm run dev` should run Sass watch, start a local static server, and
     reload on HTML, CSS, and JavaScript changes.
   - `npm run serve` should start the local static server.
   - `npm run watch:scss` should run Sass watch.
   - `npm run build` should compile production CSS.

9. Initialize Git later
   - Git initialization is a future optional step.
   - Do not initialize Git in this workflow step.

10. Create GitHub repository later
   - GitHub repository creation is a future optional step.
   - Do not create remotes or push code in this workflow step.

11. Display final next steps
    - Show the generated project path.
    - Show included pages.
    - Show whether Bootstrap, Sass, and JavaScript were included.
    - Show whether jQuery, BrowserSync, and custom mixins were included.
    - Show whether `npm install` was run.
    - Show whether `npm run dev` was started.
    - Show remaining manual setup steps.
    - List visual QA checks before backend or CMS integration.

## Mixins

- Mixins are allowed.
- Mixins should stay small and project-oriented.
- Do not recreate Bootstrap mixins.
- Keep mixins readable and documented.
