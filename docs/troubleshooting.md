# Troubleshooting

## BrowserSync Ports 3000 and 3001

BrowserSync commonly uses ports `3000` and `3001`. If startup fails because a
port is busy, inspect the ports:

```bash
lsof -i :3000
lsof -i :3001
```

Stop stale processes only after confirming they are safe to stop.

## Sass Cannot Import Bootstrap

Run dependencies from the generated static project:

```bash
npm install
```

Then retry:

```bash
npm run build
```

If the error continues, confirm `bootstrap` is listed in the generated
`package.json`.

## Bootstrap Sass Deprecation Warnings

Bootstrap Sass dependency warnings can appear during compilation. Generated
static projects are expected to hide dependency warnings with Sass
`--quiet-deps`, but direct Sass commands may still show them.

## Horizontal Overflow on Mobile

Check for fixed-width elements, oversized media, negative margins, and long text
that cannot wrap. Inspect at narrow viewport widths and confirm no element
extends beyond the viewport.

## Local WP Folder Name Differs From Visible Name

Local WP's visible site name can differ from the folder slug under:

```text
/Users/jean-le-grandbokassa/Local Sites
```

Use the folder slug for `--local-site-slug`.

## Symlink Already Exists

If the destination is already a symlink, rerun the WordPress bootstrap with
`--force-localwp` only when replacing that symlink is intentional.

If the destination is a real directory or file, inspect it manually. Do not
replace real theme or plugin directories with symlinks unless you are certain it
is safe.

## Missing netlify.toml

Netlify readiness requires `netlify.toml` in the generated static project. If it
is missing, confirm the project was generated from the static mockup scaffold or
add the file manually with:

```toml
[build]
  command = "npm run build"
  publish = "public"
```

## Netlify CLI Authentication

Check authentication:

```bash
netlify status
```

If authentication is missing:

```bash
netlify login
```

`init-netlify-site.sh` can continue when the CLI is authenticated but the
project is not linked yet. It fails clearly for other Netlify CLI status
errors.

## GitHub CLI Authentication

Check authentication:

```bash
gh auth status
```

If authentication is missing:

```bash
gh auth login
```

GitHub repository creation will fail until `gh auth status` succeeds.

## Prompt Markdown Files Are Not Executable

Prompt files in `prompts/` are Markdown instructions for Codex, not shell
scripts. Do not run them directly.

If you see this error after trying to run a prompt file:

```text
zsh: permission denied
```

Copy the prompt into the macOS clipboard instead:

```bash
promptcopy create-static-to-wordpress-mapping
```

Use `promptcopy --list` to see available prompt names.

## Help Commands

Main workflow scripts and their aliases support both `--help` and `-h`:

```bash
wpbootstrap --help
staticbootstrap --help
netlifycheck --help
netlifyinit --help
netlifybootstrap --help
promptcopy --help
```

If an alias is not found, source the aliases file first:

```zsh
source /Users/jean-le-grandbokassa/CodexProjects/codex-agent-agency/scripts/shell/aliases.zsh
```

## Documentation Navigation

- [Documentation Home](index.md)
- [Quick Start](quick-start.md)
- [Folder Roles](folder-roles.md)
- [Command Reference](command-reference.md)
- [Aliases](aliases.md)
- [Workflows](workflows/index.md)
- [Roadmap](roadmap.md)
