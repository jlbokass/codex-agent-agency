# Static to WordPress Mapping Review Checklist

Use this checklist after running
`prompts/create-static-to-wordpress-mapping.md` and before starting
implementation. This checklist validates the mapping plan, not the finished
WordPress integration.

## A. Input Coverage

- [ ] Static project path is identified.
- [ ] WordPress project path is identified.
- [ ] Target theme slug is identified.
- [ ] Plugin slug is identified when relevant.
- [ ] Pages to analyze are listed.
- [ ] Known dynamic content is listed.
- [ ] Known CPT/taxonomy expectations are listed.

## B. Static Pages Inventory

- [ ] All requested pages were reviewed.
- [ ] Each static page has a clear file path.
- [ ] Major sections are identified.
- [ ] Shared layout elements are identified.
- [ ] Page-specific sections are identified.
- [ ] No important page is missing from the mapping.

## C. WordPress Template Mapping

- [ ] Each static page maps to a WordPress template.
- [ ] Homepage mapping is clear.
- [ ] `front-page.php` is used only when appropriate.
- [ ] `page.php` remains generic when possible.
- [ ] Archive, single, or custom templates are proposed only when justified.
- [ ] Mapping reasons are documented.

## D. Template-Parts Proposal

- [ ] Reusable sections are proposed as template parts.
- [ ] Template-part paths are clear.
- [ ] Naming is consistent.
- [ ] Shared layout pieces are not duplicated unnecessarily.
- [ ] Sections are not blindly pasted into one large PHP file.

## E. Asset Strategy

- [ ] SCSS/CSS migration path is clear.
- [ ] JavaScript migration path is clear.
- [ ] Image/media strategy is clear.
- [ ] Enqueue strategy is mentioned.
- [ ] No static asset path risk is ignored.

## F. Dynamic Content Strategy

- [ ] Static content that can remain static is identified.
- [ ] Editable content is identified.
- [ ] Repeated content is identified.
- [ ] CPT candidates are listed.
- [ ] Taxonomy candidates are listed.
- [ ] Metadata/custom field candidates are listed.
- [ ] Unclear content model assumptions are flagged.

## G. Theme vs Plugin Boundary

- [ ] Presentation stays in the theme.
- [ ] Templates stay in the theme.
- [ ] Assets stay in the theme.
- [ ] CPTs stay in the plugin.
- [ ] Taxonomies stay in the plugin.
- [ ] Metadata and business logic stay in the plugin.
- [ ] No CPT registration is planned inside the theme.

## H. Risk Review

- [ ] Responsive risks are identified.
- [ ] Mobile navigation risks are identified.
- [ ] Horizontal overflow risks are identified.
- [ ] Asset path risks are identified.
- [ ] WordPress template risks are identified.
- [ ] Unclear assumptions are listed.

## I. Implementation Readiness

- [ ] Recommended implementation order is clear.
- [ ] Checkpoints are defined.
- [ ] Coding can be split into small steps.
- [ ] User validation is still required before coding.
- [ ] No file modification has been made during the mapping phase.

## Decision

- [ ] Approved for implementation.
- [ ] Approved with minor mapping fixes.
- [ ] Requires mapping rework.
- [ ] Blocked pending business/content decisions.

## Next Action

- If approved, use `prompts/integrate-static-mockup-into-wordpress.md`.
- If not approved, rerun or revise the mapping prompt before implementation.
