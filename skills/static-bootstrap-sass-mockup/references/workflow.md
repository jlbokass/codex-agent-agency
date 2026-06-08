# Future Workflow

This reference describes the intended execution flow for the static Bootstrap
and Sass mockup skill. A first reusable scaffold now exists at
`scaffolds/static-bootstrap-sass/`. Local project generation is now handled by
`scripts/create-static-mockup.sh`. Dependency installation, Git initialization,
and GitHub repository creation remain future steps.

The default future tooling is npm scripts, Sass CLI, and BrowserSync. Vite,
Webpack, and JavaScript bundling are not default choices and should be
considered later only when a project clearly justifies them.

## Steps

1. Collect inputs
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

2. Validate project slug
   - Ensure the project slug uses lowercase letters, numbers, and hyphens.
   - Ensure the target project directory does not already exist.
   - Ensure the output location exists before writing files.

3. Create project folder
   - Run `scripts/create-static-mockup.sh` with the confirmed inputs.
   - The script creates the root project folder.
   - The script creates folders for source files, static pages, assets, and
     documentation.
   - Keep the structure framework-agnostic so it can be integrated later.

4. Copy static scaffold files
   - The script copies files from `scaffolds/static-bootstrap-sass/` into the
     project folder.
   - Include Bootstrap-related files only when requested.
   - Customize Bootstrap through Sass when requested.
   - Include Sass architecture only when requested.
   - Include small project-oriented mixins only when requested.
   - Include JavaScript entry files only when requested.
   - Include jQuery only when requested.

5. Replace placeholders
   - The script replaces `{{PROJECT_NAME}}`, `{{PROJECT_SLUG}}`,
     `{{AUTHOR_NAME}}`, and `{{PAGES}}`.
   - The script renames `.tpl` files by removing the `.tpl` suffix.
   - When custom page lists are provided, the script keeps `index.html`, creates
     requested pages from known templates or a generic page template, and removes
     unused default pages.
   - Review generated names for consistency.

6. Install dependencies later
   - Dependency installation is a future step.
   - The future scaffold should use lightweight npm dependencies for Sass CLI
     and BrowserSync.
   - Do not add or run npm installation in the contract-only phase.

7. Run local dev server later
   - Local dev server support is a future step.
   - The default future dev server should use BrowserSync, not Vite or Webpack.
   - `npm run dev` should run Sass watch, start a local static server, and
     reload on HTML, CSS, and JavaScript changes.
   - `npm run serve` should start the local static server.
   - `npm run watch:scss` should run Sass watch.
   - `npm run build` should compile production CSS.
   - Do not add BrowserSync configuration or dev server scripts in the
     contract-only phase.

8. Initialize Git later
   - Git initialization is a future optional step.
   - Do not initialize Git in the contract-only phase.

9. Create GitHub repository later
   - GitHub repository creation is a future optional step.
   - Do not create remotes or push code in the contract-only phase.

10. Display final next steps
    - Show the generated project path.
    - Show included pages.
    - Show whether Bootstrap, Sass, and JavaScript were included.
    - Show whether jQuery, BrowserSync, and custom mixins were included.
    - Show remaining manual setup steps.
    - List visual QA checks before backend or CMS integration.

## Mixins

- Mixins are allowed.
- Mixins should stay small and project-oriented.
- Do not recreate Bootstrap mixins.
- Keep mixins readable and documented.
