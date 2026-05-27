# Definition of Done Checklist

Use this checklist before considering a task complete.

## General

- The requested goal is fully addressed.
- The implementation matches the existing project conventions.
- No unrelated changes were introduced.
- No dead code was left behind.
- Naming is clear and consistent.
- The final solution is simpler than the problem requires, not more complex.

---

## Architecture

- Business logic is not placed in templates/views.
- Controllers remain thin.
- Services/classes have clear responsibilities.
- No unnecessary abstraction was introduced.
- Existing patterns were reused where appropriate.
- Public behavior was not changed unless explicitly requested.

---

## PHP / Backend

- Code uses modern PHP practices.
- Types are explicit where useful.
- Validation is handled in the appropriate layer.
- Errors are handled intentionally.
- Security-sensitive logic is explicit.
- Database changes are documented when relevant.

---

## Frontend / UI

- The interface is responsive.
- The mobile layout was considered intentionally.
- CTA hierarchy is clear.
- Visual hierarchy is coherent.
- Spacing is consistent.
- Accessibility basics are respected.
- The UI does not feel generic or template-based.

---

## Symfony / Twig

- Twig contains presentation logic only.
- Translation domains are respected.
- Routes remain coherent.
- Forms, controllers, services, and templates keep separate responsibilities.

---

## Tests & Checks

Run available checks when possible:

- automated tests
- static analysis
- linting
- build commands
- route/debug commands
- frontend build

If a check cannot be run, explain why.

---

## Final Response

The final response must include:

- summary of changes
- files modified
- commands run
- checks passed
- checks not run and why
- remaining risks
- suggested commit message