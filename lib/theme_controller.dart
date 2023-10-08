import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeController {
  static Color get darkBackgroundColor => const Color(0xff10172A);

  static Color get darkPrimaryColor => const Color(0xff457B9D);

  static Color get darkSecondaryColor => const Color(0xffA8DADC);

  static Color get darkTertiaryColor => const Color(0xffF1FAEE);

  static Color get darkSurfaceColor => const Color(0xffF1FAEE).withOpacity(0.65);

  static Color get darkErrorColor => const Color(0xffE63946);

  static TextTheme get defaultTextTheme => GoogleFonts.exo2TextTheme(const TextTheme(
        headlineLarge: TextStyle(fontSize: 40, height: 1.3),
        headlineMedium: TextStyle(fontSize: 34, height: 1.4118),
        headlineSmall: TextStyle(fontSize: 24, height: 1.2308),
        bodyLarge: TextStyle(fontSize: 18, height: 1.6),
        bodyMedium: TextStyle(fontSize: 16, height: 1.3),
        bodySmall: TextStyle(fontSize: 14, height: 1.4),
      ));

  static ThemeData darkTheme = ThemeData(
    textTheme: defaultTextTheme,
    colorScheme: ColorScheme.dark(
      background: darkBackgroundColor,
      primary: darkPrimaryColor,
      secondary: darkSecondaryColor,
      tertiary: darkTertiaryColor,
      surface: darkSurfaceColor,
      error: darkErrorColor,
    ),
  );
}
