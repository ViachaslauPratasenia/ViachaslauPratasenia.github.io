# Minimal Redesign Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace the current animated Flutter UI with a minimal, typography-driven design matching the provided HTML/CSS mockup, reusing existing `DeveloperProfile` data and adding a working light/dark theme toggle.

**Architecture:** A new `theme/minimal/` package holds the OKLCH→sRGB color system (as a `ThemeExtension`), typography (Inter + JetBrains Mono via google_fonts), and `ThemeData`. A new `features/home/presentation/minimal/` package holds a section-per-widget layout rendered inside a 780px-wide scroll column with a fixed blurred nav overlay. Old `modern_*` widgets stay in the repo but drop out of the tree. `app.dart` is fixed to drive `themeMode` from `ThemeCubit` (default light).

**Tech Stack:** Flutter, flutter_bloc (ThemeCubit/ProfileCubit), google_fonts, url_launcher, visibility_detector, flutter_screenutil.

---

## File Structure

**Create:**
- `lib/theme/minimal/minimal_colors.dart` — `MinimalColors` ThemeExtension (8 tokens, light + dark) + OKLCH→sRGB converter
- `lib/theme/minimal/minimal_typography.dart` — `MinimalTypography` (Inter + JetBrains Mono text styles)
- `lib/theme/minimal/minimal_theme.dart` — `MinimalTheme.light` / `MinimalTheme.dark` `ThemeData` wiring colors + typography + extension
- `lib/features/home/presentation/minimal/widgets/reveal_on_scroll.dart` — fade+slide on first visibility
- `lib/features/home/presentation/minimal/widgets/hover_builder.dart` — `MouseRegion` hover-state builder
- `lib/features/home/presentation/minimal/widgets/mono_label.dart` — mono uppercase tracked label
- `lib/features/home/presentation/minimal/widgets/minimal_section.dart` — section wrapper (top hairline + label + reveal)
- `lib/features/home/presentation/minimal/sections/minimal_hero.dart`
- `lib/features/home/presentation/minimal/sections/minimal_about.dart`
- `lib/features/home/presentation/minimal/sections/minimal_experience.dart`
- `lib/features/home/presentation/minimal/sections/minimal_skills.dart`
- `lib/features/home/presentation/minimal/sections/minimal_projects.dart`
- `lib/features/home/presentation/minimal/sections/minimal_writing.dart`
- `lib/features/home/presentation/minimal/sections/minimal_contact.dart`
- `lib/features/home/presentation/minimal/nav/minimal_nav_bar.dart`
- `lib/features/home/presentation/minimal/minimal_home_page.dart`
- `test/theme/minimal_colors_test.dart`
- `test/widgets/reveal_on_scroll_test.dart`
- `test/widgets/hover_builder_test.dart`
- `test/sections/*_test.dart` (per section)
- `test/minimal_home_page_test.dart`

**Modify:**
- `lib/app.dart` — `themeMode` from `ThemeCubit`, route → `MinimalHomePage`, attach minimal themes

**Test helper:**
- `test/helpers/sample_profile.dart` — a fully-populated `DeveloperProfile` fixture for widget tests

---

## Task 0: Test scaffolding & sample profile fixture

**Files:**
- Create: `test/helpers/sample_profile.dart`

- [ ] **Step 1: Create the sample profile fixture**

`test/helpers/sample_profile.dart`:

```dart
import 'package:personal_website/features/home/data/local/developer_profile.dart';

DeveloperProfile sampleProfile() => DeveloperProfile(
      name: 'Viachaslau Pratasenia',
      email: 'viachaslau.pratasenia@gmail.com',
      subtitle: 'Flutter Developer · Mobile Team Lead',
      fullDescription:
          'I build things with Flutter and lead teams to create amazing products.',
      aboutMe:
          'A highly skilled Flutter developer and Mobile Team Lead with over 7 years in the technology industry.',
      contactMeText:
          'Whether you have a question or just want to say hi, I will try my best to get back to you!',
      recentTechnologies: const ['Flutter', 'Dart', 'JavaScript', 'n8n', 'Stripe', 'RevenueCat'],
      services: [
        Service(title: 'Mobile Apps', description: 'd', icon: 'phone', technologies: const ['Flutter']),
        Service(title: 'Web Dev', description: 'd', icon: 'web', technologies: const ['Flutter Web']),
      ],
      socialLinks: [
        SocialLink(name: 'GitHub', url: 'https://github.com/ViachaslauPratasenia'),
        SocialLink(name: 'LinkedIn', url: 'https://www.linkedin.com/in/viachaslaupratasenia/'),
      ],
      work: [
        WorkExperience(
          title: 'Flutter Developer / Mobile Team Lead',
          companyName: 'Aventus IT — 7VPN',
          companyLink: 'https://aventusit.eu/',
          description: 'Mobile Team Lead on an e-commerce project and developer at 7VPN.',
          workPeriod: '2022 — Present',
          links: [WorkLink(name: '7VPN', url: 'https://7vpn.com/')],
        ),
      ],
      projects: [
        Project(
          title: 'Personal Website',
          image: '',
          linkName: 'Source',
          link: 'https://github.com/ViachaslauPratasenia/ViachaslauPratasenia.github.io',
          description: 'Built with Flutter and hosted on GitHub Pages.',
          tags: const ['Flutter', 'Web', 'GitHub Pages'],
        ),
      ],
      blogPosts: [
        BlogPost(
          title: 'The Easiest Way to Use Environments in Flutter',
          link: 'https://medium.com/@viachaslau.pratasenia/the-easiest-way-to-use-environments-in-flutter-fa7b2cf0ed8d',
          description: 'd',
          tags: const ['Flutter'],
          date: 'Dec 12, 2023',
        ),
      ],
    );
```

- [ ] **Step 2: Commit**

```bash
git add test/helpers/sample_profile.dart
git commit -m "test: add sample DeveloperProfile fixture for minimal redesign"
```

---

## Task 1: OKLCH → sRGB color converter

**Files:**
- Create: `lib/theme/minimal/minimal_colors.dart` (converter only this task)
- Test: `test/theme/minimal_colors_test.dart`

The converter implements OKLCH → OKLab → linear sRGB → gamma sRGB, clamped to [0,1].

- [ ] **Step 1: Write the failing test**

`test/theme/minimal_colors_test.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_website/theme/minimal/minimal_colors.dart';

void main() {
  group('oklchToColor', () {
    test('pure white maps to ~white', () {
      final c = oklchToColor(1.0, 0.0, 0.0);
      expect(c.red, closeTo(255, 1));
      expect(c.green, closeTo(255, 1));
      expect(c.blue, closeTo(255, 1));
    });

    test('pure black maps to black', () {
      final c = oklchToColor(0.0, 0.0, 0.0);
      expect(c.red, 0);
      expect(c.green, 0);
      expect(c.blue, 0);
    });

    test('red dot token (0.62 L, 0.20 C, 28 H) is reddish', () {
      final c = oklchToColor(0.62, 0.20, 28);
      expect(c.red, greaterThan(c.green));
      expect(c.red, greaterThan(c.blue));
      expect(c.red, greaterThan(150));
    });

    test('alpha is applied', () {
      final c = oklchToColor(0.5, 0.0, 0.0, 0.5);
      expect(c.opacity, closeTo(0.5, 0.01));
    });
  });
}
```

- [ ] **Step 2: Run test to verify it fails**

Run: `flutter test test/theme/minimal_colors_test.dart`
Expected: FAIL — `oklchToColor` not defined / `minimal_colors.dart` missing.

- [ ] **Step 3: Implement the converter**

`lib/theme/minimal/minimal_colors.dart`:

```dart
import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Converts an OKLCH color to a Flutter [Color] (sRGB).
/// [l] 0..1 lightness, [c] chroma, [h] hue in degrees, [alpha] 0..1.
Color oklchToColor(double l, double c, double h, [double alpha = 1.0]) {
  final hRad = h * math.pi / 180.0;
  final a = c * math.cos(hRad);
  final b = c * math.sin(hRad);

  // OKLab -> LMS
  final l_ = l + 0.3963377774 * a + 0.2158037573 * b;
  final m_ = l - 0.1055613458 * a - 0.0638541728 * b;
  final s_ = l - 0.0894841775 * a - 1.2914855480 * b;

  final lCubed = l_ * l_ * l_;
  final mCubed = m_ * m_ * m_;
  final sCubed = s_ * s_ * s_;

  // LMS -> linear sRGB
  double r = 4.0767416621 * lCubed - 3.3077115913 * mCubed + 0.2309699292 * sCubed;
  double g = -1.2684380046 * lCubed + 2.6097574011 * mCubed - 0.3413193965 * sCubed;
  double bl = -0.0041960863 * lCubed - 0.7034186147 * mCubed + 1.7076147010 * sCubed;

  int enc(double v) {
    // linear -> gamma sRGB
    final s = v <= 0.0031308 ? 12.92 * v : 1.055 * math.pow(v, 1 / 2.4) - 0.055;
    return (s.clamp(0.0, 1.0) * 255.0).round();
  }

  return Color.fromARGB((alpha * 255).round(), enc(r), enc(g), enc(bl));
}
```

- [ ] **Step 4: Run test to verify it passes**

Run: `flutter test test/theme/minimal_colors_test.dart`
Expected: PASS (4 tests).

- [ ] **Step 5: Commit**

```bash
git add lib/theme/minimal/minimal_colors.dart test/theme/minimal_colors_test.dart
git commit -m "feat: add OKLCH to sRGB color converter"
```

---

## Task 2: MinimalColors ThemeExtension (light + dark palettes)

**Files:**
- Modify: `lib/theme/minimal/minimal_colors.dart`
- Test: `test/theme/minimal_colors_test.dart`

- [ ] **Step 1: Add the failing test**

Append to `test/theme/minimal_colors_test.dart` inside `main()`:

```dart
  group('MinimalColors palettes', () {
    test('light bg is lighter than dark bg', () {
      final light = MinimalColors.light;
      final dark = MinimalColors.dark;
      expect(light.bg.computeLuminance(), greaterThan(dark.bg.computeLuminance()));
    });

    test('light fg is darker than light bg (readable)', () {
      final light = MinimalColors.light;
      expect(light.fg.computeLuminance(), lessThan(light.bg.computeLuminance()));
    });

    test('navbg is semi-transparent bg', () {
      expect(MinimalColors.light.navbg.opacity, closeTo(0.8, 0.05));
    });

    test('lerp returns a MinimalColors', () {
      final mixed = MinimalColors.light.lerp(MinimalColors.dark, 0.5);
      expect(mixed, isA<MinimalColors>());
    });

    test('dot token is red-ish in both themes', () {
      expect(MinimalColors.light.dot.red, greaterThan(MinimalColors.light.dot.blue));
      expect(MinimalColors.dark.dot.red, greaterThan(MinimalColors.dark.dot.blue));
    });
  });
```

- [ ] **Step 2: Run test to verify it fails**

Run: `flutter test test/theme/minimal_colors_test.dart`
Expected: FAIL — `MinimalColors` not defined.

- [ ] **Step 3: Implement MinimalColors**

Append to `lib/theme/minimal/minimal_colors.dart`:

```dart
@immutable
class MinimalColors extends ThemeExtension<MinimalColors> {
  final Color bg;
  final Color fg;
  final Color muted;
  final Color faint;
  final Color hair;
  final Color accent;
  final Color dot;
  final Color navbg;

  const MinimalColors({
    required this.bg,
    required this.fg,
    required this.muted,
    required this.faint,
    required this.hair,
    required this.accent,
    required this.dot,
    required this.navbg,
  });

  static final MinimalColors light = MinimalColors(
    bg: oklchToColor(0.985, 0.002, 90),
    fg: oklchToColor(0.20, 0.005, 90),
    muted: oklchToColor(0.56, 0.006, 90),
    faint: oklchToColor(0.74, 0.005, 90),
    hair: oklchToColor(0.91, 0.003, 90),
    accent: oklchToColor(0.54, 0.02, 90),
    dot: oklchToColor(0.62, 0.20, 28),
    navbg: oklchToColor(0.985, 0.002, 90, 0.8),
  );

  static final MinimalColors dark = MinimalColors(
    bg: oklchToColor(0.16, 0.004, 90),
    fg: oklchToColor(0.94, 0.003, 90),
    muted: oklchToColor(0.64, 0.006, 90),
    faint: oklchToColor(0.46, 0.005, 90),
    hair: oklchToColor(0.28, 0.004, 90),
    accent: oklchToColor(0.80, 0.02, 90),
    dot: oklchToColor(0.68, 0.19, 28),
    navbg: oklchToColor(0.16, 0.004, 90, 0.8),
  );

  @override
  MinimalColors copyWith({
    Color? bg,
    Color? fg,
    Color? muted,
    Color? faint,
    Color? hair,
    Color? accent,
    Color? dot,
    Color? navbg,
  }) {
    return MinimalColors(
      bg: bg ?? this.bg,
      fg: fg ?? this.fg,
      muted: muted ?? this.muted,
      faint: faint ?? this.faint,
      hair: hair ?? this.hair,
      accent: accent ?? this.accent,
      dot: dot ?? this.dot,
      navbg: navbg ?? this.navbg,
    );
  }

  @override
  MinimalColors lerp(ThemeExtension<MinimalColors>? other, double t) {
    if (other is! MinimalColors) return this;
    return MinimalColors(
      bg: Color.lerp(bg, other.bg, t)!,
      fg: Color.lerp(fg, other.fg, t)!,
      muted: Color.lerp(muted, other.muted, t)!,
      faint: Color.lerp(faint, other.faint, t)!,
      hair: Color.lerp(hair, other.hair, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      dot: Color.lerp(dot, other.dot, t)!,
      navbg: Color.lerp(navbg, other.navbg, t)!,
    );
  }
}

/// Convenience accessor for [MinimalColors] from the current theme.
extension MinimalColorsContext on BuildContext {
  MinimalColors get minimal =>
      Theme.of(this).extension<MinimalColors>() ?? MinimalColors.light;
}
```

- [ ] **Step 4: Run test to verify it passes**

Run: `flutter test test/theme/minimal_colors_test.dart`
Expected: PASS (9 tests).

- [ ] **Step 5: Commit**

```bash
git add lib/theme/minimal/minimal_colors.dart test/theme/minimal_colors_test.dart
git commit -m "feat: add MinimalColors light/dark theme extension"
```

---

## Task 3: MinimalTypography

**Files:**
- Create: `lib/theme/minimal/minimal_typography.dart`
- Test: `test/theme/minimal_typography_test.dart`

- [ ] **Step 1: Write the failing test**

`test/theme/minimal_typography_test.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_website/theme/minimal/minimal_typography.dart';

void main() {
  test('mono style has wide letter spacing and uppercase tracking', () {
    final style = MinimalTypography.monoLabel(const Color(0xFF000000));
    expect(style.letterSpacing, greaterThan(0));
    expect(style.color, const Color(0xFF000000));
  });

  test('h1 style is large and not bold-900', () {
    final style = MinimalTypography.h1(const Color(0xFF000000));
    expect(style.fontSize, greaterThanOrEqualTo(38));
    expect(style.fontWeight, FontWeight.w500);
  });

  test('lede style is medium weight', () {
    final style = MinimalTypography.lede(const Color(0xFF000000));
    expect(style.fontWeight, FontWeight.w500);
  });
}
```

- [ ] **Step 2: Run test to verify it fails**

Run: `flutter test test/theme/minimal_typography_test.dart`
Expected: FAIL — `MinimalTypography` not defined.

- [ ] **Step 3: Implement typography**

`lib/theme/minimal/minimal_typography.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Typography for the minimal design.
/// Sans = Inter, Mono = JetBrains Mono.
abstract class MinimalTypography {
  static TextStyle sans(Color color) => GoogleFonts.inter(color: color);
  static TextStyle mono(Color color) => GoogleFonts.jetBrainsMono(color: color);

  /// Hero headline. Caller passes a responsive [size] (clamp 38..60).
  static TextStyle h1(Color color, {double size = 48}) => GoogleFonts.inter(
        color: color,
        fontSize: size,
        height: 1.18,
        fontWeight: FontWeight.w500,
        letterSpacing: -size * 0.02,
      );

  /// Mono uppercase tracked label (.lbl / .av / .co).
  static TextStyle monoLabel(Color color, {double size = 11}) =>
      GoogleFonts.jetBrainsMono(
        color: color,
        fontSize: size,
        height: 1.4,
        letterSpacing: size * 0.14,
        fontWeight: FontWeight.w400,
      );

  /// Lede paragraph (.lede), clamp 20..26.
  static TextStyle lede(Color color, {double size = 23}) => GoogleFonts.inter(
        color: color,
        fontSize: size,
        height: 1.4,
        fontWeight: FontWeight.w500,
        letterSpacing: -size * 0.02,
      );

  /// Body prose (.prose p).
  static TextStyle prose(Color color) => GoogleFonts.inter(
        color: color,
        fontSize: 15.5,
        height: 1.75,
        fontWeight: FontWeight.w400,
      );

  /// Section / item heading (h3).
  static TextStyle heading(Color color, {double size = 18}) => GoogleFonts.inter(
        color: color,
        fontSize: size,
        height: 1.2,
        fontWeight: FontWeight.w500,
        letterSpacing: -size * 0.01,
      );
}
```

- [ ] **Step 4: Run test to verify it passes**

Run: `flutter test test/theme/minimal_typography_test.dart`
Expected: PASS (3 tests).

- [ ] **Step 5: Commit**

```bash
git add lib/theme/minimal/minimal_typography.dart test/theme/minimal_typography_test.dart
git commit -m "feat: add MinimalTypography (Inter + JetBrains Mono)"
```

---

## Task 4: MinimalTheme (ThemeData wiring)

**Files:**
- Create: `lib/theme/minimal/minimal_theme.dart`
- Test: `test/theme/minimal_theme_test.dart`

- [ ] **Step 1: Write the failing test**

`test/theme/minimal_theme_test.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_website/theme/minimal/minimal_colors.dart';
import 'package:personal_website/theme/minimal/minimal_theme.dart';

void main() {
  test('light theme carries light MinimalColors extension', () {
    final ext = MinimalTheme.light.extension<MinimalColors>();
    expect(ext, isNotNull);
    expect(ext!.bg, MinimalColors.light.bg);
    expect(MinimalTheme.light.scaffoldBackgroundColor, MinimalColors.light.bg);
  });

  test('dark theme carries dark MinimalColors extension', () {
    final ext = MinimalTheme.dark.extension<MinimalColors>();
    expect(ext!.bg, MinimalColors.dark.bg);
  });
}
```

- [ ] **Step 2: Run test to verify it fails**

Run: `flutter test test/theme/minimal_theme_test.dart`
Expected: FAIL — `MinimalTheme` not defined.

- [ ] **Step 3: Implement theme wiring**

`lib/theme/minimal/minimal_theme.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:personal_website/theme/minimal/minimal_colors.dart';
import 'package:personal_website/theme/minimal/minimal_typography.dart';

abstract class MinimalTheme {
  static ThemeData _build(MinimalColors colors, Brightness brightness) {
    return ThemeData(
      brightness: brightness,
      scaffoldBackgroundColor: colors.bg,
      extensions: [colors],
      textTheme: TextTheme(
        bodyMedium: MinimalTypography.prose(colors.muted),
        titleLarge: MinimalTypography.heading(colors.fg),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: colors.dot,
        brightness: brightness,
        surface: colors.bg,
      ),
      useMaterial3: true,
    );
  }

  static ThemeData light = _build(MinimalColors.light, Brightness.light);
  static ThemeData dark = _build(MinimalColors.dark, Brightness.dark);
}
```

- [ ] **Step 4: Run test to verify it passes**

Run: `flutter test test/theme/minimal_theme_test.dart`
Expected: PASS (2 tests).

- [ ] **Step 5: Commit**

```bash
git add lib/theme/minimal/minimal_theme.dart test/theme/minimal_theme_test.dart
git commit -m "feat: add MinimalTheme light/dark ThemeData"
```

---

## Task 5: RevealOnScroll widget

**Files:**
- Create: `lib/features/home/presentation/minimal/widgets/reveal_on_scroll.dart`
- Test: `test/widgets/reveal_on_scroll_test.dart`

Uses `visibility_detector` (already in pubspec). Fades + slides child up 16px on first visibility, runs once.

- [ ] **Step 1: Write the failing test**

`test/widgets/reveal_on_scroll_test.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/reveal_on_scroll.dart';
import 'package:visibility_detector/visibility_detector.dart';

void main() {
  setUp(() => VisibilityDetectorController.instance.updateInterval = Duration.zero);

  testWidgets('renders its child', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(body: RevealOnScroll(child: Text('hello'))),
    ));
    expect(find.text('hello'), findsOneWidget);
  });

  testWidgets('child is wrapped in an Opacity that animates to visible', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(body: RevealOnScroll(child: Text('hi'))),
    ));
    await tester.pump();
    await tester.pump(const Duration(seconds: 2));
    final opacity = tester.widget<Opacity>(find.byType(Opacity).first);
    expect(opacity.opacity, 1.0);
  });
}
```

- [ ] **Step 2: Run test to verify it fails**

Run: `flutter test test/widgets/reveal_on_scroll_test.dart`
Expected: FAIL — `RevealOnScroll` not defined.

- [ ] **Step 3: Implement RevealOnScroll**

`lib/features/home/presentation/minimal/widgets/reveal_on_scroll.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// Fades + slides [child] up by 16px the first time it becomes >10% visible.
class RevealOnScroll extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const RevealOnScroll({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1000),
  });

  @override
  State<RevealOnScroll> createState() => _RevealOnScrollState();
}

class _RevealOnScrollState extends State<RevealOnScroll> {
  bool _shown = false;

  void _onVisible(VisibilityInfo info) {
    if (!_shown && info.visibleFraction > 0.1 && mounted) {
      setState(() => _shown = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ValueKey('reveal-${identityHashCode(widget.child)}'),
      onVisibilityChanged: _onVisible,
      child: AnimatedSlide(
        offset: _shown ? Offset.zero : const Offset(0, 0.06),
        duration: widget.duration,
        curve: Curves.easeOutCubic,
        child: AnimatedOpacity(
          opacity: _shown ? 1.0 : 0.0,
          duration: widget.duration,
          curve: Curves.easeOutCubic,
          child: widget.child,
        ),
      ),
    );
  }
}
```

- [ ] **Step 4: Run test to verify it passes**

Run: `flutter test test/widgets/reveal_on_scroll_test.dart`
Expected: PASS (2 tests).

- [ ] **Step 5: Commit**

```bash
git add lib/features/home/presentation/minimal/widgets/reveal_on_scroll.dart test/widgets/reveal_on_scroll_test.dart
git commit -m "feat: add RevealOnScroll fade+slide widget"
```

---

## Task 6: HoverBuilder widget

**Files:**
- Create: `lib/features/home/presentation/minimal/widgets/hover_builder.dart`
- Test: `test/widgets/hover_builder_test.dart`

A builder that exposes a `hovering` bool via `MouseRegion`, so sections can shift padding / change color on hover.

- [ ] **Step 1: Write the failing test**

`test/widgets/hover_builder_test.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/hover_builder.dart';

void main() {
  testWidgets('exposes hovering=false initially, true on hover', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: HoverBuilder(
          builder: (context, hovering) => Text(hovering ? 'IN' : 'OUT'),
        ),
      ),
    ));
    expect(find.text('OUT'), findsOneWidget);

    final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
    await gesture.addPointer(location: Offset.zero);
    addTearDown(gesture.removePointer);
    await gesture.moveTo(tester.getCenter(find.byType(HoverBuilder)));
    await tester.pump();
    expect(find.text('IN'), findsOneWidget);
  });
}
```

- [ ] **Step 2: Run test to verify it fails**

Run: `flutter test test/widgets/hover_builder_test.dart`
Expected: FAIL — `HoverBuilder` not defined.

- [ ] **Step 3: Implement HoverBuilder**

`lib/features/home/presentation/minimal/widgets/hover_builder.dart`:

```dart
import 'package:flutter/material.dart';

typedef HoverWidgetBuilder = Widget Function(BuildContext context, bool hovering);

/// Rebuilds [builder] with the current mouse-hover state.
class HoverBuilder extends StatefulWidget {
  final HoverWidgetBuilder builder;
  final MouseCursor cursor;

  const HoverBuilder({
    super.key,
    required this.builder,
    this.cursor = SystemMouseCursors.click,
  });

  @override
  State<HoverBuilder> createState() => _HoverBuilderState();
}

class _HoverBuilderState extends State<HoverBuilder> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.cursor,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: widget.builder(context, _hovering),
    );
  }
}
```

- [ ] **Step 4: Run test to verify it passes**

Run: `flutter test test/widgets/hover_builder_test.dart`
Expected: PASS.

- [ ] **Step 5: Commit**

```bash
git add lib/features/home/presentation/minimal/widgets/hover_builder.dart test/widgets/hover_builder_test.dart
git commit -m "feat: add HoverBuilder hover-state widget"
```

---

## Task 7: MonoLabel + MinimalSection wrappers

**Files:**
- Create: `lib/features/home/presentation/minimal/widgets/mono_label.dart`
- Create: `lib/features/home/presentation/minimal/widgets/minimal_section.dart`
- Test: `test/widgets/minimal_section_test.dart`

`MonoLabel` = uppercase mono tracked text. `MinimalSection` = top hairline divider + optional `.lbl` (label with leading dot) + `RevealOnScroll`-wrapped content, constrained to 780px with horizontal padding.

- [ ] **Step 1: Write the failing test**

`test/widgets/minimal_section_test.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_website/theme/minimal/minimal_theme.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/mono_label.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/minimal_section.dart';
import 'package:visibility_detector/visibility_detector.dart';

void main() {
  setUp(() => VisibilityDetectorController.instance.updateInterval = Duration.zero);

  testWidgets('MonoLabel uppercases its text', (tester) async {
    await tester.pumpWidget(MaterialApp(
      theme: MinimalTheme.light,
      home: const Scaffold(body: MonoLabel('about')),
    ));
    expect(find.text('ABOUT'), findsOneWidget);
  });

  testWidgets('MinimalSection shows its label and child', (tester) async {
    await tester.pumpWidget(MaterialApp(
      theme: MinimalTheme.light,
      home: const Scaffold(
        body: SingleChildScrollView(
          child: MinimalSection(label: 'Work', child: Text('content')),
        ),
      ),
    ));
    expect(find.text('WORK'), findsOneWidget);
    expect(find.text('content'), findsOneWidget);
  });
}
```

- [ ] **Step 2: Run test to verify it fails**

Run: `flutter test test/widgets/minimal_section_test.dart`
Expected: FAIL — `MonoLabel` / `MinimalSection` not defined.

- [ ] **Step 3: Implement MonoLabel**

`lib/features/home/presentation/minimal/widgets/mono_label.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:personal_website/theme/minimal/minimal_colors.dart';
import 'package:personal_website/theme/minimal/minimal_typography.dart';

/// Uppercase, mono, letter-tracked label (.lbl / .av / .co / nav items).
class MonoLabel extends StatelessWidget {
  final String text;
  final Color? color;
  final double size;
  final bool showDot;

  const MonoLabel(
    this.text, {
    super.key,
    this.color,
    this.size = 11,
    this.showDot = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.minimal;
    final style = MinimalTypography.monoLabel(color ?? colors.muted, size: size);
    if (!showDot) return Text(text.toUpperCase(), style: style);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 5,
          height: 5,
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(color: colors.dot, shape: BoxShape.circle),
        ),
        Text(text.toUpperCase(), style: style),
      ],
    );
  }
}
```

- [ ] **Step 4: Implement MinimalSection**

`lib/features/home/presentation/minimal/widgets/minimal_section.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:personal_website/theme/minimal/minimal_colors.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/mono_label.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/reveal_on_scroll.dart';

/// Standard content section: top hairline, label with dot, revealed content.
/// Constrained to 780px wide with responsive horizontal padding.
class MinimalSection extends StatelessWidget {
  final String? label;
  final Widget child;

  const MinimalSection({super.key, this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    final colors = context.minimal;
    final narrow = MediaQuery.sizeOf(context).width < 600;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: colors.hair)),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 780),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: narrow ? 24 : 32,
              vertical: narrow ? 56 : 90,
            ),
            child: RevealOnScroll(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (label != null) ...[
                    MonoLabel(label!, color: colors.faint, showDot: true),
                    const SizedBox(height: 40),
                  ],
                  child,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

- [ ] **Step 5: Run test to verify it passes**

Run: `flutter test test/widgets/minimal_section_test.dart`
Expected: PASS (2 tests).

- [ ] **Step 6: Commit**

```bash
git add lib/features/home/presentation/minimal/widgets/mono_label.dart lib/features/home/presentation/minimal/widgets/minimal_section.dart test/widgets/minimal_section_test.dart
git commit -m "feat: add MonoLabel and MinimalSection wrappers"
```

---

## Task 8: Section widgets — Hero, About, Skills, Contact (data-driven)

These four sections share a pattern: take a `DeveloperProfile`, render text. Hero is standalone (no `MinimalSection` wrapper). About/Skills/Contact use `MinimalSection`. Contact includes the footer.

**Files:**
- Create: `lib/features/home/presentation/minimal/sections/minimal_hero.dart`
- Create: `lib/features/home/presentation/minimal/sections/minimal_about.dart`
- Create: `lib/features/home/presentation/minimal/sections/minimal_skills.dart`
- Create: `lib/features/home/presentation/minimal/sections/minimal_contact.dart`
- Test: `test/sections/data_sections_test.dart`

- [ ] **Step 1: Write the failing test**

`test/sections/data_sections_test.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_website/theme/minimal/minimal_theme.dart';
import 'package:personal_website/features/home/presentation/minimal/sections/minimal_hero.dart';
import 'package:personal_website/features/home/presentation/minimal/sections/minimal_about.dart';
import 'package:personal_website/features/home/presentation/minimal/sections/minimal_skills.dart';
import 'package:personal_website/features/home/presentation/minimal/sections/minimal_contact.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../helpers/sample_profile.dart';

Widget _host(Widget child) => MaterialApp(
      theme: MinimalTheme.light,
      home: Scaffold(body: SingleChildScrollView(child: child)),
    );

void main() {
  setUp(() => VisibilityDetectorController.instance.updateInterval = Duration.zero);
  final p = sampleProfile();

  testWidgets('Hero shows subtitle and headline', (tester) async {
    await tester.pumpWidget(_host(MinimalHero(profile: p)));
    expect(find.textContaining('Mobile Team Lead'), findsWidgets);
    expect(find.textContaining('build things with Flutter'), findsOneWidget);
  });

  testWidgets('About shows lede from aboutMe', (tester) async {
    await tester.pumpWidget(_host(MinimalAbout(profile: p)));
    expect(find.textContaining('highly skilled Flutter developer'), findsOneWidget);
  });

  testWidgets('Skills shows a recent technology and a service', (tester) async {
    await tester.pumpWidget(_host(MinimalSkills(profile: p)));
    expect(find.textContaining('Flutter'), findsWidgets);
    expect(find.textContaining('Mobile Apps'), findsWidgets);
  });

  testWidgets('Contact shows social link names', (tester) async {
    await tester.pumpWidget(_host(MinimalContact(profile: p)));
    expect(find.text('GitHub'), findsOneWidget);
    expect(find.text('LinkedIn'), findsOneWidget);
  });
}
```

- [ ] **Step 2: Run test to verify it fails**

Run: `flutter test test/sections/data_sections_test.dart`
Expected: FAIL — section widgets not defined.

- [ ] **Step 3: Implement MinimalHero**

`lib/features/home/presentation/minimal/sections/minimal_hero.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/theme/minimal/minimal_colors.dart';
import 'package:personal_website/theme/minimal/minimal_typography.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/mono_label.dart';

/// Hero: av kicker, headline, meta row, CV link. Not wrapped in MinimalSection.
class MinimalHero extends StatelessWidget {
  final DeveloperProfile profile;
  final VoidCallback? onDownloadCv;

  const MinimalHero({super.key, required this.profile, this.onDownloadCv});

  @override
  Widget build(BuildContext context) {
    final colors = context.minimal;
    final width = MediaQuery.sizeOf(context).width;
    final narrow = width < 640;
    final h1Size = width.clamp(360, 1000) / 1000 * 22 + 38; // ~38..60

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 780),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              narrow ? 24 : 32, narrow ? 120 : 200, narrow ? 24 : 32, narrow ? 64 : 130),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(width: 28, height: 1, color: colors.fg),
                  const SizedBox(width: 12),
                  MonoLabel(profile.subtitle, color: colors.muted, size: 11),
                ],
              ),
              const SizedBox(height: 40),
              Text(profile.fullDescription, style: MinimalTypography.h1(colors.fg, size: h1Size)),
              const SizedBox(height: 44),
              Wrap(
                spacing: 40,
                runSpacing: 12,
                children: [
                  _meta(context, '7+', 'years'),
                  _meta(context, 'Flutter', '/ Dart'),
                  _meta(context, 'iOS · Android · Web · Desktop', ''),
                ],
              ),
              const SizedBox(height: 34),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: onDownloadCv,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: colors.fg)),
                    ),
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MonoLabel('Download CV', color: colors.fg, size: 12),
                        const SizedBox(width: 9),
                        Text('↓', style: MinimalTypography.mono(colors.fg)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _meta(BuildContext context, String bold, String rest) {
    final colors = context.minimal;
    return RichText(
      text: TextSpan(
        style: MinimalTypography.mono(colors.muted).copyWith(fontSize: 12),
        children: [
          TextSpan(text: bold, style: TextStyle(color: colors.fg, fontWeight: FontWeight.w500)),
          if (rest.isNotEmpty) TextSpan(text: ' $rest'),
        ],
      ),
    );
  }
}
```

- [ ] **Step 4: Implement MinimalAbout**

`lib/features/home/presentation/minimal/sections/minimal_about.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/theme/minimal/minimal_colors.dart';
import 'package:personal_website/theme/minimal/minimal_typography.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/minimal_section.dart';

class MinimalAbout extends StatelessWidget {
  final DeveloperProfile profile;

  const MinimalAbout({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final colors = context.minimal;
    final paragraphs = profile.fullDescription.split('\n').where((s) => s.trim().isNotEmpty);
    return MinimalSection(
      label: 'About',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(profile.aboutMe, style: MinimalTypography.lede(colors.fg)),
          const SizedBox(height: 28),
          for (final para in paragraphs) ...[
            Text(para.trim(), style: MinimalTypography.prose(colors.muted)),
            const SizedBox(height: 16),
          ],
        ],
      ),
    );
  }
}
```

- [ ] **Step 5: Implement MinimalSkills**

`lib/features/home/presentation/minimal/sections/minimal_skills.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/theme/minimal/minimal_colors.dart';
import 'package:personal_website/theme/minimal/minimal_typography.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/minimal_section.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/mono_label.dart';

class MinimalSkills extends StatelessWidget {
  final DeveloperProfile profile;

  const MinimalSkills({super.key, required this.profile});

  // Static lists per spec (not in profile model).
  static const _platforms = ['iOS', 'Android', 'Web', 'Windows', 'macOS', 'Linux'];
  static const _tooling = ['Xcode', 'Android Studio', 'Figma', 'Firebase', 'GCP'];

  @override
  Widget build(BuildContext context) {
    final services = profile.services.map((s) => s.title).toList();
    return MinimalSection(
      label: 'Skills & Services',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _group(context, 'Recently', profile.recentTechnologies),
          _group(context, 'Platforms', _platforms),
          _group(context, 'Services', services),
          _group(context, 'Tooling', _tooling, last: true),
        ],
      ),
    );
  }

  Widget _group(BuildContext context, String title, List<String> items, {bool last = false}) {
    final colors = context.minimal;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 22),
      decoration: BoxDecoration(
        border: last ? null : Border(bottom: BorderSide(color: colors.hair)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MonoLabel(title, color: colors.faint, size: 10.5),
          const SizedBox(height: 12),
          RichText(
            text: TextSpan(
              style: MinimalTypography.heading(colors.fg, size: 16),
              children: [
                for (var i = 0; i < items.length; i++) ...[
                  TextSpan(text: items[i]),
                  if (i < items.length - 1)
                    TextSpan(text: '  ·  ', style: TextStyle(color: colors.faint)),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```

- [ ] **Step 6: Implement MinimalContact (+ footer)**

`lib/features/home/presentation/minimal/sections/minimal_contact.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/theme/minimal/minimal_colors.dart';
import 'package:personal_website/theme/minimal/minimal_typography.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/minimal_section.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/hover_builder.dart';

class MinimalContact extends StatelessWidget {
  final DeveloperProfile profile;

  const MinimalContact({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final colors = context.minimal;
    return Column(
      children: [
        MinimalSection(
          label: 'Contact',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(profile.contactMeText, style: MinimalTypography.heading(colors.fg, size: 32)),
              const SizedBox(height: 30),
              Wrap(
                spacing: 26,
                runSpacing: 14,
                children: [
                  for (final link in profile.socialLinks) _social(context, link),
                ],
              ),
            ],
          ),
        ),
        _footer(context),
      ],
    );
  }

  Widget _social(BuildContext context, SocialLink link) {
    final colors = context.minimal;
    return HoverBuilder(
      builder: (context, hovering) => GestureDetector(
        onTap: () => launchUrlString(link.url),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: hovering ? colors.fg : colors.hair),
            ),
          ),
          padding: const EdgeInsets.only(bottom: 2),
          child: Text(link.name, style: MinimalTypography.mono(colors.fg).copyWith(fontSize: 12)),
        ),
      ),
    );
  }

  Widget _footer(BuildContext context) {
    final colors = context.minimal;
    final narrow = MediaQuery.sizeOf(context).width < 600;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(border: Border(top: BorderSide(color: colors.hair))),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 780),
          child: Padding(
            padding: EdgeInsets.fromLTRB(narrow ? 24 : 32, 34, narrow ? 24 : 32, 60),
            child: Wrap(
              spacing: 16,
              runSpacing: 10,
              alignment: WrapAlignment.spaceBetween,
              children: [
                Text('© 2026 Viachaslau Pratasenia',
                    style: MinimalTypography.mono(colors.faint).copyWith(fontSize: 11)),
                Text('Flutter Developer / Mobile Team Lead',
                    style: MinimalTypography.mono(colors.faint).copyWith(fontSize: 11)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

- [ ] **Step 7: Run test to verify it passes**

Run: `flutter test test/sections/data_sections_test.dart`
Expected: PASS (4 tests).

- [ ] **Step 8: Commit**

```bash
git add lib/features/home/presentation/minimal/sections/minimal_hero.dart lib/features/home/presentation/minimal/sections/minimal_about.dart lib/features/home/presentation/minimal/sections/minimal_skills.dart lib/features/home/presentation/minimal/sections/minimal_contact.dart test/sections/data_sections_test.dart
git commit -m "feat: add Hero, About, Skills, Contact minimal sections"
```

---

## Task 9: Section widgets — Experience, Projects, Writing (list-driven, hover + links)

**Files:**
- Create: `lib/features/home/presentation/minimal/sections/minimal_experience.dart`
- Create: `lib/features/home/presentation/minimal/sections/minimal_projects.dart`
- Create: `lib/features/home/presentation/minimal/sections/minimal_writing.dart`
- Test: `test/sections/list_sections_test.dart`

- [ ] **Step 1: Write the failing test**

`test/sections/list_sections_test.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_website/theme/minimal/minimal_theme.dart';
import 'package:personal_website/features/home/presentation/minimal/sections/minimal_experience.dart';
import 'package:personal_website/features/home/presentation/minimal/sections/minimal_projects.dart';
import 'package:personal_website/features/home/presentation/minimal/sections/minimal_writing.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../helpers/sample_profile.dart';

Widget _host(Widget child) => MaterialApp(
      theme: MinimalTheme.light,
      home: Scaffold(body: SingleChildScrollView(child: child)),
    );

void main() {
  setUp(() => VisibilityDetectorController.instance.updateInterval = Duration.zero);
  final p = sampleProfile();

  testWidgets('Experience shows job title, company and period', (tester) async {
    await tester.pumpWidget(_host(MinimalExperience(profile: p)));
    expect(find.textContaining('Mobile Team Lead'), findsWidgets);
    expect(find.textContaining('Aventus IT'), findsOneWidget);
    expect(find.textContaining('2022'), findsOneWidget);
  });

  testWidgets('Projects shows project title and tags', (tester) async {
    await tester.pumpWidget(_host(MinimalProjects(profile: p)));
    expect(find.text('Personal Website'), findsOneWidget);
    expect(find.textContaining('GitHub Pages'), findsOneWidget);
  });

  testWidgets('Writing shows post title and date', (tester) async {
    await tester.pumpWidget(_host(MinimalWriting(profile: p)));
    expect(find.textContaining('Environments in Flutter'), findsOneWidget);
    expect(find.text('Dec 12, 2023'), findsOneWidget);
  });
}
```

- [ ] **Step 2: Run test to verify it fails**

Run: `flutter test test/sections/list_sections_test.dart`
Expected: FAIL — section widgets not defined.

- [ ] **Step 3: Implement MinimalExperience**

`lib/features/home/presentation/minimal/sections/minimal_experience.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/theme/minimal/minimal_colors.dart';
import 'package:personal_website/theme/minimal/minimal_typography.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/minimal_section.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/mono_label.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/hover_builder.dart';

class MinimalExperience extends StatelessWidget {
  final DeveloperProfile profile;

  const MinimalExperience({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final colors = context.minimal;
    final jobs = profile.work;
    return MinimalSection(
      label: 'Experience',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < jobs.length; i++)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                border: i == jobs.length - 1
                    ? null
                    : Border(bottom: BorderSide(color: colors.hair)),
              ),
              child: _job(context, jobs[i]),
            ),
        ],
      ),
    );
  }

  Widget _job(BuildContext context, WorkExperience job) {
    final colors = context.minimal;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Text(job.title, style: MinimalTypography.heading(colors.fg))),
            const SizedBox(width: 16),
            Text(job.workPeriod,
                style: MinimalTypography.mono(colors.faint).copyWith(fontSize: 11.5)),
          ],
        ),
        const SizedBox(height: 6),
        MonoLabel(job.companyName, color: colors.muted, size: 11),
        const SizedBox(height: 12),
        Text(job.description, style: MinimalTypography.prose(colors.muted).copyWith(fontSize: 14.5)),
        if (job.links.isNotEmpty) ...[
          const SizedBox(height: 14),
          Wrap(
            spacing: 18,
            runSpacing: 8,
            children: [for (final l in job.links) _link(context, l)],
          ),
        ],
      ],
    );
  }

  Widget _link(BuildContext context, WorkLink link) {
    final colors = context.minimal;
    return HoverBuilder(
      builder: (context, hovering) => GestureDetector(
        onTap: () => launchUrlString(link.url),
        child: Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: hovering ? colors.fg : colors.hair)),
          ),
          padding: const EdgeInsets.only(bottom: 2),
          child: Text(link.name, style: MinimalTypography.mono(colors.fg).copyWith(fontSize: 11)),
        ),
      ),
    );
  }
}
```

- [ ] **Step 4: Implement MinimalProjects**

`lib/features/home/presentation/minimal/sections/minimal_projects.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/theme/minimal/minimal_colors.dart';
import 'package:personal_website/theme/minimal/minimal_typography.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/minimal_section.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/hover_builder.dart';

class MinimalProjects extends StatelessWidget {
  final DeveloperProfile profile;

  const MinimalProjects({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final colors = context.minimal;
    final items = profile.projects;
    return MinimalSection(
      label: 'Projects',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < items.length; i++)
            _project(context, items[i], last: i == items.length - 1),
        ],
      ),
    );
  }

  Widget _project(BuildContext context, Project project, {required bool last}) {
    final colors = context.minimal;
    return HoverBuilder(
      builder: (context, hovering) => GestureDetector(
        onTap: () => launchUrlString(project.link),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          padding: EdgeInsets.only(top: 26, bottom: 26, left: hovering ? 10 : 0),
          decoration: BoxDecoration(
            border: last ? null : Border(bottom: BorderSide(color: colors.hair)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(project.title,
                        style: MinimalTypography.heading(hovering ? colors.dot : colors.fg)),
                  ),
                  const SizedBox(width: 16),
                  Text('${project.linkName} ↗',
                      style: MinimalTypography.mono(colors.faint).copyWith(fontSize: 11)),
                ],
              ),
              const SizedBox(height: 8),
              Text(project.description,
                  style: MinimalTypography.prose(colors.muted).copyWith(fontSize: 14.5)),
              const SizedBox(height: 8),
              Text(project.tags.join(' · '),
                  style: MinimalTypography.mono(colors.faint).copyWith(fontSize: 11)),
            ],
          ),
        ),
      ),
    );
  }
}
```

- [ ] **Step 5: Implement MinimalWriting**

`lib/features/home/presentation/minimal/sections/minimal_writing.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/theme/minimal/minimal_colors.dart';
import 'package:personal_website/theme/minimal/minimal_typography.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/minimal_section.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/hover_builder.dart';

class MinimalWriting extends StatelessWidget {
  final DeveloperProfile profile;

  const MinimalWriting({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final colors = context.minimal;
    final posts = profile.blogPosts;
    return MinimalSection(
      label: 'Writing',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < posts.length; i++)
            _post(context, posts[i], last: i == posts.length - 1),
        ],
      ),
    );
  }

  Widget _post(BuildContext context, BlogPost post, {required bool last}) {
    final colors = context.minimal;
    return HoverBuilder(
      builder: (context, hovering) => GestureDetector(
        onTap: () => launchUrlString(post.link),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          padding: EdgeInsets.only(top: 18, bottom: 18, left: hovering ? 10 : 0),
          decoration: BoxDecoration(
            border: last ? null : Border(bottom: BorderSide(color: colors.hair)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(post.title,
                    style: MinimalTypography.heading(hovering ? colors.dot : colors.fg, size: 16)),
              ),
              const SizedBox(width: 20),
              Text(post.date,
                  style: MinimalTypography.mono(colors.faint).copyWith(fontSize: 11)),
            ],
          ),
        ),
      ),
    );
  }
}
```

- [ ] **Step 6: Run test to verify it passes**

Run: `flutter test test/sections/list_sections_test.dart`
Expected: PASS (3 tests).

- [ ] **Step 7: Commit**

```bash
git add lib/features/home/presentation/minimal/sections/minimal_experience.dart lib/features/home/presentation/minimal/sections/minimal_projects.dart lib/features/home/presentation/minimal/sections/minimal_writing.dart test/sections/list_sections_test.dart
git commit -m "feat: add Experience, Projects, Writing minimal sections"
```

---

## Task 10: MinimalNavBar (fixed, blur, theme toggle, smooth-scroll)

**Files:**
- Create: `lib/features/home/presentation/minimal/nav/minimal_nav_bar.dart`
- Test: `test/widgets/minimal_nav_bar_test.dart`

Receives callbacks for each nav item (scroll) and a theme-toggle callback + current mode. Items collapse on mobile (<640).

- [ ] **Step 1: Write the failing test**

`test/widgets/minimal_nav_bar_test.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_website/theme/minimal/minimal_theme.dart';
import 'package:personal_website/features/home/presentation/minimal/nav/minimal_nav_bar.dart';

void main() {
  testWidgets('shows brand and triggers theme toggle', (tester) async {
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    var toggled = false;
    await tester.pumpWidget(MaterialApp(
      theme: MinimalTheme.light,
      home: Scaffold(
        body: MinimalNavBar(
          isDark: false,
          onToggleTheme: () => toggled = true,
          onItemTap: (_) {},
        ),
      ),
    ));
    expect(find.textContaining('Viachaslau'), findsOneWidget);

    await tester.tap(find.byKey(const Key('theme-toggle')));
    expect(toggled, isTrue);
  });

  testWidgets('tapping a nav item reports its index', (tester) async {
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    int? tapped;
    await tester.pumpWidget(MaterialApp(
      theme: MinimalTheme.light,
      home: Scaffold(
        body: MinimalNavBar(
          isDark: false,
          onToggleTheme: () {},
          onItemTap: (i) => tapped = i,
        ),
      ),
    ));
    await tester.tap(find.text('WORK'));
    expect(tapped, 1);
  });
}
```

- [ ] **Step 2: Run test to verify it fails**

Run: `flutter test test/widgets/minimal_nav_bar_test.dart`
Expected: FAIL — `MinimalNavBar` not defined.

- [ ] **Step 3: Implement MinimalNavBar**

`lib/features/home/presentation/minimal/nav/minimal_nav_bar.dart`:

```dart
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:personal_website/theme/minimal/minimal_colors.dart';
import 'package:personal_website/theme/minimal/minimal_typography.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/hover_builder.dart';

/// Nav item labels, in order. Index passed back via onItemTap.
const kNavItems = ['About', 'Work', 'Projects', 'Writing', 'Contact'];

class MinimalNavBar extends StatelessWidget {
  final bool isDark;
  final VoidCallback onToggleTheme;
  final ValueChanged<int> onItemTap;

  const MinimalNavBar({
    super.key,
    required this.isDark,
    required this.onToggleTheme,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.minimal;
    final narrow = MediaQuery.sizeOf(context).width < 640;

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Container(
          height: 72,
          color: colors.navbg,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 780),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: narrow ? 24 : 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: MinimalTypography.heading(colors.fg, size: 14)
                            .copyWith(fontWeight: FontWeight.w600),
                        children: [
                          const TextSpan(text: 'Viachaslau Pratasenia'),
                          TextSpan(text: '.', style: TextStyle(color: colors.dot)),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        if (!narrow)
                          for (var i = 0; i < kNavItems.length; i++)
                            Padding(
                              padding: const EdgeInsets.only(left: 24),
                              child: HoverBuilder(
                                builder: (context, hovering) => GestureDetector(
                                  onTap: () => onItemTap(i),
                                  child: Text(
                                    kNavItems[i].toUpperCase(),
                                    style: MinimalTypography.monoLabel(
                                        hovering ? colors.fg : colors.muted),
                                  ),
                                ),
                              ),
                            ),
                        const SizedBox(width: 24),
                        _toggle(context),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _toggle(BuildContext context) {
    final colors = context.minimal;
    return GestureDetector(
      key: const Key('theme-toggle'),
      onTap: onToggleTheme,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: colors.hair),
          borderRadius: BorderRadius.circular(999),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 11,
              height: 11,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: colors.muted, width: 1.5),
                gradient: LinearGradient(
                  colors: [colors.muted, colors.muted, Colors.transparent, Colors.transparent],
                  stops: const [0, 0.5, 0.5, 1],
                ),
              ),
            ),
            const SizedBox(width: 7),
            Text(isDark ? 'Light' : 'Dark',
                style: MinimalTypography.monoLabel(colors.muted)),
          ],
        ),
      ),
    );
  }
}
```

- [ ] **Step 4: Run test to verify it passes**

Run: `flutter test test/widgets/minimal_nav_bar_test.dart`
Expected: PASS (2 tests).

- [ ] **Step 5: Commit**

```bash
git add lib/features/home/presentation/minimal/nav/minimal_nav_bar.dart test/widgets/minimal_nav_bar_test.dart
git commit -m "feat: add MinimalNavBar with blur, theme toggle, nav items"
```

---

## Task 11: MinimalHomePage (assemble sections + nav + scroll + theme toggle)

**Files:**
- Create: `lib/features/home/presentation/minimal/minimal_home_page.dart`
- Test: `test/minimal_home_page_test.dart`

Assembles: a `Stack` with a scrolling column of sections (with `GlobalKey`s for smooth-scroll) and the fixed nav on top. Reads `ProfileCubit` for data and `ThemeCubit` for the toggle. Handles loading/error states.

- [ ] **Step 1: Write the failing test**

`test/minimal_home_page_test.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_website/theme/minimal/minimal_theme.dart';
import 'package:personal_website/features/change_theme/domain/use_case/theme_cubit.dart';
import 'package:personal_website/features/home/domain/use_case/profile_cubit.dart';
import 'package:personal_website/features/home/domain/use_case/profile_state.dart';
import 'package:personal_website/features/home/presentation/minimal/minimal_home_page.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'helpers/sample_profile.dart';

class _FakeProfileCubit extends Cubit<ProfileState> implements ProfileCubit {
  _FakeProfileCubit(super.state);
}

void main() {
  setUp(() => VisibilityDetectorController.instance.updateInterval = Duration.zero);

  Widget host(ProfileState state, ThemeCubit themeCubit) => MaterialApp(
        theme: MinimalTheme.light,
        darkTheme: MinimalTheme.dark,
        home: MultiBlocProvider(
          providers: [
            BlocProvider<ProfileCubit>.value(value: _FakeProfileCubit(state)),
            BlocProvider<ThemeCubit>.value(value: themeCubit),
          ],
          child: const MinimalHomePage(),
        ),
      );

  // ProfileState has a PRIVATE constructor — build states via initial()/copyWith().
  final loadingState = ProfileState.initial(); // isLoading: true
  ProfileState loadedState() =>
      ProfileState.initial().copyWith(isLoading: false, developerProfile: sampleProfile());

  testWidgets('shows loading indicator while loading', (tester) async {
    await tester.pumpWidget(host(loadingState, ThemeCubit()));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('renders sections when profile loaded', (tester) async {
    tester.view.physicalSize = const Size(1200, 2400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(host(loadedState(), ThemeCubit()));
    await tester.pump();
    expect(find.textContaining('build things with Flutter'), findsOneWidget);
    expect(find.text('ABOUT'), findsWidgets);
  });

  testWidgets('theme toggle flips ThemeCubit mode', (tester) async {
    tester.view.physicalSize = const Size(1200, 2400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    final themeCubit = ThemeCubit();
    themeCubit.changeTheme(ThemeMode.light);
    await tester.pumpWidget(host(loadedState(), themeCubit));
    await tester.pump();
    await tester.tap(find.byKey(const Key('theme-toggle')));
    await tester.pump();
    expect(themeCubit.state, ThemeMode.dark);
  });
}
```

> Note: `ProfileState` has a private constructor (`._()`); states are built via `ProfileState.initial().copyWith(...)`. `copyWith` cannot null-out `developerProfile`, which is fine here (loading state never sets it).

- [ ] **Step 2: Run test to verify it fails**

Run: `flutter test test/minimal_home_page_test.dart`
Expected: FAIL — `MinimalHomePage` not defined.

- [ ] **Step 3: Implement MinimalHomePage**

`lib/features/home/presentation/minimal/minimal_home_page.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_website/theme/minimal/minimal_colors.dart';
import 'package:personal_website/features/change_theme/domain/use_case/theme_cubit.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/features/home/domain/use_case/profile_cubit.dart';
import 'package:personal_website/features/home/domain/use_case/profile_state.dart';
import 'package:personal_website/features/home/presentation/minimal/nav/minimal_nav_bar.dart';
import 'package:personal_website/features/home/presentation/minimal/sections/minimal_hero.dart';
import 'package:personal_website/features/home/presentation/minimal/sections/minimal_about.dart';
import 'package:personal_website/features/home/presentation/minimal/sections/minimal_experience.dart';
import 'package:personal_website/features/home/presentation/minimal/sections/minimal_skills.dart';
import 'package:personal_website/features/home/presentation/minimal/sections/minimal_projects.dart';
import 'package:personal_website/features/home/presentation/minimal/sections/minimal_writing.dart';
import 'package:personal_website/features/home/presentation/minimal/sections/minimal_contact.dart';

class MinimalHomePage extends StatefulWidget {
  static const routeName = '/';

  const MinimalHomePage({super.key});

  @override
  State<MinimalHomePage> createState() => _MinimalHomePageState();
}

class _MinimalHomePageState extends State<MinimalHomePage> {
  // Index order must match kNavItems: About, Work(=Experience), Projects, Writing, Contact.
  final _aboutKey = GlobalKey();
  final _workKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _writingKey = GlobalKey();
  final _contactKey = GlobalKey();

  late final List<GlobalKey> _navTargets = [
    _aboutKey,
    _workKey,
    _projectsKey,
    _writingKey,
    _contactKey,
  ];

  void _scrollTo(int index) {
    final ctx = _navTargets[index].currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.minimal;
    final profileState = context.watch<ProfileCubit>().state;
    final themeMode = context.watch<ThemeCubit>().state;
    final isDark = themeMode == ThemeMode.dark;

    return Scaffold(
      backgroundColor: colors.bg,
      body: Stack(
        children: [
          _buildBody(context, profileState),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: MinimalNavBar(
              isDark: isDark,
              onToggleTheme: () => context
                  .read<ThemeCubit>()
                  .changeTheme(isDark ? ThemeMode.light : ThemeMode.dark),
              onItemTap: _scrollTo,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context, ProfileState state) {
    if (state.isLoading) {
      return Center(child: CircularProgressIndicator(color: context.minimal.dot));
    }
    final profile = state.developerProfile;
    if (profile == null) {
      return Center(
        child: Text('Something went wrong.',
            style: TextStyle(color: context.minimal.muted)),
      );
    }
    return _Content(
      profile: profile,
      aboutKey: _aboutKey,
      workKey: _workKey,
      projectsKey: _projectsKey,
      writingKey: _writingKey,
      contactKey: _contactKey,
    );
  }
}

class _Content extends StatelessWidget {
  final DeveloperProfile profile;
  final GlobalKey aboutKey, workKey, projectsKey, writingKey, contactKey;

  const _Content({
    required this.profile,
    required this.aboutKey,
    required this.workKey,
    required this.projectsKey,
    required this.writingKey,
    required this.contactKey,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MinimalHero(profile: profile),
          MinimalAbout(key: aboutKey, profile: profile),
          MinimalExperience(key: workKey, profile: profile),
          MinimalSkills(profile: profile),
          MinimalProjects(key: projectsKey, profile: profile),
          MinimalWriting(key: writingKey, profile: profile),
          MinimalContact(key: contactKey, profile: profile),
        ],
      ),
    );
  }
}
```

- [ ] **Step 4: Run test to verify it passes**

Run: `flutter test test/minimal_home_page_test.dart`
Expected: PASS (3 tests).

- [ ] **Step 5: Commit**

```bash
git add lib/features/home/presentation/minimal/minimal_home_page.dart test/minimal_home_page_test.dart
git commit -m "feat: assemble MinimalHomePage with nav, sections, theme toggle"
```

---

## Task 12: Wire app.dart (route + theme from ThemeCubit, default light)

**Files:**
- Modify: `lib/app.dart`

- [ ] **Step 1: Read current app.dart**

Open `lib/app.dart`. Current state: routes to `HomePage`, themes are `ThemeController.light/darkTheme`, `themeMode` hardcoded to `ThemeMode.dark`.

- [ ] **Step 2: Replace imports and wiring**

Replace the `HomePage` import:

```dart
// remove:
import 'package:personal_website/features/home/presentation/home_page.dart';
// add:
import 'package:personal_website/features/home/presentation/minimal/minimal_home_page.dart';
import 'package:personal_website/theme/minimal/minimal_theme.dart';
```

(Keep the `theme_controller.dart` import only if still referenced; otherwise remove it.)

Update the router route:

```dart
GoRoute(
  path: MinimalHomePage.routeName,
  builder: (context, state) => const MinimalHomePage(),
),
```

And `initialLocation: MinimalHomePage.routeName,`.

Update the `MaterialApp.router` theme block:

```dart
child: BlocBuilder<ThemeCubit, ThemeMode>(builder: (context, themeMode) {
  return MaterialApp.router(
    title: 'Viachaslau Pratasenia',
    routerConfig: _router,
    theme: MinimalTheme.light,
    darkTheme: MinimalTheme.dark,
    themeMode: themeMode,
    debugShowCheckedModeBanner: false,
  );
}),
```

- [ ] **Step 3: Default the ThemeCubit to light**

Open `lib/features/change_theme/domain/use_case/theme_cubit.dart` and change the initial state from `ThemeMode.dark` to `ThemeMode.light` (mockup default is light):

```dart
class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light);

  void changeTheme(ThemeMode mode) => emit(mode);
}
```

- [ ] **Step 4: Run analyzer and full test suite**

Run: `flutter analyze`
Expected: No issues (or only pre-existing warnings in untouched old files). Fix any new errors introduced by the changes (e.g. unused imports).

Run: `flutter test`
Expected: All tests pass.

- [ ] **Step 5: Build web to confirm it compiles**

Run: `flutter build web --no-tree-shake-icons`
Expected: `✓ Built build/web`.

- [ ] **Step 6: Commit**

```bash
git add lib/app.dart lib/features/change_theme/domain/use_case/theme_cubit.dart
git commit -m "feat: switch app to MinimalHomePage with light/dark theme toggle"
```

---

## Task 13: Manual verification & polish

**Files:** (adjustments as needed across `lib/features/home/presentation/minimal/`)

- [ ] **Step 1: Run the app**

Run: `flutter run -d chrome` (or use the `/run` skill).

- [ ] **Step 2: Verify against the mockup checklist**

- [ ] Hero: kicker line + headline + meta + CV link, correct spacing.
- [ ] Nav: fixed, blurred, brand with red dot, items scroll to sections, toggle flips theme.
- [ ] Light is the default theme; toggling to dark swaps all 8 tokens smoothly.
- [ ] Each section has a top hairline and a labelled `.lbl` with red dot.
- [ ] Experience/Projects/Writing: hover shifts padding-left and (projects/writing) reddens the title.
- [ ] External links open (work links, projects, writing, socials).
- [ ] Reveal-on-scroll fades sections in once.
- [ ] Narrow width (<640): nav items collapse, paddings shrink, no overflow.

- [ ] **Step 3: Fix any visual discrepancies**

Adjust spacing/sizes inline to match the mockup. Re-run `flutter analyze` and `flutter test` after edits.

- [ ] **Step 4: Final commit**

```bash
git add -A
git commit -m "polish: align minimal redesign with mockup"
```

---

## Self-Review Notes

- **Spec coverage:** nav ✓(T10), hero ✓(T8), about ✓(T8), experience ✓(T9), skills ✓(T8, static platforms/tooling), projects ✓(T9), writing ✓(T9), contact+footer ✓(T8), colors OKLCH→sRGB ✓(T1–T2), typography ✓(T3), theme wiring + app.dart fix + default light ✓(T4, T12), reveal ✓(T5), hover ✓(T6), smooth-scroll ✓(T11), blur ✓(T10), url_launcher links ✓(T8/T9), testing strategy ✓(per-task widget tests + analyze + build).
- **Type consistency:** `MinimalColors` tokens (bg/fg/muted/faint/hair/accent/dot/navbg) used consistently; `context.minimal` accessor used everywhere; `MinimalTypography` method names (h1/monoLabel/lede/prose/heading/sans/mono) consistent; `kNavItems` index order matches `_navTargets` in T11.
- **Known follow-up (out of scope):** old `modern_*` files and animated backgrounds remain in repo unused; optional cleanup can remove them later. `ProfileState` field names to be confirmed at T11 (note included).
