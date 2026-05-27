# Prompt — Fix Bug

Use this prompt when investigating and fixing a bug, regression, broken behavior, failed test, UI issue, deployment problem, or error message.

## Prompt

Using the active project instructions, specialized agents, workflows, and checklists, investigate and fix the following bug:

[DESCRIBE THE BUG HERE]

Follow the active Bugfix Workflow.

Before modifying files:

1. Read the project `AGENTS.md`.
2. Inspect the repository structure.
3. Identify the affected feature, page, route, component, command, or service.
4. Inspect relevant files.
5. Inspect logs, stack traces, failing tests, browser errors, or console output when available.
6. Identify the expected behavior.
7. Identify the actual behavior.
8. Determine whether the bug is backend, frontend, database, routing, configuration, deployment, or UI-related.
9. Explain the suspected root cause with evidence.

Do not modify files until the root cause and minimal fix strategy are explained.

Then provide:

- bug summary
- expected behavior
- actual behavior
- suspected root cause
- impacted files
- minimal fix strategy
- validation strategy
- risks

Wait for confirmation before implementing if the fix touches multiple files or carries risk.

After implementation:

1. Run relevant tests/checks when available.
2. Use the Definition of Done checklist.
3. Use the Security Quality Gate when relevant.
4. Use the UI/UX Quality Gate when UI is affected.
5. Use the Release Readiness checklist if the fix is delivery-ready.

Final response must include:

- bug summary
- root cause
- fix applied
- files modified
- commands run
- checks passed
- checks not run and why
- remaining risks
- suggested commit message