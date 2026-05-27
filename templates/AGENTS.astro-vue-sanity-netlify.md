# Project Instructions

This project follows the global engineering instructions defined in:

- ~/.codex/AGENTS.md

---

# Project Context

This repository is an Astro + Vue + Sanity + Netlify project.

It is intended for a modern, premium, content-driven website with:

- fast static-first pages
- interactive Vue islands when needed
- Sanity as the client-editable CMS
- optimized project galleries
- responsive image delivery
- multi-step quote request form
- contact form
- Netlify deployment
- Netlify Functions for server-side form handling
- GitHub Actions for quality validation

The assistant must not assume business rules that are not present in the project or explicitly provided by the user.

---

# Specialized Agents

Additional specialized instructions:

- ~/.codex/agents/AGENTS.astro.md
- ~/.codex/agents/AGENTS.vue.md
- ~/.codex/agents/AGENTS.sanity.md
- ~/.codex/agents/AGENTS.netlify.md
- ~/.codex/agents/AGENTS.cicd.md
- ~/.codex/agents/AGENTS.ui-premium.md
- ~/.codex/agents/AGENTS.review.md

---

# Active Workflows

Use these workflows when relevant:

- ~/.codex/workflows/project-onboarding-workflow.md
- ~/.codex/workflows/feature-workflow.md
- ~/.codex/workflows/ui-redesign-workflow.md
- ~/.codex/workflows/review-workflow.md
- ~/.codex/workflows/bugfix-workflow.md
- ~/.codex/workflows/refactor-workflow.md

---

# Active Checklists

Use these checklists before considering work complete:

- ~/.codex/checklists/definition-of-done.md
- ~/.codex/checklists/ui-ux-quality-gate.md
- ~/.codex/checklists/security-quality-gate.md
- ~/.codex/checklists/release-readiness.md

---

# Active Design System

Use these design-system files when working on UI, UX, layouts, components, landing pages, forms, galleries, or redesign tasks:

- ~/.codex/design-system/john-design-language.md
- ~/.codex/design-system/layout-patterns.md
- ~/.codex/design-system/ui-anti-patterns.md
- ~/.codex/design-system/typography-rules.md
- ~/.codex/design-system/spacing-rules.md
- ~/.codex/design-system/motion-rules.md

---

# Expected Technical Stack

Expected stack, to be confirmed by inspecting the repository:

- Astro
- Vue 3 for interactive islands
- TypeScript
- Sanity CMS
- Sanity Image CDN
- Netlify
- Netlify Functions
- GitHub Actions
- npm unless another package manager is detected

Do not assume scripts, dependencies, or tools exist. Inspect the project first.

---

# Architecture Rules

Prefer this structure when creating or reorganizing the project:

    src/
    ├── pages/
    ├── layouts/
    ├── components/
    │   ├── sections/
    │   ├── ui/
    │   ├── forms/
    │   ├── media/
    │   └── navigation/
    ├── lib/
    │   ├── sanity/
    │   ├── seo/
    │   └── forms/
    └── styles/

    sanity/
    └── schemaTypes/

    netlify/
    └── functions/

    .github/
    └── workflows/

Rules:

- Use Astro for pages, layouts, routing, SEO, and static content.
- Use Vue only for genuinely interactive components.
- Do not turn the site into an unnecessary SPA.
- Keep client-side JavaScript minimal.
- Keep components focused and readable.
- Keep Sanity queries in `src/lib/sanity/`.
- Keep Netlify Functions in `netlify/functions/`.
- Keep environment variables documented.
- Do not introduce dependencies without explaining why.

---

# Astro Rules

- Prefer static-first rendering.
- Use Astro pages for routing and SEO.
- Use layouts for shared structure.
- Use section components for large page areas.
- Use UI components for reusable primitives.
- Use media components for responsive images and galleries.
- Avoid large monolithic `.astro` files.
- Avoid hydrating static content.

When relevant, check:

- `npm run build`
- `npm run astro check` if available
- lint/typecheck scripts if present

---

# Vue Rules

Use Vue for focused interactive islands such as:

- multi-step quote request form
- interactive gallery
- filters
- calculators
- complex form states

For quote forms:

- keep each step focused
- show progress
- validate each step before moving forward
- allow back navigation
- show a final summary before submission
- prevent duplicate submissions
- show loading, success, and error states
- never rely only on client-side validation

Avoid:

- full-page Vue SPA inside Astro
- moving static marketing content into Vue
- unnecessary global state
- huge single-file components

---

# Sanity Rules

Sanity is the client-editable CMS.

Use it for:

- projects / réalisations
- services
- testimonials
- site settings
- SEO fields
- image galleries
- before/after images when relevant

Recommended schema files:

    sanity/schemaTypes/project.ts
    sanity/schemaTypes/service.ts
    sanity/schemaTypes/testimonial.ts
    sanity/schemaTypes/category.ts
    sanity/schemaTypes/siteSettings.ts
    sanity/schemaTypes/objects/seo.ts
    sanity/schemaTypes/objects/imageWithAlt.ts
    sanity/schemaTypes/index.ts

Rules:

- Keep schemas simple for the client.
- Use clear field labels and descriptions.
- Require useful alt text for meaningful images.
- Use hotspot/crop when composition matters.
- Do not expose private tokens to frontend code.
- Document required Sanity environment variables.
- Use sensible SEO fallbacks.

---

# Image Rules

Images are central to this project.

Prioritize:

- optimized responsive images
- meaningful alt text
- separate cover image and gallery images
- desktop/tablet/mobile composition
- lazy loading when relevant
- explicit dimensions when possible
- modern formats when supported

Avoid:

- serving original oversized images directly
- missing alt strategy
- using one poor crop for every viewport
- layout shift from missing dimensions
- uploading many images without metadata

Use Adobe tools for image selection, cleanup, color correction, and intentional crops when useful, but keep runtime image optimization handled by Astro/Sanity/Netlify when possible.

---

# Netlify Rules

Netlify handles deployment.

Expected behavior:

- Pull Requests create deploy previews.
- `main` deploys production.
- GitHub Actions validates quality.
- Netlify handles deployment.
- Netlify Functions handle server-side form logic.

Use `netlify.toml` to document:

- build command
- publish directory
- functions directory
- redirects
- headers
- environment context when needed

Common Astro static setup:

    build command: npm run build
    publish directory: dist
    functions directory: netlify/functions

Do not commit secrets.

---

# Forms

This project may include:

- multi-step quote request form
- contact form

For simple forms, Netlify Forms may be acceptable.

For multi-step quote requests, prefer:

    Vue form
    → Netlify Function
    → server-side validation
    → email provider
    → confirmation response

Rules:

- validate client-side for UX
- validate server-side for security
- sanitize user input
- prevent duplicate submissions when relevant
- add anti-spam protection when relevant
- keep technical errors out of the UI
- document required environment variables

Likely email providers:

- Resend
- Brevo
- Mailjet
- Postmark

---

# CI/CD Rules

GitHub Actions should validate quality, not duplicate Netlify deployment.

Expected flow:

    Pull Request
    → GitHub Actions quality checks
    → Netlify deploy preview
    → review
    → merge to main
    → Netlify production deploy

Before creating CI:

- inspect `package.json`
- do not invent scripts
- use only available commands
- propose missing scripts before using them

Likely checks:

- `npm ci`
- `npm run build`
- `npm run astro check` if available
- `npm run lint` if available
- `npm run typecheck` if available
- `npm test` if available

---

# UI/UX Rules

Use the active design system.

Avoid:

- generic Bootstrap-like layouts
- repetitive card grids
- centered hero with vague text
- weak typography hierarchy
- identical spacing everywhere
- AI-generated template feeling
- decorative motion without purpose

Prioritize:

- premium visual identity
- editorial composition
- strong first impression
- clear CTA hierarchy
- responsive polish
- accessible forms
- useful motion
- trust-building content
- high-quality image usage

---

# SEO Rules

Important pages should define:

- title
- meta description
- canonical URL when relevant
- Open Graph metadata
- structured headings
- meaningful alt text

For local artisan websites, consider:

- services
- service areas
- project pages
- testimonials
- trust signals
- local business schema when relevant

Do not over-optimize with keyword stuffing.

---

# Security Rules

Check:

- no secrets committed
- no private tokens in frontend bundles
- safe server-side validation
- safe form handling
- safe error handling
- no sensitive data in logs
- environment variables documented
- `.env` ignored
- `.env.example` provided when relevant

---

# Git Rules

- Never commit automatically unless explicitly requested.
- Review `git status` and `git diff` before finalizing.
- Keep changes focused.
- Avoid unrelated refactors.
- Suggest a clear commit message.

---

# Final Response Requirements

When a task is complete, return:

- summary of changes
- files modified
- commands run
- checks passed
- checks not run and why
- environment variables required
- deployment notes
- remaining risks
- suggested commit message
