# Project Instructions

This project follows the global engineering instructions defined in:

- ~/.codex/AGENTS.md

---

# Project Context

This repository is a Symfony-oriented project with a strong focus on maintainable architecture, clean Twig templates, responsive UI, and premium user experience.

The assistant must not assume business rules that are not present in the project or explicitly provided by the user.

---

# Specialized Agents

Additional specialized instructions:

- ~/.codex/agents/AGENTS.symfony.md
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

Use these design-system files when working on UI, UX, layouts, components, landing pages, forms, or redesign tasks:

- ~/.codex/design-system/john-design-language.md
- ~/.codex/design-system/layout-patterns.md
- ~/.codex/design-system/ui-anti-patterns.md
- ~/.codex/design-system/typography-rules.md
- ~/.codex/design-system/motion-rules.md

# Technical Stack

Expected stack, to be confirmed by inspecting the repository:

- PHP 8.3+
- Symfony 6.4 LTS or Symfony 7+
- Twig
- Doctrine
- Symfony Forms when relevant
- Symfony Validator
- Symfony Security when relevant
- Webpack Encore or Vite depending on the project
- Vanilla JavaScript unless another frontend stack is detected
- PHPUnit when available
- PHPStan when available
- PHP-CS-Fixer when available

---

# Architecture Rules

- Inspect the project before modifying files.
- Keep controllers thin.
- Keep business logic out of Twig.
- Prefer services, factories, ViewModels, or dedicated classes when useful.
- Avoid overengineering.
- Follow existing conventions before introducing new ones.
- Do not introduce new dependencies without explaining why.
- Do not perform broad refactors unless explicitly requested.

---

# UI/UX Rules

- Avoid generic Bootstrap-looking interfaces.
- Avoid repetitive card grids.
- Prioritize strong hierarchy, spacing, responsive behavior, and accessibility.
- Propose a visual direction before major UI changes.
- For redesign tasks, use the UI redesign workflow.
- For final validation, use the UI/UX Quality Gate checklist.

---

# Git Rules

- Never commit automatically unless explicitly requested.
- Review `git status` and `git diff` before finalizing.
- Summarize modified files clearly.
- Suggest a commit message when relevant.

---

# Final Response Requirements

When a task is complete, return:

- summary of changes
- files modified
- commands run
- checks passed
- checks not run and why
- remaining risks
- suggested commit message