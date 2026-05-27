# UI Anti-Patterns

Use this file to detect and avoid generic, weak, or AI-generated interface patterns.

The goal is not to reject simple design. The goal is to avoid design without intention.

---

# Global Anti-Patterns

Avoid:

- generic landing page structure
- centered hero with vague headline and two buttons
- repeated card grids
- default Bootstrap look
- excessive symmetry
- mechanical spacing
- weak visual hierarchy
- random decorative icons
- too many gradients
- too many shadows
- identical section rhythm
- stock-photo feeling
- generic SaaS layout for non-SaaS projects
- overly polished but empty visuals
- decorative animation without purpose

---

# Hero Anti-Patterns

Avoid:

- centered title + subtitle + button with no visual identity
- vague headline like “Welcome to our website”
- background image with unreadable text
- hero sections that do not explain the offer
- hero sections without a clear primary action
- generic two-column layout with no visual tension
- excessive height with little content

A strong hero should answer:

- What is this?
- Who is it for?
- Why should I care?
- What should I do next?

---

# Card Anti-Patterns

Avoid:

- three identical cards with icons and short text
- too many cards with equal visual weight
- cards used for content that does not need cards
- default border + radius + shadow everywhere
- icons that do not add meaning
- weak card titles
- repetitive benefit sections

Before using cards, ask:

- Does this content need separation?
- Should one item be visually stronger?
- Would an editorial layout be better?
- Is this becoming a template pattern?

---

# Typography Anti-Patterns

Avoid:

- weak heading sizes
- centered text everywhere
- long unreadable paragraphs
- low contrast between title and body
- tiny mobile text
- inconsistent heading hierarchy
- too many font weights
- generic font pairing without intent

Typography should guide attention.

---

# Spacing Anti-Patterns

Avoid:

- same padding on every section
- cramped content blocks
- huge empty sections without purpose
- inconsistent spacing between related elements
- desktop spacing simply compressed on mobile
- no rhythm between dense and calm sections

Spacing should create hierarchy and flow.

---

# Color Anti-Patterns

Avoid:

- random accent colors
- too many bright colors
- low contrast text
- gradients without purpose
- colors that do not match brand mood
- overuse of black/white with no atmosphere
- accessibility-hostile palettes

Color should support clarity and positioning.

---

# Form Anti-Patterns

Avoid:

- placeholder-only fields
- unclear required fields
- full-width bare forms with no context
- intimidating form density
- weak submit CTA
- no reassurance text
- no error/help states
- no privacy or security note when relevant

Forms should feel calm, clear, and trustworthy.

---

# Navigation Anti-Patterns

Avoid:

- too many menu items
- unclear active state
- hidden primary CTA
- inconsistent labels
- desktop navigation copied poorly to mobile
- mobile menus with tiny tap targets

Navigation should reduce cognitive load.

---

# Mobile Anti-Patterns

Avoid:

- simply stacking desktop sections
- hiding key information too low
- huge hero sections that push CTA below the fold
- tiny text
- tiny buttons
- cramped forms
- images cropped without intention
- heavy decorative effects

Mobile should have its own hierarchy.

---

# Motion Anti-Patterns

Avoid:

- animation everywhere
- scroll effects without purpose
- motion that delays content
- hover-only interactions for important actions
- effects that hurt performance
- no reduced-motion consideration

Motion should support comprehension, not decoration.

---

# AI-Generated Look Detection

A design may look AI-generated if:

- the hero is too generic
- every section has the same rhythm
- cards are repeated mechanically
- headings are vague
- CTAs are obvious but uninspired
- visuals are decorative but not meaningful
- the page feels assembled rather than composed
- there is no memorable section
- the design could fit any business by changing the logo

If these signs appear, propose a stronger direction before implementing.

---

# Required Response When Detecting Anti-Patterns

When reviewing UI, return:

- detected anti-patterns
- why they weaken the experience
- proposed correction
- priority level
- expected UX benefit