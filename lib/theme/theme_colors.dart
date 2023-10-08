import 'package:flutter/material.dart';

class ThemeColors {
  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color surface;
  final Color background;
  final Color error;

  ThemeColors({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.surface,
    required this.background,
    required this.error,
  });
}

class ThemeColorsProvider {
  static ThemeColors darkColors() => ThemeColors(
        primary: const Color(0xff457B9D),
        secondary: const Color(0xffA8DADC),
        tertiary: const Color(0xffF1FAEE),
        surface: const Color(0xffF1FAEE).withOpacity(0.65),
        background: const Color(0xff10172A),
        error: const Color(0xffE63946),
      );

  static ThemeColors lightColors() => ThemeColors(
        primary: const Color(0xffFFDDD2),
        secondary: const Color(0xff83C5BE),
        tertiary: const Color(0xff006D77),
        surface: Colors.black87,
        background: const Color(0xffF2F7F8),
        error: const Color(0xffE63946),
      );
}
