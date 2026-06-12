# Static to WordPress Dry Run

This is a manual validation scenario for the static-to-WordPress integration
workflow. It is meant to test the planning process, documentation, prompt, and
checklist before building conversion automation or writing production PHP.

## Recommended Test Scenario

- Static project name: `Dry Run Static Demo`
- Static project slug: `dry-run-static-demo`
- WordPress project name: `Dry Run WP Demo`
- WordPress project slug: `dry-run-wp-demo`
- Theme slug: `dry-run-theme`
- Plugin slug: `dry-run-core`
- Pages: `index,about,services,works,contact`

## Full Dry-Run Sequence

1. Generate the static mockup with `staticbootstrap`.
2. Optionally connect it to Netlify for review with `netlifybootstrap`.
3. Create a Local WP site for `Dry Run WP Demo`.
4. Generate the WordPress project with `wpbootstrap`.
5. Activate the theme and plugin in WordPress.
6. Open the mapping prompt:

   ```text
   prompts/create-static-to-wordpress-mapping.md
   ```

7. Ask Codex for a mapping only.
8. Run the mapping review checklist manually:

   ```text
   checklists/static-to-wordpress-mapping-review.md
   ```

9. Review the proposed page-to-template mapping.
10. Review proposed template parts.
11. Review dynamic content assumptions.
12. Open the integration prompt only after the mapping is validated:

   ```text
   prompts/integrate-static-mockup-into-wordpress.md
   ```

13. Ask Codex for an integration plan only.
14. Run the post-integration review checklist manually when implementation is
    eventually tested:

    ```text
    checklists/static-to-wordpress-review.md
    ```

## Do Not Implement Yet

- The dry run should stop after the integration plan.
- The mapping prompt should not modify or create files.
- No PHP conversion is required in this test.
- No production code is required.
- Do not modify generated WordPress theme or plugin files during this dry run.

## Validation Criteria

- Static project generated successfully.
- WordPress project generated successfully.
- Symlinks work.
- Theme and plugin activate.
- Codex produces a coherent integration plan.
- Checklist is understandable and usable.
- Documentation gaps are identified.

## Feedback Notes

- 
- 
- 

## Related Files

- [Static to WordPress Integration Workflow](static-to-wordpress-integration.md)
- [Static Mockup Workflow](static-mockup.md)
- [WordPress Custom Project Workflow](wordpress-custom-project.md)
- [Mapping Prompt](../../prompts/create-static-to-wordpress-mapping.md)
- [Mapping Review Checklist](../../checklists/static-to-wordpress-mapping-review.md)
- [Integration Prompt](../../prompts/integrate-static-mockup-into-wordpress.md)
- [Review Checklist](../../checklists/static-to-wordpress-review.md)

## Workflow Navigation

- [Workflows Home](index.md)
- [Static to WordPress Integration](static-to-wordpress-integration.md)
- [Static Mockup](static-mockup.md)
- [WordPress Custom Project](wordpress-custom-project.md)

## Documentation Navigation

- [Documentation Home](../index.md)
- [Quick Start](../quick-start.md)
- [Command Reference](../command-reference.md)
- [Troubleshooting](../troubleshooting.md)
