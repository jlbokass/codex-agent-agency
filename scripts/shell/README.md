# Shell Aliases

`aliases.zsh` contains versioned zsh aliases for the main Codex Agent Agency
workflow commands. It is meant to be sourced manually or from a local shell
profile. Most command paths resolve from the alias file location; `promptcopy`
uses the configured repository path shown in the alias file. This file does not
edit shell configuration automatically.

## Available Aliases

- `wpbootstrap` - starts the WordPress custom project bootstrap workflow.
- `staticbootstrap` - starts the static Bootstrap/Sass mockup bootstrap
  workflow.
- `netlifycheck` - runs the Netlify readiness checker.
- `netlifyinit` - runs the Netlify init/link helper.
- `netlifybootstrap` - starts the interactive Netlify workflow.
- `promptcopy` - copies a reusable Markdown prompt into the macOS clipboard.

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
alias promptcopy
```

## Show Command Help

Aliases point directly to the executable scripts, so script arguments pass
through normally:

```zsh
wpbootstrap --help
staticbootstrap --help
netlifycheck --help
netlifyinit --help
netlifybootstrap --help
promptcopy --help
```

Short help works too:

```zsh
wpbootstrap -h
staticbootstrap -h
netlifycheck -h
netlifyinit -h
netlifybootstrap -h
promptcopy -h
```
