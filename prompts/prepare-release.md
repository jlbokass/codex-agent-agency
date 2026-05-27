# Prompt — Prepare Release

Use this prompt before merging, delivering, deploying, or presenting a version to a client.

## Prompt

Using the active project instructions, specialized agents, workflows, checklists, and available project tooling, prepare the current work for release.

Do not modify files unless I explicitly ask for fixes.

Please:

1. Read the project `AGENTS.md`.
2. Inspect `git status`.
3. Inspect `git diff`.
4. Identify the purpose and scope of the current changes.
5. Identify modified, added, deleted, and untracked files.
6. Identify whether the changes are feature, bugfix, refactor, UI redesign, configuration, CI/CD, documentation, or mixed.
7. Identify available test, lint, static analysis, and build commands.
8. Run safe read-only checks when appropriate.
9. Apply the Release Readiness checklist.
10. Apply the Definition of Done checklist.
11. Apply the Security Quality Gate when relevant.
12. Apply the UI/UX Quality Gate when UI is affected.

Review the release critically.

Check for:

- incomplete scope
- accidental unrelated changes
- missing tests
- failing checks
- debug code
- temporary files
- secrets or sensitive data
- broken routes
- risky migrations
- UI regressions
- responsive issues
- accessibility issues
- unclear documentation
- missing environment variable documentation
- deployment risks

Return a release report with:

- release summary
- type of changes
- files reviewed
- commands run
- checks passed
- checks failed
- checks not run and why
- critical blockers
- important issues
- minor issues
- manual checks required
- documentation updates needed
- deployment risks
- release approval status:
  - ready
  - ready with reservations
  - not ready
- suggested next action
- suggested commit message
- suggested release notes