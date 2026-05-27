# Security Quality Gate Checklist

Use this checklist before validating backend, frontend, CMS, payment, authentication, admin, upload, API, or deployment-related changes.

## Goal

Prevent common security regressions and unsafe implementation choices.

---

## General Security

- No secrets, tokens, passwords, API keys, or private credentials are committed.
- Environment variables are used for sensitive configuration.
- Error messages do not expose sensitive technical details.
- Debug mode is not enabled for production.
- Logs do not expose passwords, tokens, payment data, or personal data.
- User input is never trusted blindly.

---

## PHP / Backend

- Input validation is explicit.
- Output escaping is respected.
- Authorization checks are present where needed.
- Sensitive operations require proper permissions.
- File uploads are validated by type, size, and destination.
- Database queries are safe from SQL injection.
- External API calls handle errors safely.
- Exceptions are handled intentionally.

---

## Symfony

- Forms use CSRF protection when relevant.
- Routes requiring authentication are protected.
- Voters, roles, or access controls are used where needed.
- Twig output escaping is not bypassed unnecessarily.
- Admin routes are protected.
- Validation constraints are defined where needed.
- Secrets are stored outside committed files.

---

## Laravel

- Form Requests or validators are used for user input.
- Policies/gates/middleware protect sensitive actions.
- CSRF protection is respected.
- Mass assignment is controlled.
- Blade escaping is not bypassed unnecessarily.
- `.env` is not committed.

---

## WordPress / WooCommerce

- WordPress core files are never modified.
- Inputs are sanitized.
- Outputs are escaped.
- Nonces are used for form/action protection.
- Capabilities are checked before privileged actions.
- WooCommerce checkout/payment logic is not trusted only from frontend data.
- Template overrides are minimized and documented.

---

## Authentication & Authorization

- Login, admin, account, and payment flows are protected.
- Users cannot access resources they do not own.
- Role checks are explicit.
- Passwords are never stored in plain text.
- Session-sensitive actions are protected.

---

## Payments

- Payment status is confirmed server-side.
- Webhooks are treated as the source of truth when relevant.
- Frontend payment state is not trusted.
- Payment secrets are not exposed.
- Refund, cancellation, and failure states are handled.

---

## Frontend

- No sensitive data is exposed in JavaScript.
- Forms include validation but do not rely only on client-side checks.
- External scripts are intentional and documented.
- Links using `target="_blank"` include `rel="noopener noreferrer"`.

---

## Dependencies

- Dependencies are not added casually.
- Known vulnerable packages are checked when possible.
- Unused packages are removed when relevant.
- Updates are tested before being accepted.

---

## Final Security Review Output

Return:

- security summary
- critical risks
- important risks
- minor risks
- files or areas to inspect manually
- commands/checks run
- checks not run and why
- final security approval status