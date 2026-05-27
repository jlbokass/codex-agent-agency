# Prompt — Create Feature

Use this prompt when adding a new feature or significantly extending an existing one.

## Prompt

Using the active project instructions, specialized agents, workflows, and checklists, help me implement the following feature:

[DESCRIBE THE FEATURE HERE]

Follow the active Feature Workflow.

Before modifying files:

1. Read the project `AGENTS.md`.
2. Inspect the existing repository structure.
3. Identify the detected stack.
4. Identify existing conventions.
5. Identify impacted files.
6. Identify possible UX/UI impact.
7. Identify security or data risks.
8. Identify tests/checks that should be run.

Then provide a concise implementation plan including:

- feature goal
- technical approach
- UX/UI impact
- files likely to change
- risks
- validation strategy

Do not implement until I explicitly confirm.

After confirmation, implement incrementally.

After implementation:

1. Run relevant tests/checks when available.
2. Use the Definition of Done checklist.
3. Use the Security Quality Gate when relevant.
4. Use the UI/UX Quality Gate when UI is affected.
5. Use the Release Readiness checklist if the task is delivery-ready.

Final response must include:

- summary of changes
- files modified
- commands run
- checks passed
- checks not run and why
- remaining risks
- suggested commit message