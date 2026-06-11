---
name: static-to-wordpress-integration
description: Define the workflow for converting a validated static HTML, SCSS, and JavaScript mockup into a maintainable WordPress custom theme with optional companion plugin content modeling.
---

# Static to WordPress Integration

Use this skill when a validated static mockup needs to become a WordPress custom
theme. The goal is to preserve the validated visual design while translating
static pages, sections, assets, and interactions into maintainable WordPress
theme structure.

This skill defines the integration contract only. It does not create conversion
scripts, modify scaffolds, or generate WordPress code yet.

## Purpose

This skill is intended to support a future workflow that can:

- convert a validated static HTML, SCSS, and JavaScript mockup into a
  maintainable WordPress custom theme
- preserve the validated visual design, spacing, responsive behavior, and UI
  hierarchy
- split static HTML into WordPress templates and template parts
- move business data and content models into a companion plugin when needed
- keep presentation in the theme and business logic in the plugin

## Expected Inputs

Collect and confirm these inputs before planning integration:

- path to the static mockup project
- path to the WordPress custom project
- target theme slug
- optional plugin slug
- list of static pages to convert
- content model notes
- CPT and taxonomy requirements
- dynamic sections to identify
- assets strategy

## Expected Outputs

The integration planning workflow should produce:

- mapping between static pages and WordPress templates
- proposed template-parts structure
- list of assets to migrate
- list of dynamic content areas
- list of CPTs and taxonomies if needed
- integration checklist

## Theme and Plugin Responsibility

Keep responsibilities separated:

- Theme: templates, template parts, presentation assets, layout, responsive
  behavior, and WordPress theme support.
- Plugin: custom post types, taxonomies, business rules, reusable content
  models, integrations, and data that should survive a theme change.

## Boundaries

- This skill does not design the website.
- This skill does not create the original static mockup.
- This skill does not replace WordPress content modeling decisions.
- This skill does not put CPTs or taxonomies in the theme.
- This skill must not blindly convert everything into PHP without identifying
  dynamic content first.
- This skill does not create conversion scripts yet.
- This skill does not modify the existing WordPress or static scaffolds.

For the detailed future workflow, read `references/workflow.md`. For review
criteria, read `references/checklist.md`.
