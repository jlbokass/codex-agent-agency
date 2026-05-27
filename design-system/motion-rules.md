# Motion Rules

Use these rules when designing or reviewing animations, transitions, hover states, scroll effects, micro-interactions, and interface feedback.

Motion must improve comprehension, hierarchy, feedback, or perceived quality.

Motion is not decoration.

---

# Motion Goals

Good motion should:

- guide user attention
- clarify state changes
- improve perceived responsiveness
- support visual hierarchy
- make interactions feel polished
- reinforce the product mood
- remain subtle and performant

Avoid motion that feels:

- decorative
- distracting
- slow
- excessive
- gimmicky
- template-like
- heavy on performance
- unrelated to the user journey

---

# Core Principle

Every animation must answer at least one of these questions:

- Does it help the user understand what changed?
- Does it guide attention to something important?
- Does it make interaction feedback clearer?
- Does it support storytelling or hierarchy?
- Does it reduce perceived friction?

If not, remove it.

---

# Recommended Motion Types

Prefer:

- subtle hover transitions
- button feedback
- form validation feedback
- menu open/close transitions
- accordion transitions
- modal entrance/exit
- small reveal animations for hierarchy
- smooth focus/active states
- loading states when useful

Avoid:

- animation on every section
- excessive scroll reveals
- parallax without purpose
- looping decorative animation
- delayed content visibility
- heavy motion on mobile
- hover-only interactions for essential actions

---

# Timing

Motion should feel fast and responsive.

Prefer:

- short transitions for UI feedback
- slightly slower transitions for larger layout changes
- consistent timing across similar interactions

Avoid:

- slow buttons
- long page reveals
- animations that delay reading or action
- inconsistent transition speeds

---

# Hover States

Hover states should communicate interactivity.

Use hover to clarify:

- clickable cards
- buttons
- navigation links
- image links
- secondary actions

Avoid:

- excessive movement
- large layout shifts
- hover effects that hide content
- hover-only information
- effects that do not work on touch devices

---

# Focus States

Focus states must remain visible.

Do not remove browser focus without replacing it with an accessible visible focus style.

Focus states should be:

- clear
- consistent
- visible on keyboard navigation
- not dependent on color alone when possible

---

# Scroll Effects

Scroll effects should be used carefully.

Use only when they:

- support storytelling
- reveal hierarchy progressively
- help users understand page structure

Avoid:

- scroll effects on every block
- effects that delay important content
- excessive parallax
- scroll hijacking
- heavy JavaScript for simple reveals

---

# Forms

Use motion in forms only to improve clarity.

Useful motion:

- error message appearance
- success confirmation
- loading state during submit
- step transition in multi-step forms
- subtle focus transitions

Avoid:

- animated labels that hurt readability
- distracting effects during input
- hidden errors
- slow validation feedback

---

# Mobile Motion

On mobile:

- reduce animation complexity
- avoid heavy scroll effects
- avoid hover-dependent behavior
- keep interactions immediate
- preserve performance
- ensure content appears quickly

Mobile motion must support usability, not spectacle.

---

# Accessibility

Respect reduced-motion preferences when relevant.

Avoid:

- flashing effects
- intense movement
- motion that causes disorientation
- essential information revealed only through animation

The interface must remain understandable without animation.

---

# Performance

Motion should not degrade performance.

Avoid:

- heavy JavaScript animations when CSS is enough
- animating layout-heavy properties unnecessarily
- too many simultaneous animations
- large animated media without need

Prefer animating:

- opacity
- transform
- subtle color changes
- box-shadow carefully

Avoid excessive animation of:

- width
- height
- top
- left
- layout-affecting properties

---

# Motion Anti-Patterns

Detect:

- animation added only to impress
- too many elements animating at once
- scroll reveal everywhere
- hover effects that move content too much
- mobile motion that slows usage
- missing reduced-motion consideration
- animations hiding important content
- inconsistent transition behavior

---

# Motion Review Output

When reviewing motion, return:

- useful motion opportunities
- unnecessary motion risks
- accessibility concerns
- performance risks
- mobile motion risks
- recommended motion corrections
- expected UX benefit