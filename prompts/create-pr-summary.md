# Prompt — Create PR Summary

Use this prompt before opening a Pull Request, Merge Request, or preparing a delivery summary for a client or team.

## Prompt

Using the active project instructions, specialized agents, workflows, checklists, and available Git information, create a clear Pull Request summary for the current changes.

Do not modify files.

Please:

1. Read the project `AGENTS.md`.
2. Inspect `git status`.
3. Inspect `git diff`.
4. Inspect recent commits if useful.
5. Identify the purpose of the changes.
6. Identify modified, added, deleted, and untracked files.
7. Identify whether the changes are:
   - feature
   - bugfix
   - refactor
   - UI redesign
   - configuration
   - CI/CD
   - documentation
   - mixed

8. Summarize the work clearly.

9. Apply the Release Readiness checklist at a high level.

10. Mention potential risks, missing checks, and manual validation points.

Return a structured Pull Request summary with:

## Title

A concise PR title.

## Context

Explain why these changes were made.

## Changes

List the main changes grouped by theme.

## Technical Notes

Mention important implementation details, architecture decisions, or trade-offs.

## UI/UX Notes

If UI changed, summarize:
- design intent
- responsive behavior
- accessibility considerations
- remaining visual risks

## Security Notes

If relevant, summarize:
- validation
- permissions
- sensitive data handling
- payment/auth/admin risks

## Tests & Checks

List:
- commands run
- checks passed
- checks failed
- checks not run and why

## Risks / Limitations

List remaining risks, assumptions, or manual checks needed.

## Suggested Commit Message

Suggest a conventional commit message.

## Suggested Release Notes

Write short user-facing release notes.

Do not approve the PR automatically if checks were not run.