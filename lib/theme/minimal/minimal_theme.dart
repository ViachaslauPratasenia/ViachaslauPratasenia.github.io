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
