# Feature Workflow

Use this workflow when implementing a new feature or significantly changing an existing one.

## Goal

Deliver maintainable, tested, user-centered features without rushing into code.

---

## Step 1 — Understand

Before coding:

- read the project `AGENTS.md`
- inspect the existing structure
- identify the stack
- identify existing conventions
- identify impacted files
- clarify assumptions if needed

Do not implement yet.

---

## Step 2 — Plan

Provide a concise plan with:

- feature goal
- technical approach
- UX/UI impact
- files likely to change
- risks
- tests/checks to run

For large changes, wait for validation before implementation.

---

## Step 3 — Design

If the feature impacts UI:

- define user flow
- define CTA hierarchy
- define responsive behavior
- avoid generic layouts
- preserve premium visual quality
- check accessibility basics

---

## Step 4 — Implement

During implementation:

- keep changes incremental
- respect existing architecture
- keep controllers thin
- avoid business logic in templates
- avoid unnecessary abstractions
- reuse existing components/services where possible

---

## Step 5 — Validate

After implementation:

- run available tests
- run linters/static analysis when available
- check routes
- check translations
- check responsive behavior if UI changed
- check accessibility basics

If a check cannot be run, explain why.

---

## Step 6 — Review

Review your own work before final answer:

- architecture consistency
- duplicated logic
- naming
- security
- performance
- UX clarity
- responsive behavior
- maintainability

---

## Step 7 — Final Response

Return:

- summary of changes
- files modified
- commands run
- checks passed/failed
- remaining risks
- suggested commit message