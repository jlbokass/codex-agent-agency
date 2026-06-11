# Shell Aliases

These aliases are optional conveniences for the main workflow commands. The
versioned alias file lives at:

```text
scripts/shell/aliases.zsh
```

Load it manually with:

```zsh
source /Users/jean-le-grandbokassa/Sites/codex-agent-agency/scripts/shell/aliases.zsh
```

Manual loading affects only the current shell session. To load aliases in new
zsh sessions, add the same `source` line to `~/.zshrc`, then reload with:

```zsh
source ~/.zshrc
```

## Alias List

The alias file resolves script paths from its own location, then points each
alias directly at the executable workflow script.

- `wpbootstrap` - WordPress custom project bootstrap.
- `staticbootstrap` - static Bootstrap/Sass mockup bootstrap.
- `netlifycheck` - Netlify readiness checker.
- `netlifyinit` - Netlify init/link helper.
- `netlifybootstrap` - interactive Netlify workflow.

## Project Bootstrap

```zsh
wpbootstrap
staticbootstrap
```

## Netlify

```zsh
netlifycheck --project-dir "/path/to/static-project"
netlifyinit --project-dir "/path/to/static-project"
netlifybootstrap
```

## Verify Loaded Aliases

```zsh
alias wpbootstrap
alias staticbootstrap
alias netlifycheck
alias netlifyinit
alias netlifybootstrap
```

## Help Through Aliases

Aliases point directly to the executable scripts, so `--help` and `-h` pass
through:

```zsh
wpbootstrap --help
staticbootstrap --help
netlifycheck --help
netlifyinit --help
netlifybootstrap --help
```

## Documentation Navigation

- [Documentation Home](index.md)
- [Quick Start](quick-start.md)
- [Folder Roles](folder-roles.md)
- [Command Reference](command-reference.md)
- [Workflows](workflows/index.md)
- [Troubleshooting](troubleshooting.md)
- [Roadmap](roadmap.md)
