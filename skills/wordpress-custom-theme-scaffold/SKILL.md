---
name: wordpress-custom-theme-scaffold
description: Define and run the workflow for creating a maintainable custom WordPress theme project scaffold, with optional companion plugin, Local WP symlinks, Git initialization, and GitHub repository setup.
---

# WordPress Custom Theme Scaffold

Use this skill when asked to create or plan a maintainable custom WordPress
theme project scaffold. The scaffold workflow may optionally include a companion
custom plugin, Local WP symlinks, Git initialization, and GitHub repository
setup.

This skill currently defines the contract and workflow only. It does not include
scaffold files, shell scripts, generated WordPress project files, or deployment
configuration.

For the detailed future execution sequence, read
`references/workflow.md`.

## Purpose

The skill is intended to support a future workflow that can:

- create a maintainable custom WordPress theme project
- optionally create a companion custom plugin for Custom Post Types, taxonomies,
  metadata, and business logic
- optionally link the generated theme and plugin into a Local WP installation
  using symlinks
- optionally initialize Git and push to GitHub

## Required Inputs

Collect and confirm these inputs before generating files:

- human project name
- theme slug
- PHP prefix
- text domain
- whether to create a companion plugin
- plugin slug, when a companion plugin is requested
- Local WP project path, when symlinks are requested
- whether to initialize Git
- whether to create a GitHub repository
- repository visibility, when a GitHub repository is requested

## Expected Outputs

The future scaffold workflow should produce:

- project folder
- theme folder
- optional plugin folder
- documentation folder
- optional Local WP symlinks
- optional Git repository
- optional GitHub remote

## Boundaries

- This skill does not design the website.
- This skill does not create client-specific content.
- This skill does not generate production deployment configuration.
- This skill does not store secrets or credentials.
- CPTs, taxonomies, metadata, and business logic belong in the companion plugin,
  not the theme.
- Presentation, templates, layouts, assets, and frontend rendering belong in the
  theme.
