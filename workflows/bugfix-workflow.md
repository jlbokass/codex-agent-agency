# Bugfix Workflow

Use this workflow when investigating and fixing a bug, regression, error, broken UI behavior, failed test, deployment issue, or unexpected application behavior.

## Goal

Fix the root cause without introducing unnecessary changes.

Do not guess. Investigate first.

---

## Step 1 — Understand the Bug

Before modifying files:

- read the project `AGENTS.md`
- inspect active specialized agents and workflows
- identify the reported behavior
- identify the expected behavior
- identify the affected feature/page/component
- inspect relevant files
- inspect logs, errors, stack traces, or failing tests when available

Do not implement yet.

---

## Step 2 — Reproduce or Isolate

Try to determine:

- where the bug happens
- when it happens
- whether it is backend, frontend, database, routing, configuration, or deployment related
- whether it is a regression
- whether tests already cover the behavior

If reproduction is impossible, explain what information is missing.

---

## Step 3 — Root Cause Analysis

Before fixing, explain:

- suspected root cause
- evidence found in the codebase
- impacted files
- risk level
- minimal fix strategy

Avoid broad refactoring unless necessary.

---

## Step 4 — Fix

When implementing:

- make the smallest safe change
- preserve existing architecture
- avoid unrelated cleanup
- avoid changing public behavior unless required
- keep business logic out of templates
- add or update tests when useful

---

## Step 5 — Validate

After fixing:

- run relevant tests
- run lint/static analysis when available
- verify the affected behavior
- verify no obvious regression was introduced
- check responsive behavior if UI was affected

If a check cannot be run, explain why.

---

## Step 6 — Final Response

Return:

- bug summary
- root cause
- fix applied
- files modified
- commands run
- checks passed/failed
- remaining risks
- suggested commit message