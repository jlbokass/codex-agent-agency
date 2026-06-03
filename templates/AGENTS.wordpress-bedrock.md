# Project Instructions

This project is a WordPress Bedrock project.

Use this template only when Bedrock is intentionally selected as the project architecture. Bedrock is an option, not the default WordPress setup.

It follows the global engineering instructions defined in:

- `~/.codex/AGENTS.md`

---

## Project Context

This repository uses the Roots Bedrock approach for a more application-like WordPress structure:

- Composer-managed WordPress dependencies
- environment-based configuration
- separated web root
- cleaner project structure
- safer deployment workflow
- Git-friendly dependency management

The assistant must not convert a classic WordPress project to Bedrock unless explicitly requested.

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

## Expected Stack

Expected stack, to be confirmed by inspecting the repository:

- WordPress via Bedrock
- PHP version required by the active Bedrock release
- Composer
- `.env`-based configuration
- public document root pointing to `web/`
- `web/wp` for WordPress core
- `web/app` for application content
- `web/app/themes` for themes
- `web/app/plugins` for plugins when project-local plugins are used
- `web/app/mu-plugins` for must-use plugins when appropriate
- custom theme or Sage only when explicitly chosen
- custom plugin for business content when relevant

---

## Bedrock Rules

- Do not commit `.env` files.
- Keep environment-specific values out of PHP files.
- Use `.env.example` for required variable documentation.
- Do not modify WordPress core files.
- Treat Composer as the source of truth for dependencies.
- Respect Bedrock's directory structure.
- Ensure the server document root targets `web/`.
- Do not assume standard WordPress paths such as `wp-content/themes` without checking the project structure.
- Do not introduce Sage, Trellis, Acorn, or Radicle unless explicitly requested or already present.

---

## Architecture Boundaries

Prefer this separation:

- Bedrock: project structure, dependency management, environment configuration.
- Theme: frontend rendering, templates, assets, layout, image presentation.
- Custom plugin: business content, Custom Post Types, taxonomies, metadata, admin customization, and business logic.
- WordPress core: authentication, media, users, roles, routing, hooks, image sizes, admin UI.

Do not put business-critical Custom Post Types only in the theme.

---

## Composer and Dependencies

- Inspect `composer.json` before adding dependencies.
- Prefer established WordPress packages when a dependency is justified.
- Do not add plugins or libraries without explaining the operational benefit.
- Keep dependency changes minimal.
- Update lock files only when intended.
- Note whether a dependency is runtime, development, or deployment-related.

---

## Environment and Deployment

Before making deployment-sensitive changes, verify:

- required PHP version
- document root
- database variables
- salts and keys strategy
- environment names
- plugin/theme dependency installation
- writable uploads directory
- cache strategy if present
- backup and rollback expectations

Never expose secrets in documentation, commits, examples, or final responses.

---

## Content Modeling

For artisan and small business sites, consider:

- `project` Custom Post Type for completed work, case studies, references, before/after content, and galleries.
- `service` Custom Post Type for editable service pages and offers.
- Featured images for cards and hero sections.
- Galleries when the client needs multiple images per project or service.
- Short descriptions for listings.
- Full descriptions for detail pages.
- Simple taxonomies only when they help the client organize content.

Keep the admin simple and non-technical.

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

- Avoid generic WordPress template appearance.
- Prioritize strong visual hierarchy, spacing, responsive behavior, and accessibility.
- Use client-editable content safely without breaking layout.
- Optimize images for mobile and performance.
- For redesign tasks, use the UI redesign workflow.
- For final validation, use the UI/UX Quality Gate checklist.

---

## When Bedrock Is a Good Fit

Bedrock is appropriate when the project benefits from:

- Composer-managed WordPress core and plugins
- explicit environments
- cleaner Git history
- a separated public web root
- professional deployment workflows
- multiple environments such as local, staging, and production
- more disciplined maintenance

Bedrock may be unnecessary when the project is a very small WordPress site with simple hosting, few dependencies, and no need for environment-driven deployment.

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
