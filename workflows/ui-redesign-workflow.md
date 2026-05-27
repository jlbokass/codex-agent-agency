# UI Redesign Workflow

Use this workflow when redesigning a page, section, component, landing page, dashboard, or full interface.

## Goal

Create distinctive, polished, user-centered interfaces that avoid generic AI-generated layouts.

---

## Step 1 — Understand the Product Context

Before designing or coding:

- read the project `AGENTS.md`
- identify the business goal
- identify the target users
- identify the primary conversion/action
- identify the existing visual style
- inspect current templates/assets/components
- identify technical constraints

Do not redesign yet.

---

## Step 2 — UX Analysis

Define:

- main user intent
- key user journey
- primary CTA
- secondary CTA
- possible friction points
- accessibility risks
- mobile-specific constraints

The interface must support user decisions, not just look good.

---

## Step 3 — Art Direction

Before implementation, propose a clear visual direction:

- mood
- typography direction
- spacing rhythm
- color atmosphere
- layout style
- imagery/media usage
- interaction style

Avoid:
- generic Bootstrap layouts
- repetitive card grids
- weak hierarchy
- template feeling
- random decorative elements

Prioritize:
- visual identity
- editorial quality
- hierarchy
- rhythm
- immersive sections
- premium feel

---

## Step 4 — Layout Strategy

Describe the layout before coding:

- hero structure
- section order
- content hierarchy
- grid behavior
- mobile behavior
- visual rhythm between sections
- CTA placement

Do not simply stack desktop blocks on mobile.

---

## Step 5 — Implementation

When implementing:

- preserve existing architecture
- reuse existing assets/components when appropriate
- keep templates readable
- avoid business logic in templates
- keep CSS organized
- avoid excessive custom complexity
- ensure responsive behavior
- ensure accessibility basics

---

## Step 6 — Interaction & Motion

Use motion only when it improves comprehension or hierarchy.

Prefer:
- subtle hover states
- smooth transitions
- scroll reveals only when useful
- reduced motion compatibility where relevant

Avoid:
- excessive animation
- decorative motion with no UX value
- distracting effects

---

## Step 7 — Validation

After implementation, check:

- visual hierarchy
- spacing consistency
- CTA clarity
- mobile layout
- accessibility basics
- contrast
- keyboard usability where relevant
- performance impact
- consistency with the project brand

---

## Step 8 — Final Response

Return:

- design intent
- UX choices
- visual direction
- files modified
- responsive decisions
- checks performed
- remaining risks
- suggested commit message