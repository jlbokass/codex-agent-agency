# Future Workflow

This reference describes the intended workflow for converting a validated static
mockup into a WordPress custom theme. The workflow should preserve the approved
visual design while introducing WordPress templates, template parts, enqueue
logic, and optional companion plugin content models deliberately.

## Steps

1. Inspect the static mockup
   - Confirm the static project path.
   - Review generated pages under `public/`.
   - Review SCSS source, compiled CSS, JavaScript, images, and fonts.
   - Confirm the static mockup has already been visually validated.

2. Inspect the WordPress custom project
   - Confirm the WordPress project path.
   - Confirm the target theme slug.
   - Confirm whether a companion plugin exists.
   - Confirm Local WP symlink state when relevant.

3. Identify shared layout elements
   - Locate the repeated header, navigation, footer, skip links, and structural
     wrappers.
   - Identify repeated section patterns across pages.
   - Separate global layout from page-specific content.

4. Extract header, footer, and navigation
   - Plan `header.php` and `footer.php` responsibilities.
   - Plan WordPress navigation registration and menu output.
   - Preserve validated responsive and mobile navigation behavior.
   - Keep accessibility landmarks and skip links intact.

5. Map static pages to WordPress templates
   - Map the homepage to `front-page.php` when appropriate.
   - Map blog archives, pages, singles, and custom archives deliberately.
   - Identify whether custom page templates are needed.
   - Document each static page and its WordPress destination.

6. Extract reusable sections
   - Propose a `template-parts/` structure for repeated sections.
   - Group sections by responsibility, not only by visual order.
   - Avoid creating template parts for one-off markup unless it improves
     clarity.

7. Identify dynamic content
   - Mark static copy, cards, lists, galleries, calls to action, contact details,
     and repeated content that should become dynamic.
   - Decide which content can use core WordPress pages, posts, menus, widgets,
     or theme settings.
   - Flag content that needs custom fields, CPTs, or taxonomies.

8. Define CPTs, taxonomies, and plugin needs
   - Keep CPTs and taxonomies out of the theme.
   - Document required content models before writing implementation code.
   - Assign business logic, integrations, and reusable models to the companion
     plugin.
   - Keep theme code focused on presentation.

9. Migrate SCSS and JavaScript assets
   - Preserve the validated SCSS architecture where possible.
   - Plan CSS output and WordPress enqueue handles.
   - Plan JavaScript enqueue handles and dependencies.
   - Avoid changing visual behavior unless the integration requires it.

10. Replace static content with WordPress functions
    - Use WordPress template functions for titles, permalinks, menus, images,
      excerpts, and content.
    - Use translation functions for visible strings.
    - Use escaping functions for output.
    - Keep business rules outside templates.

11. Test responsive behavior
    - Compare integrated WordPress pages against the validated static mockup.
    - Check desktop, tablet, and mobile viewports.
    - Confirm no horizontal overflow.
    - Confirm mobile navigation still works.

12. Review accessibility and escaping
    - Confirm landmarks, headings, labels, focus states, and keyboard behavior.
    - Confirm images have appropriate alt behavior.
    - Confirm all dynamic output is escaped.
    - Confirm no CPT, taxonomy, or business logic was added to the theme.
