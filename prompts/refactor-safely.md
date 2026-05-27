# Prompt — Refactor Safely

Use this prompt when improving existing code structure without changing expected behavior.

## Prompt

Using the active project instructions, specialized agents, workflows, and checklists, help me refactor the following area safely:

[DESCRIBE THE AREA TO REFACTOR HERE]

Follow the active Refactor Workflow.

Before modifying files:

1. Read the project `AGENTS.md`.
2. Inspect the repository structure.
3. Identify the affected files, routes, templates, classes, services, or components.
4. Identify the current behavior.
5. Identify public APIs, routes, templates, tests, or contracts that must not break.
6. Identify existing conventions.
7. Identify why refactoring is needed.
8. Define what must change and what must not change.

Do not modify files yet.

First provide a refactor plan including:

- current problem
- proposed structure
- expected benefits
- impacted files
- behavior that must be preserved
- validation strategy
- risks

Wait for confirmation before implementing.

After confirmation:

1. Apply the refactor incrementally.
2. Preserve behavior.
3. Avoid unrelated formatting changes.
4. Avoid unnecessary abstractions.
5. Keep changes minimal.
6. Run relevant tests/checks when available.
7. Use the Definition of Done checklist.
8. Use the Review Workflow before final response.
9. Use the Release Readiness checklist if the refactor is delivery-ready.

Final response must include:

- refactor summary
- behavior preserved
- files modified
- commands run
- checks passed
- checks not run and why
- remaining risks
- suggested commit message