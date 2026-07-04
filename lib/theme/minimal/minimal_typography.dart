import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Typography for the minimal design.
/// Display = Space Grotesk, Sans = Inter, Mono = JetBrains Mono.
abstract class MinimalTypography {
  static TextStyle mono(Color color) => GoogleFonts.jetBrainsMono(color: color);

  /// Hero display headline. Caller passes a responsive [size] (clamp 40..92).
  static TextStyle display(Color color, {double size = 72}) =>
      GoogleFonts.spaceGrotesk(
        color: color,
        fontSize: size,
        height: 1.06,
        fontWeight: FontWeight.w500,
        letterSpacing: -size * 0.03,
      );

  /// Large section title (left column of a section), clamp 26..40.
  static TextStyle sectionTitle(Color color, {double size = 32}) =>
      GoogleFonts.spaceGrotesk(
        color: color,
        fontSize: size,
        height: 1.1,
        fontWeight: FontWeight.w500,
        letterSpacing: -size * 0.02,
      );

  /// Mono style for clickable links — medium weight to set them apart from
  /// plain mono labels/indicators.
  static TextStyle monoLink(Color color) =>
      GoogleFonts.jetBrainsMono(color: color, fontWeight: FontWeight.w500);

  /// Hero headline. Caller passes a responsive [size] (clamp 38..60).
  static TextStyle h1(Color color, {double size = 48}) => GoogleFonts.inter(
        color: color,
        fontSize: size,
        height: 1.18,
        fontWeight: FontWeight.w500,
        letterSpacing: -size * 0.02,
      );

  /// Mono uppercase tracked label (.lbl / .av / .co).
  static TextStyle monoLabel(Color color,
          {double size = 11, FontWeight weight = FontWeight.w400}) =>
      GoogleFonts.jetBrainsMono(
        color: color,
        fontSize: size,
        height: 1.4,
        letterSpacing: size * 0.14,
        fontWeight: weight,
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
