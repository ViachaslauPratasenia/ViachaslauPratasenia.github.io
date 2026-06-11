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
