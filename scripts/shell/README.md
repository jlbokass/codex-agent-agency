# Shell Aliases

`aliases.zsh` contains versioned zsh aliases for the main Codex Agent Agency
workflow commands. It is meant to be sourced manually or from a local shell
profile. It does not edit shell configuration automatically.

## Available Aliases

- `wpbootstrap` - starts the WordPress custom project bootstrap workflow.
- `staticbootstrap` - starts the static Bootstrap/Sass mockup bootstrap
  workflow.
- `netlifycheck` - runs the Netlify readiness checker.
- `netlifyinit` - runs the Netlify init/link helper.
- `netlifybootstrap` - starts the interactive Netlify workflow.

## Load Manually

```zsh
source /Users/jean-le-grandbokassa/Sites/codex-agent-agency/scripts/shell/aliases.zsh
```

Manual loading affects only the current shell session.

## Add to ~/.zshrc

Add this line to `~/.zshrc`:

```zsh
source /Users/jean-le-grandbokassa/Sites/codex-agent-agency/scripts/shell/aliases.zsh
```

This repository does not auto-edit `~/.zshrc`; add the line only when you want
these aliases loaded in new shell sessions.

## Reload Shell Config

```zsh
source ~/.zshrc
```

You can also open a new terminal session.

## Verify Aliases

```zsh
alias wpbootstrap
alias staticbootstrap
alias netlifycheck
alias netlifyinit
alias netlifybootstrap
```
