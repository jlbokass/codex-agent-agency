# Project Instructions

This project is a custom WordPress website for a small business, artisan, association, or content-driven local service.

It follows the global engineering instructions defined in:

- `~/.codex/AGENTS.md`

---

## Project Context

This repository is a WordPress-oriented project with a strong focus on:

- custom frontend design
- client-editable content
- maintainable theme architecture
- a small custom business plugin when needed
- secure forms and media handling
- responsive UI and local SEO

The assistant must not assume business rules that are not present in the project or explicitly provided by the user.

---

## Specialized Agents

Additional specialized instructions:

- `~/.codex/agents/AGENTS.wordpress.md`
- `~/.codex/agents/AGENTS.ui-premium.md`
- `~/.codex/agents/AGENTS.review.md`
- `~/.codex/agents/AGENTS.cicd.md`

---

## Active Workflows

Use these workflows when relevant:

- `~/.codex/workflows/project-onboarding-workflow.md`
- `~/.codex/workflows/feature-workflow.md`
- `~/.codex/workflows/ui-redesign-workflow.md`
- `~/.codex/workflows/review-workflow.md`
- `~/.codex/workflows/bugfix-workflow.md`
- `~/.codex/workflows/refactor-workflow.md`

---

## Active Checklists

Use these checklists before considering work complete:

- `~/.codex/checklists/definition-of-done.md`
- `~/.codex/checklists/ui-ux-quality-gate.md`
- `~/.codex/checklists/security-quality-gate.md`
- `~/.codex/checklists/release-readiness.md`

---

## Active Design System

Use these design-system files when working on UI, UX, layouts, components, landing pages, forms, or redesign tasks:

- `~/.codex/design-system/john-design-language.md`
- `~/.codex/design-system/layout-patterns.md`
- `~/.codex/design-system/ui-anti-patterns.md`
- `~/.codex/design-system/typography-rules.md`
- `~/.codex/design-system/motion-rules.md`

---

## Expected Stack

Expected stack, to be confirmed by inspecting the repository:

- WordPress latest stable or host-supported stable version
- PHP 8.2+ when possible
- MySQL or MariaDB
- custom WordPress theme
- custom WordPress plugin for business content when relevant
- native WordPress Media Library
- classic WordPress admin unless the project explicitly uses a different editing strategy
- Vanilla JavaScript unless another frontend stack is detected
- CSS, SCSS, or a lightweight build pipeline depending on the project
- Composer only when the project already uses it or when there is a clear operational benefit

---

## Default Architecture

Prefer this separation:

- Theme: frontend rendering, layout, templates, assets, menus, image sizes, template parts.
- Custom plugin: Custom Post Types, taxonomies, metadata, admin customization, business logic, form handling when appropriate.
- WordPress core and native APIs: authentication, media, users, roles, routing, hooks, image sizes, admin UI.

Do not put business-critical Custom Post Types only in the theme.

Recommended content types for an artisan website:

- `project` for completed work, case studies, references, before/after content, and galleries.
- `service` for editable service pages and offers.

Common fields to consider:

- title
- slug
- excerpt or short description
- full description
- featured image
- gallery
- category or service type when useful
- location when useful
- featured flag when useful
- menu order or display order when useful

---

## Architecture Rules

- Inspect the project before modifying files.
- Follow existing conventions before introducing new ones.
- Keep theme templates readable.
- Keep business logic out of template files.
- Keep `functions.php` small.
- Do not add plugins without explaining why.
- Avoid page builders by default.
- Avoid broad refactors unless explicitly requested.
- Prefer progressive enhancement for interactivity.
- Keep client editing workflows simple.

---

## Security Rules

- Sanitize input.
- Validate data before saving.
- Escape output.
- Use nonces for state-changing actions.
- Check capabilities before admin actions.
- Use prepared queries for custom SQL.
- Avoid storing secrets in theme or plugin files.
- Do not expose debug details in production.
- Review upload handling carefully.

---

## UI/UX Rules

- Avoid generic template-looking WordPress designs.
- Avoid repetitive card grids unless they are visually refined.
- Prioritize hierarchy, spacing, typography, responsive behavior, and accessibility.
- Make image-heavy sections performant and well-composed on mobile.
- Design admin-editable content with realistic client photos and imperfect text lengths in mind.
- For redesign tasks, use the UI redesign workflow.
- For final validation, use the UI/UX Quality Gate checklist.

---

## Client Editing Rules

The client should be able to:

- edit services
- edit projects
- add images from a computer
- add images from a phone
- understand admin labels without developer explanation
- avoid touching fragile layout code

When implementing content editing, prioritize clarity over excessive flexibility.

---

## Git Rules

- Never commit automatically unless explicitly requested.
- Review `git status` and `git diff` before finalizing when local shell access is available.
- Summarize modified files clearly.
- Suggest a commit message when relevant.

---

## Final Response Requirements

When a task is complete, return:

- summary of changes
- files modified
- commands run
- checks passed
- checks not run and why
- remaining risks
- suggested commit message
