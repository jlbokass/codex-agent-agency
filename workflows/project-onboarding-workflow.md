# Project Onboarding Workflow

Use this workflow when opening a new or existing client project for the first time.

## Goal

Understand the project before making changes.

Do not implement features, refactor, or fix bugs during onboarding unless explicitly requested.

---

## Step 1 — Inspect Project Structure

Inspect:

- root files
- package managers
- framework indicators
- source directories
- templates/views
- assets
- tests
- configuration
- documentation
- CI/CD files
- deployment files

Identify the actual stack instead of assuming it.

---

## Step 2 — Identify Project Type

Classify the project as one or several of:

- Symfony
- Laravel
- WordPress
- WooCommerce
- static HTML/CSS/JS
- frontend application
- API
- unknown / mixed

If the project type is unclear, explain why.

---

## Step 3 — Identify Tooling

Look for:

- Composer
- npm/yarn/pnpm
- Docker/DDEV/Sail
- PHPUnit/Pest
- PHPStan/Psalm
- PHP-CS-Fixer/Pint
- ESLint
- Stylelint
- Prettier
- Vite/Webpack
- GitHub Actions or other CI

List available commands if scripts are defined.

---

## Step 4 — Architecture Assessment

Summarize:

- main architecture
- important directories
- business domains if visible
- naming conventions
- separation of concerns
- possible technical debt
- risky areas

Do not overstate issues without evidence.

---

## Step 5 — UI/UX Assessment

If the project has a UI, inspect:

- layout structure
- visual consistency
- responsive strategy
- accessibility basics
- design system presence
- repeated patterns
- possible generic/template feeling

---

## Step 6 — Risk Assessment

Identify:

- missing tests
- unclear deployment process
- fragile architecture
- outdated dependencies
- security-sensitive areas
- unclear business rules
- risky files to avoid changing casually

---

## Step 7 — Recommended Next Actions

Return:

- project summary
- detected stack
- key directories
- available commands
- active risks
- recommended specialized agents
- recommended workflows
- suggested first safe task