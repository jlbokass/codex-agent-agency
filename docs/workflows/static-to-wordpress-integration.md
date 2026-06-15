# Static to WordPress Integration Workflow

Use this workflow to convert a validated static mockup into a maintainable
WordPress custom theme while preserving the approved visual design and keeping
content modeling decisions explicit.

For a plan-only test of this process, use the
[Static to WordPress Dry Run](static-to-wordpress-dry-run.md).

## Pilot Validation Status

This workflow has been validated through a full static-to-WordPress integration
pilot:

1. Homepage integrated into `front-page.php`.
2. About page integrated.
3. Services page integrated.
4. Works page implemented dynamically with a `work` CPT in the plugin.
5. Contact page integrated.

The pilot also validated navigation active states, mobile horizontal overflow
fixes, and the theme/plugin boundary for CPT registration and business logic.

## When To Use This Workflow

- Use it when a client has approved a static mockup.
- Use it before integrating into a custom WordPress theme.
- Use it when separating design, content modeling, and WordPress logic matters.

## Do Not Use This Workflow When

- There is no validated static mockup.
- The project is not WordPress.
- The client still expects major design changes.
- The site is only a pure static website.

## Inputs Required

- Static mockup path.
- WordPress project path.
- Theme slug.
- Optional plugin slug.
- Pages to integrate.
- Dynamic content notes.
- CPT/taxonomy needs.
- Asset strategy.

## Output Expected

- Page-to-template mapping.
- Template-parts structure.
- Migrated assets.
- Dynamic content list.
- CPT/taxonomy/plugin notes.
- Review checklist result.

## Recommended Command Sequence

Generate and validate the static mockup:

```bash
staticbootstrap
```

Run local validation from the generated static project:

```bash
npm run dev
```

Connect or publish the validated static mockup for client review:

```bash
netlifybootstrap
```

Create the WordPress custom project after the static version is approved:

```bash
wpbootstrap
```

## Complete Workflow

1. Generate a static mockup with `staticbootstrap`.
2. Validate the static mockup locally with `npm run dev`.
3. Publish or connect it to Netlify for client review.
4. Collect client feedback.
5. Freeze the validated static version before WordPress integration.
6. Create a WordPress custom project with `wpbootstrap`.
7. Create the theme and optional plugin.
8. Create Local WP symlinks.
9. Activate the theme and plugin in WordPress.
10. Run the mapping prompt first.
11. Validate the mapping with the mapping review checklist.
12. Run the static-to-WordPress integration prompt.
13. Review the integration plan before coding.
14. Convert static pages into WordPress templates in the recommended order.
15. Split reusable sections into `template-parts/`.
16. Migrate SCSS, CSS, and JavaScript assets.
17. Identify dynamic content.
18. Place CPTs, taxonomies, metadata, admin customization, and business logic in
    the plugin.
19. Use the static-to-WordPress review checklist.
20. Validate responsive behavior and WordPress safety.

## Recommended Page Integration Order

The pilot validated this page-by-page order:

1. Homepage.
2. About.
3. Services.
4. Works / CPT.
5. Contact.

Start with the homepage to establish global layout, header, footer, assets, and
template-part structure. Integrate mostly static content pages next, then handle
the dynamic Works section once the theme structure is stable. Finish with Contact
after shared layout and form/content expectations are clear.

## Codex Prompts To Use

First create a mapping without modifying files:

```text
prompts/create-static-to-wordpress-mapping.md
```

Use the mapping review checklist before implementation:

```text
checklists/static-to-wordpress-mapping-review.md
```

After the mapping is approved, use the integration prompt:

```text
prompts/integrate-static-mockup-into-wordpress.md
```

The prompt requires Codex to inspect both projects, present an integration plan,
and wait for confirmation before coding unless implementation is explicitly
requested immediately.

## Review Checklist

Use the shared review checklist after integration:

```text
checklists/static-to-wordpress-review.md
```

The checklist covers static review, template mapping, theme structure,
plugin/content model boundaries, assets, WordPress safety, responsive behavior,
and final verification.

## Theme vs Plugin Boundary

Theme responsibilities:

- Presentation.
- Templates and template parts.
- Frontend assets.
- Frontend rendering.

Plugin responsibilities:

- CPTs.
- Taxonomies.
- Metadata and custom fields.
- Admin customization.
- Business logic.

Never place CPT registration in the theme. Content models and business behavior
belong in the plugin so they survive theme changes.

## Safety Rules

- Preserve the validated design.
- Do not blindly paste full static pages into one PHP file.
- Use WordPress escaping functions.
- Enqueue assets properly.
- Check mobile navigation.
- Avoid horizontal overflow.
- Test with WordPress debug when needed.

## Related Files

- [Static Mockup Workflow](static-mockup.md)
- [WordPress Custom Project Workflow](wordpress-custom-project.md)
- [Static to WordPress Dry Run](static-to-wordpress-dry-run.md)
- [Netlify Workflow](netlify.md)
- [Static to WordPress Skill](../../skills/static-to-wordpress-integration/SKILL.md)
- [Mapping Prompt](../../prompts/create-static-to-wordpress-mapping.md)
- [Mapping Review Checklist](../../checklists/static-to-wordpress-mapping-review.md)
- [Integration Prompt](../../prompts/integrate-static-mockup-into-wordpress.md)
- [Review Checklist](../../checklists/static-to-wordpress-review.md)

## Workflow Navigation

- [Workflows Home](index.md)
- [Static to WordPress Dry Run](static-to-wordpress-dry-run.md)
- [Static Mockup](static-mockup.md)
- [WordPress Custom Project](wordpress-custom-project.md)
- [Git and GitHub Helpers](git-github.md)
- [Netlify Workflow](netlify.md)

## Documentation Navigation

- [Documentation Home](../index.md)
- [Quick Start](../quick-start.md)
- [Command Reference](../command-reference.md)
- [Troubleshooting](../troubleshooting.md)
