# Minimal Redesign — Design Spec

**Date:** 2026-06-11
**Branch:** feature/minimal-redesign (new)
**Goal:** Reproduce the provided minimal HTML/CSS mockup as a full UI replacement in the existing Flutter project, reusing existing profile data.

## Decisions (locked)

- **Scope:** Full UI replacement. Old `modern_*` components and animated backgrounds drop out of the widget tree. Files stay in repo (removed later as a separate step if desired). No parallel theme-switcher.
- **Data:** Reuse existing `ProfileCubit` / `DeveloperProfile`. Real profile data wins over mockup copy. No data migration.
- **Colors:** Match the mockup as closely as possible. Convert OKLCH tokens to sRGB. Minimal deviation allowed only where sRGB cannot represent the value.
- **Theme:** Working light/dark toggle (mockup default = **light**). Fix `app.dart` to read `themeMode` from `ThemeCubit` (currently hardcoded `dark`).
- **Animations:** Full fidelity — reveal-on-scroll (fade+slide), hover effects (shift + color), navbar blur, smooth-scroll to anchors, smooth theme transition.
- **Skills data:** "Recently" = `recentTechnologies`, "Services" = `services[].title`. "Platforms" and "Tooling" are static lists hardcoded in the component (not in the profile model).

## Out of scope (YAGNI)

- Animated gradient/particle backgrounds, glow effects.
- Hero variants F/G/H/I/J and their switcher (mockup keeps only the active simple hero).
- Removing old `modern_*` files (separate cleanup step, optional).
- Extending `DeveloperProfile` with platforms/tooling fields.

## Architecture & file structure

```
lib/
├── app.dart                          # EDIT: themeMode from ThemeCubit (not hardcoded dark); route → MinimalHomePage
├── theme/minimal/
│   ├── minimal_colors.dart           # MinimalColors: light/dark palettes (OKLCH→sRGB), 8 tokens each
│   ├── minimal_theme.dart            # ThemeExtension<MinimalColors> + ThemeData light/dark
│   └── minimal_typography.dart       # Inter (sans) + JetBrains Mono via google_fonts, scale from CSS
└── features/home/presentation/minimal/
    ├── minimal_home_page.dart        # scroll + 780px wrap + section stack + nav overlay
    ├── nav/minimal_nav_bar.dart      # fixed nav, blur, theme toggle, smooth-scroll, mobile collapse
    ├── widgets/
    │   ├── minimal_section.dart      # section wrapper: top hairline + .lbl + RevealOnScroll
    │   ├── reveal_on_scroll.dart     # fade+slide on first appearance (VisibilityDetector)
    │   ├── hover_link.dart           # hover: padding shift / color change (MouseRegion)
    │   └── mono_label.dart           # mono uppercase tracked label (.lbl/.av/.co)
    └── sections/
        ├── minimal_hero.dart
        ├── minimal_about.dart
        ├── minimal_experience.dart
        ├── minimal_skills.dart
        ├── minimal_projects.dart
        ├── minimal_writing.dart
        └── minimal_contact.dart      # contact + footer
```

## Color tokens (OKLCH → sRGB, exact hex computed in code)

| Token  | Light OKLCH            | Dark OKLCH            | Role |
|--------|------------------------|------------------------|------|
| bg     | 98.5% .002 90          | 16% .004 90            | page background |
| fg     | 20% .005 90            | 94% .003 90            | primary text |
| muted  | 56% .006 90            | 64% .006 90            | secondary text |
| faint  | 74% .005 90            | 46% .005 90            | tertiary text |
| hair   | 91% .003 90            | 28% .004 90            | hairline borders |
| accent | 54% .02 90             | 80% .02 90             | accent text |
| dot    | 62% .20 28             | 68% .19 28             | red accent dot |
| navbg  | bg @ 80% alpha         | bg @ 80% alpha         | nav background |

Conversion: OKLCH → OKLab → linear sRGB → gamma-encoded sRGB, clamp to [0,1]. Exposed via `MinimalColors` (ThemeExtension), accessed through `context.minimalColors`.

## Typography (google_fonts)

- **Sans** → `Inter` (replaces `-apple-system` stack)
- **Mono** → `JetBrains Mono`
- Responsive sizes: CSS `clamp()` → adaptive via `MediaQuery`/`ScreenUtil`.
- Key styles: `h1` clamp(38–60) w500 ls -.02em; `.lbl/.av/.co` mono 11 uppercase ls .14em muted; `.lede` clamp(20–26) w500; `.dot` accent red.

## Section mapping

| Section | Component | Data source |
|---|---|---|
| Nav (fixed, blur, toggle) | `MinimalNavBar` | static items + `ThemeCubit` |
| Hero | `MinimalHero` | `subtitle` (av), `fullDescription` (h1), static hmeta, CV link |
| About | `MinimalAbout` | `aboutMe` (lede), `fullDescription` (prose) |
| Experience | `MinimalExperience` | `work[]` (title, workPeriod, companyName, description, links) |
| Skills & Services | `MinimalSkills` | Recently=`recentTechnologies`, Services=`services[].title`, Platforms/Tooling static |
| Projects | `MinimalProjects` | `projects[]` (title, linkName, link, description, tags) |
| Writing | `MinimalWriting` | `blogPosts[]` (title, date, link) |
| Contact + footer | `MinimalContact` | `contactMeText`, `socialLinks[]` |

## Layout rules

- Scroll: `SingleChildScrollView` → centered column, `maxWidth: 780`, h-padding 32 (24 mobile).
- Each section (except hero) wrapped in `MinimalSection`: top hairline, padding ~90px, `.lbl` label, reveal.
- Nav: `Stack` overlay (fixed), `BackdropFilter` blur, items collapse on mobile (<640).
- Hero padding: 200px top desktop, ~120px mobile.

## Interactions

- **Hover** — `MouseRegion` (`hover_link.dart`): padding-left shift, color → dot/fg, border-color change. No-op on touch.
- **Reveal** — `VisibilityDetector` (pkg already present): fade + 16px slide-up on first visibility, run once.
- **Smooth-scroll** — `Scrollable.ensureVisible` to section `GlobalKey` (reuse current `navigateToBlock` pattern), 800ms easeInOut.
- **Theme toggle** — nav button → `ThemeCubit`; default light; `AnimatedTheme` / implicit color animation for the .35s transition.
- **External links** — `url_launcher` (already present) for work/project/writing/social links.

## Testing strategy

- Widget tests per section: renders with a sample `DeveloperProfile`, shows expected text from data, no overflow at narrow + wide widths.
- Theme test: toggling `ThemeCubit` swaps `MinimalColors` light↔dark.
- Color conversion: unit test a couple of known OKLCH→sRGB values against expected hex (sanity, not pixel-perfect).
- Smoke: `MinimalHomePage` builds with loading / error / loaded states.
- `flutter analyze` clean; `flutter build web` succeeds.

## Risks

- OKLCH→sRGB rounding: accepted, minimal deviation per decision.
- `app.dart` theme fix may affect any code assuming permanent dark — audit during implementation.
- google_fonts fetches at runtime; acceptable (already used for Exo2).
