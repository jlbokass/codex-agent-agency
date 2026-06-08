# Future Workflow

This reference describes the intended execution flow for the static Bootstrap
and Sass mockup skill. It is a workflow contract only; no scaffold files,
scripts, package files, Vite configuration, or generated frontend assets are
provided in this step.

## Steps

1. Collect inputs
   - Confirm the project name.
   - Confirm the project slug.
   - Confirm the author name.
   - Confirm the number of pages.
   - Confirm page names.
   - Confirm design style notes.
   - Ask whether Bootstrap should be included.
   - Ask whether a custom Sass structure should be included.
   - Ask whether JavaScript interactions should be included.
   - Ask whether Git initialization should be handled later.
   - Ask whether GitHub repository creation should be handled later.

2. Validate project slug
   - Ensure the project slug uses lowercase letters, numbers, and hyphens.
   - Ensure the target project directory does not already exist.
   - Ensure the output location exists before writing files.

3. Create project folder
   - Create the root project folder.
   - Create folders for source files, static pages, assets, and documentation.
   - Keep the structure framework-agnostic so it can be integrated later.

4. Copy static scaffold files
   - Copy future static scaffold files into the project folder.
   - Include Bootstrap-related files only when requested.
   - Include Sass architecture only when requested.
   - Include JavaScript entry files only when requested.

5. Replace placeholders
   - Replace project name, project slug, author name, page names, and other
     metadata placeholders.
   - Review generated names for consistency.

6. Install dependencies later
   - Dependency installation is a future step.
   - Do not add or run npm installation in the contract-only phase.

7. Run local dev server later
   - Local dev server support is a future step.
   - Do not add Vite configuration or dev server scripts in the contract-only
     phase.

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
    - Show remaining manual setup steps.
    - List visual QA checks before backend or CMS integration.
