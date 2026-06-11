# Create Static to WordPress Mapping

Use this prompt to analyze a validated static mockup and an existing WordPress
custom project, then produce a static-to-WordPress integration mapping. This is
a planning task only.

## Task

Create a mapping document for integrating a validated static HTML, SCSS, and
JavaScript mockup into a WordPress custom theme.

Collect or confirm:

- Static mockup project path.
- WordPress custom project path.
- Target theme slug.
- Optional plugin slug.
- Pages to analyze.
- Known dynamic content.
- Known CPT/taxonomy expectations.
- Assets strategy, if already decided.

## Inspect

Inspect the existing files before producing the mapping:

- Static HTML pages.
- Static SCSS structure.
- Static JavaScript.
- Static assets.
- WordPress theme structure.
- WordPress plugin structure, if present.

## Hard Boundaries

- Do not modify files.
- Do not create files.
- Do not move assets.
- Do not convert HTML to PHP yet.
- Do not register CPTs yet.
- Do not enqueue assets yet.
- Only produce an analysis and mapping document in the response.

## Expected Output

### A. Static Pages Inventory

For each selected page, include:

- Page name.
- File path.
- Main sections.
- Reusable layout elements.
- Page-specific sections.

### B. WordPress Template Mapping

For each static page, include:

- Static page.
- Suggested WordPress template.
- Reason for the mapping.
- Notes about `front-page.php`, `page.php`, archive templates, or custom page
  templates.

### C. Template-Parts Proposal

For each proposed template part, include:

- Proposed template-part path.
- Source static section.
- Reuse level.
- Notes.

### D. Asset Migration Map

Include:

- SCSS source.
- CSS destination.
- JS source.
- JS destination.
- Images/media notes.
- Enqueue strategy notes.

### E. Dynamic Content Analysis

Include:

- Static content that should remain static.
- Static content that should become editable.
- Repeated content that may need CPTs.
- Taxonomy candidates.
- Metadata/custom field candidates.

### F. Theme vs Plugin Responsibilities

Include:

- What belongs in the theme.
- What belongs in the plugin.
- Explicit warning if CPTs or taxonomies are identified.

### G. Risks and Assumptions

Include:

- Unclear content models.
- Design sections that need confirmation.
- Responsive risks.
- Asset path risks.
- WordPress template risks.

### H. Recommended Implementation Order

Include:

- Safe sequence of integration steps.
- Checkpoints before coding.

Stop after producing the mapping. Do not implement until the user validates the
plan.
