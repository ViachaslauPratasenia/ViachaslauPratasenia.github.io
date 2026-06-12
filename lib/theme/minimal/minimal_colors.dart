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
    bg: oklchToColor(0.22, 0.012, 250),
    fg: oklchToColor(0.94, 0.003, 250),
    muted: oklchToColor(0.72, 0.008, 250),
    faint: oklchToColor(0.60, 0.008, 250),
    hair: oklchToColor(0.32, 0.010, 250),
    accent: oklchToColor(0.80, 0.02, 250),
    dot: oklchToColor(0.68, 0.19, 28),
    navbg: oklchToColor(0.22, 0.012, 250, 0.8),
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
