# Prompt — Onboard Project

Use this prompt when opening a new or existing client project for the first time.

## Prompt

Using the active project instructions, specialized agents, workflows, and checklists, onboard this project as a new client project.

Do not modify files.

Please:

1. Read the project `AGENTS.md`.
2. Inspect the repository structure.
3. Identify the detected stack.
4. Identify the active specialized agents.
5. Identify the active workflows.
6. Identify the active checklists.
7. Detect available tooling:
   - Composer
   - npm/yarn/pnpm
   - Docker/DDEV/Sail
   - PHPUnit/Pest
   - PHPStan/Psalm
   - PHP-CS-Fixer/Pint
   - ESLint
   - Stylelint
   - Prettier
   - Vite/Webpack
   - GitHub Actions

8. Summarize:
   - project type
   - main directories
   - architecture
   - UI/frontend structure
   - testing setup
   - deployment/CI clues
   - risks
   - missing documentation
   - recommended next actions

9. Recommend:
   - which specialized agents should be active
   - which workflows should be used first
   - which checklists are critical for this project

Return a structured onboarding report.

Do not implement anything yet.