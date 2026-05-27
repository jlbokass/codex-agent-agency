# Refactor Workflow

Use this workflow when improving existing code structure without changing expected behavior.

## Goal

Improve maintainability, readability, architecture, or testability while preserving behavior.

Do not change business behavior unless explicitly requested.

---

## Step 1 — Understand Existing Behavior

Before modifying files:

- read the project `AGENTS.md`
- inspect active specialized agents and workflows
- inspect relevant files
- identify current behavior
- identify public APIs, routes, templates, tests, or contracts
- identify existing conventions

Do not refactor yet.

---

## Step 2 — Identify Refactor Scope

Define:

- why refactoring is needed
- what should change
- what must not change
- impacted files
- risk level
- tests/checks needed

Prefer small, safe refactors over broad rewrites.

---

## Step 3 — Plan

Provide a concise plan:

- current problem
- proposed structure
- expected benefits
- migration strategy if needed
- validation strategy

For broad refactors, wait for validation before implementation.

---

## Step 4 — Implement

During implementation:

- preserve behavior
- keep changes incremental
- avoid unrelated formatting changes
- avoid introducing unnecessary abstractions
- improve naming when useful
- reduce duplication
- improve separation of concerns
- keep templates presentation-only
- keep controllers thin

---

## Step 5 — Validate

After implementation:

- run relevant tests
- run lint/static analysis when available
- compare behavior before/after when possible
- check routes/templates if relevant
- check UI if templates or assets changed

If validation cannot be performed, explain why.

---

## Step 6 — Self-review

Before final response, check:

- behavior preserved
- architecture improved
- no unnecessary complexity added
- no unrelated changes included
- naming is clearer
- tests/checks are sufficient

---

## Step 7 — Final Response

Return:

- refactor summary
- behavior preserved
- files modified
- commands run
- checks passed/failed
- remaining risks
- suggested commit message