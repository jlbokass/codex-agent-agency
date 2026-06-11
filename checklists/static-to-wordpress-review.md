# Static to WordPress Review Checklist

Use this checklist after integrating a validated static mockup into a WordPress
custom theme.

## A. Static Mockup Review

- [ ] All selected static pages were reviewed.
- [ ] Shared layout elements were identified.
- [ ] Page-specific sections were identified.
- [ ] Responsive behavior was checked before integration.

## B. WordPress Template Mapping

- [ ] Static pages mapped to WordPress templates.
- [ ] `front-page.php` used only when appropriate.
- [ ] `page.php` remains generic when possible.
- [ ] Reusable sections moved to `template-parts/`.
- [ ] No large static page pasted blindly into one PHP file.

## C. Theme Structure

- [ ] Header extracted cleanly.
- [ ] Footer extracted cleanly.
- [ ] Navigation handled with WordPress functions when applicable.
- [ ] Template parts are named clearly.
- [ ] Presentation logic stays in the theme.

## D. Plugin and Content Model

- [ ] CPT needs identified.
- [ ] Taxonomy needs identified.
- [ ] Metadata/custom field needs identified.
- [ ] Business logic is not added to the theme.
- [ ] Plugin responsibilities are documented.

## E. Assets

- [ ] SCSS/CSS migrated correctly.
- [ ] JavaScript migrated correctly.
- [ ] Images and media strategy documented.
- [ ] Assets are enqueued with WordPress functions.
- [ ] No hardcoded static asset paths remain where WordPress helpers are needed.

## F. WordPress Safety

- [ ] Escaping functions used.
- [ ] Translation functions used where relevant.
- [ ] URLs escaped.
- [ ] Attributes escaped.
- [ ] User/content output escaped.
- [ ] No raw untrusted content output.

## G. Responsive and UI

- [ ] Desktop layout preserved.
- [ ] Mobile layout preserved.
- [ ] Navigation works on mobile.
- [ ] No horizontal overflow.
- [ ] Spacing remains consistent.
- [ ] Validated visual design is preserved.

## H. Final Verification

- [ ] Theme activates without fatal error.
- [ ] Plugin activates without fatal error.
- [ ] Pages render correctly.
- [ ] Browser console checked.
- [ ] PHP errors checked.
- [ ] WordPress debug checked if enabled.
- [ ] Final changed files reviewed.

## Review Outcome

- [ ] Approved.
- [ ] Approved with minor fixes.
- [ ] Requires rework.
