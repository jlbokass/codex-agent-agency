# Codex Agent Agency shell aliases.

CODEX_AGENT_AGENCY_ALIAS_FILE="${${(%):-%x}:A}"
CODEX_AGENT_AGENCY_ROOT="${CODEX_AGENT_AGENCY_ALIAS_FILE:h:h:h}"

# Start the interactive WordPress custom project bootstrap workflow.
alias wpbootstrap="$CODEX_AGENT_AGENCY_ROOT/skills/wordpress-custom-theme-scaffold/scripts/bootstrap-wp-custom-project.sh"

# Start the interactive static Bootstrap/Sass mockup bootstrap workflow.
alias staticbootstrap="$CODEX_AGENT_AGENCY_ROOT/skills/static-bootstrap-sass-mockup/scripts/bootstrap-static-mockup.sh"

# Run the low-level Netlify readiness checker for a static project.
alias netlifycheck="$CODEX_AGENT_AGENCY_ROOT/scripts/project-netlify/check-netlify-ready.sh"

# Run the low-level Netlify init/link helper for a static project.
alias netlifyinit="$CODEX_AGENT_AGENCY_ROOT/scripts/project-netlify/init-netlify-site.sh"

# Start the interactive Netlify readiness, init/link, and optional deploy workflow.
alias netlifybootstrap="$CODEX_AGENT_AGENCY_ROOT/scripts/project-netlify/bootstrap-netlify-site.sh"
