# Review Workflow

Use this workflow when reviewing code, UI, architecture, refactoring, or a pull request.

## Goal

Provide a critical, structured, senior-level review before accepting changes.

The review must detect:
- bugs
- regressions
- architectural problems
- UX/UI weaknesses
- security risks
- maintainability issues
- missing tests
- unclear naming
- unnecessary complexity

---

## Step 1 — Inspect Context

Before reviewing:

- read the project `AGENTS.md`
- read active specialized agents
- inspect modified files
- inspect git status
- inspect git diff
- identify the purpose of the change
- identify the stack and conventions

Do not approve changes without checking the actual diff.

---

## Step 2 — Engineering Review

Check:

- architecture consistency
- separation of concerns
- controller/service boundaries
- naming quality
- duplicated logic
- hidden side effects
- unnecessary abstractions
- maintainability
- scalability
- testability

---

## Step 3 — Symfony / PHP Review

When relevant, verify:

- controllers stay thin
- business logic is not in Twig
- dependency injection is clean
- services are focused
- validation is explicit
- routes are coherent
- translations are maintainable
- tests cover meaningful behavior

---

## Step 4 — Frontend Review

When relevant, verify:

- responsive behavior
- accessibility basics
- semantic HTML
- keyboard navigation where relevant
- visual hierarchy
- spacing consistency
- CSS organization
- no excessive custom complexity

---

## Step 5 — UI/UX Review

When relevant, check:

- CTA clarity
- user journey
- mobile UX
- hierarchy
- visual rhythm
- consistency with art direction
- avoidance of generic template feeling
- emotional impact
- readability

---

## Step 6 — Risk Classification

Classify findings as:

- Critical: must fix before merge
- Important: should fix before merge
- Minor: can fix soon
- Optional: improvement suggestion

Do not overstate minor issues.

---

## Step 7 — Final Review Output

Return:

- review summary
- critical issues
- important issues
- minor issues
- optional improvements
- tests/checks that should be run
- suggested next action
- suggested commit message if changes are acceptable