# Prompt — Audit Project

Use this prompt when you need a structured technical, architectural, UI/UX, security, and delivery audit of a project.

## Prompt

Using the active project instructions, specialized agents, workflows, checklists, and available project tooling, audit this project.

Do not modify files.

Please:

1. Read the project `AGENTS.md`.
2. Inspect the repository structure.
3. Identify the detected stack.
4. Identify active specialized agents.
5. Identify active workflows.
6. Identify active checklists.
7. Inspect important configuration files.
8. Inspect backend architecture.
9. Inspect frontend/UI structure.
10. Inspect testing setup.
11. Inspect CI/CD and deployment clues.
12. Inspect documentation.
13. Inspect security-sensitive areas.
14. Inspect dependency/tooling setup.

Apply, when relevant:

- Project Onboarding Workflow
- Review Workflow
- Definition of Done checklist
- Security Quality Gate checklist
- UI/UX Quality Gate checklist
- Release Readiness checklist

Audit the project critically but fairly.

Return a structured audit report with:

## Executive Summary

Short summary of project health.

## Detected Stack

List detected technologies, frameworks, tools, and package managers.

## Project Structure

Summarize key directories and their purpose.

## Architecture Review

Evaluate:
- separation of concerns
- maintainability
- naming
- service boundaries
- controller/template responsibilities
- possible technical debt
- overengineering or underengineering

## Backend Review

Evaluate:
- PHP quality
- framework conventions
- validation
- routing
- forms
- services
- database/migrations
- security-sensitive logic

## Frontend / UI Review

Evaluate:
- templates/components
- CSS/SCSS organization
- JavaScript organization
- responsive behavior
- accessibility basics
- visual hierarchy
- generic/template risk
- design consistency

## Security Review

Evaluate:
- secrets
- environment variables
- input validation
- output escaping
- auth/admin/payment/upload risks
- dependency risks

## Testing & Quality Review

Evaluate:
- available tests
- missing tests
- lint/static analysis
- build checks
- quality tooling

## CI/CD & Deployment Review

Evaluate:
- existing pipelines
- deployment clues
- environment handling
- rollback risks
- production-readiness

## Documentation Review

Evaluate:
- README quality
- setup documentation
- environment documentation
- deployment documentation
- missing developer notes

## Risks

Classify risks as:

- Critical
- Important
- Minor
- Optional

## Recommended Next Actions

Return a prioritized action plan:

1. immediate fixes
2. short-term improvements
3. medium-term improvements
4. optional enhancements

## Suggested First Safe Task

Recommend one low-risk task to start improving the project.

Do not implement anything.