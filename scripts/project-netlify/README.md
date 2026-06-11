# Project Netlify Helpers

Shared Netlify helper scripts for static generated projects.

These helpers are intended for static projects that already have a buildable
publish directory. They are generic and should not contain client-specific or
stack-specific assumptions.

## Expected Project Structure

The static project should include:

- `package.json`
- `netlify.toml`
- `public/`
- `public/index.html`
- `public/assets/css/main.css` after running `npm run build`

The expected Netlify settings are:

- build command: `npm run build`
- publish directory: `public`

## Available Scripts

- `bootstrap-netlify-site.sh` is the recommended interactive command. It guides
  the user through readiness checks, optional Netlify initialization/linking,
  and optional manual deploy.
- `check-netlify-ready.sh` is the low-level readiness checker. It validates a
  static project and runs `npm run build`.
- `init-netlify-site.sh` is the low-level Netlify init/link helper. It validates
  Git/Netlify CLI state and runs `netlify init` from the project directory.

## Examples

Recommended interactive workflow:

```bash
scripts/project-netlify/bootstrap-netlify-site.sh
```

Check a project before Netlify setup with the low-level readiness checker:

```bash
scripts/project-netlify/check-netlify-ready.sh \
  --project-dir "/path/to/static-project"
```

Initialize or link a Netlify site with the low-level helper:

```bash
scripts/project-netlify/init-netlify-site.sh \
  --project-dir "/path/to/static-project"
```

## Netlify CLI

`init-netlify-site.sh` requires the Netlify CLI. Authenticate the CLI with:

```bash
netlify login
```

Before running `netlify init`, verify that the CLI is installed and
authenticated:

```bash
netlify status
```

Authentication only confirms that the local Netlify CLI can access your Netlify
account. It does not mean the current project is already linked to a Netlify
site.

`netlify init` links the local Git repository to an existing or new Netlify
site. The helper keeps `netlify init` as the command responsible for that
project-linking step.

Continuous deployment through `netlify init` is the preferred workflow. Manual
deploys are optional and should be used only when intentionally needed.

If `netlify status` confirms a current Netlify user but reports that the project
is not linked yet, the helper continues to `netlify init`. If `netlify status`
fails for another reason, the helper prints the captured output and suggests
running `netlify login`.

`netlify init` may ask interactive questions about the Netlify team, site name,
and repository connection.

## Safety Rules

- Deployment is optional.
- Run Netlify setup only after Git and GitHub setup are complete.
- The interactive bootstrap defaults to continuous deployment setup and does
  not run `netlify deploy` unless the user explicitly chooses a manual deploy.
- Helpers do not add CI/CD scripts.
- Helpers do not store Netlify tokens, credentials, or secrets in this
  repository.
