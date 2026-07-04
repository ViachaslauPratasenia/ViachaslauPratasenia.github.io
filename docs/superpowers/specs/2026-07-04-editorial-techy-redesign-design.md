# Editorial + Techy Redesign — Design Spec

Date: 2026-07-04
Branch: `editorial-techy-redesign`

## Goal

Deep evolution of the existing minimal design: keep the structure, data layer
and both themes, but push typography, grid and micro-interactions to a modern
"editorial + techy" look. Restrained motion — subtle, fast, professional.

## Visual system

- **Display font**: Space Grotesk (via google_fonts) for the hero headline and
  section titles. Inter stays for body, JetBrains Mono for labels/meta.
- **Type scale**: hero display ~64–96px desktop / 40–48px mobile (w500, tight
  tracking). New large section titles ~32–44px.
- **Color**: existing OKLCH palette unchanged. `dot` (red-orange) is promoted
  to the system accent: active nav marker, "Open to talk" status dot, list
  markers, hover details. Used sparingly.
- **Grid**: container widens 780px → ~1100px. Sections become two-column on
  desktop: sticky left column with index + title (`01 — Experience`), content
  right. Single column on mobile. Full-width hairline before each section.
- **Background**: near-invisible dot grid behind the hero (both themes).

## Sections

- **Nav**: fixed with blur (as is) + active-section accent dot + 1px accent
  reading-progress bar at the very top.
- **Hero**: kicker with pulsing accent dot + "Open to talk"; huge display
  headline with once-per-load line-by-line mask reveal (staggered); full-width
  bottom meta strip pinned to viewport bottom — meta values left,
  "Download CV ↓" right, hairline above.
- **About**: two-column; lede + prose right; `recent_technologies` as a mono
  list with accent dot markers.
- **Experience**: registry rows — mono period in a narrow left column, role +
  company + description right; row hover = subtle background highlight, `↗`
  shifts.
- **Projects / Writing**: table rows with hairline separators — big title,
  mono meta right, `↗`; hover shifts content 4–6px right + highlight.
- **Skills**: three mono columns (platforms / tooling / services) on desktop.
- **Contact / Footer**: large display invitation (~48–64px), email as big mono
  link with animated underline; giant translucent "VP" behind the footer.

## Motion

- Existing 350ms scroll reveals stay; lists get a light stagger.
- All hovers 200–280ms easeOutCubic.
- Headline reveal runs once on load.

## Out of scope

Cubits, repositories, profile.json schema, favicon, deployment, theme
switching logic.
