# Prompt Clipboard Helper

Prompt files in `prompts/` are Markdown instructions for Codex. They are not
executable scripts and should not be run from the shell.

Use `promptcopy` to copy a reusable prompt into the macOS clipboard, then paste
it into Codex.

## Examples

```zsh
promptcopy create-static-to-wordpress-mapping
promptcopy create-static-to-wordpress-mapping.md
promptcopy integrate-static-mockup-into-wordpress
promptcopy --list
```

You can also run the script directly from the repository:

```zsh
./scripts/prompts/promptcopy.sh create-static-to-wordpress-mapping
```

## Troubleshooting

If a prompt name is missing or misspelled, `promptcopy` prints an error and
lists the available prompt files. You can list prompts at any time with:

```zsh
promptcopy --list
```

This helper requires macOS `pbcopy`. If `pbcopy` is not available, the script
fails clearly instead of silently doing nothing.
