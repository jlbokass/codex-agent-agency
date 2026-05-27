# Prompt — Review Current Changes

Use this prompt after implementing a feature, fixing a bug, refactoring code, redesigning UI, or before committing changes.

## Prompt

Using the active project instructions, specialized agents, workflows, and checklists, review the current changes.

Do not modify files.

Please:

1. Read the project `AGENTS.md`.
2. Inspect `git status`.
3. Inspect `git diff`.
4. Identify the purpose of the changes.
5. Apply the active Review Workflow.
6. Apply the Definition of Done checklist.
7. Apply the Security Quality Gate when relevant.
8. Apply the UI/UX Quality Gate when UI is affected.
9. Apply the Release Readiness checklist if the changes look delivery-ready.

Review the changes critically.

Check for:

- bugs
- regressions
- unnecessary complexity
- architecture issues
- naming issues
- duplicated logic
- security risks
- missing validation
- missing tests
- UI/UX weaknesses
- responsive problems
- accessibility issues
- unintended file changes

Classify findings as:

- Critical: must fix before commit
- Important: should fix before commit
- Minor: can be fixed later
- Optional: improvement suggestion

Return:

- review summary
- modified files reviewed
- critical issues
- important issues
- minor issues
- optional improvements
- tests/checks that should be run
- release readiness status
- suggested next action
- suggested commit message if acceptable

Do not approve the changes too easily.