# Integrate Static Mockup Into WordPress

Use this prompt when a validated static HTML, SCSS, and JavaScript mockup needs
to be integrated into an existing WordPress custom theme project.

## Task

Integrate the validated static mockup into the WordPress custom theme while
preserving the approved visual design, responsive behavior, and interaction
patterns.

Before coding, collect or confirm:

- Static mockup project path.
- WordPress custom project path.
- Target theme slug.
- Optional plugin slug.
- Pages to integrate.
- Expected dynamic sections.
- CPT or taxonomy needs, if known.

## Inspect First

Analyze the existing projects before proposing implementation:

- Static HTML pages.
- Static SCSS structure.
- Static JavaScript.
- WordPress theme structure.
- WordPress plugin structure, if present.

Do not assume the static markup can be copied directly into WordPress without
first identifying layout, template, asset, and content-model boundaries.

## Stop Before Coding

First present an integration plan and wait for confirmation before modifying
files, unless the user explicitly says to implement immediately.

The plan must include:

- Page-to-template mapping.
- Proposed template-parts structure.
- Asset migration strategy.
- Dynamic content strategy.
- Plugin, CPT, and taxonomy needs.
- Risks and assumptions.

## Rules

- Presentation belongs in the theme.
- Business logic belongs in the plugin.
- CPTs and taxonomies must not be added to the theme.
- WordPress escaping functions must be used for dynamic output.
- Assets must be enqueued properly.
- Do not blindly paste static HTML into one template.
- Preserve responsive behavior.
- Preserve the validated visual design.
- Keep templates maintainable and avoid unnecessary abstractions.

## Expected Deliverables

When implementation is approved, deliver:

- Mapping summary.
- List of changed files.
- Implementation summary.
- Test checklist.
- Follow-up TODOs.

## Test Checklist

Verify at minimum:

- Static pages map clearly to WordPress templates.
- Shared header, footer, navigation, and repeated sections are extracted cleanly.
- Assets are enqueued through WordPress.
- Dynamic output is escaped.
- Responsive behavior matches the validated mockup.
- Mobile navigation works.
- No business logic, CPTs, or taxonomies were added to the theme.
