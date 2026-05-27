# Release Readiness Checklist

Use this checklist before merging, delivering, deploying, or presenting a version to a client.

## Goal

Ensure the work is stable, understandable, testable, and safe to release.

---

## Scope Validation

- The requested scope is fully covered.
- No unrelated features were added.
- No accidental refactoring was introduced.
- Remaining limitations are clearly identified.
- Business rules were not invented.

---

## Code Quality

- Code follows project conventions.
- Architecture remains coherent.
- Naming is clear.
- Dead code was removed.
- Duplicated logic was avoided.
- The solution is not overengineered.

---

## Backend Validation

- Routes work as expected.
- Forms validate input correctly.
- Errors are handled intentionally.
- Database changes are documented.
- Migrations are safe and reversible when relevant.
- Sensitive operations are protected.

---

## Frontend / UI Validation

- UI is responsive.
- Mobile behavior was checked.
- CTA hierarchy is clear.
- Accessibility basics are respected.
- No obvious visual regression exists.
- The interface does not feel generic or unfinished.

---

## Security Validation

- No secrets are committed.
- Environment variables are respected.
- Debug mode is not enabled for production.
- User input is validated.
- Output escaping is respected.
- Admin/payment/auth areas are protected when relevant.

---

## Tests & Commands

Run available checks when possible:

- automated tests
- static analysis
- lint
- build
- route checks
- migration checks
- frontend build

If a command cannot be run, explain why.

---

## Git Validation

- `git status` is clean or expected.
- `git diff` was reviewed.
- Modified files are intentional.
- Suggested commit message is clear.
- No temporary/debug files are included.

---

## Documentation

- README or docs are updated if needed.
- Setup steps are documented if changed.
- New environment variables are documented.
- Deployment notes are documented when relevant.

---

## Final Release Output

Return:

- release summary
- files modified
- commands run
- checks passed
- checks not run and why
- known risks
- manual checks required
- release approval status
- suggested commit message