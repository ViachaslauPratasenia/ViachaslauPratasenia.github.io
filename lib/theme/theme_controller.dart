import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_website/theme/theme_colors.dart';

class ThemeController {
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
      background: ThemeColorsProvider.darkColors().background,
      primary: ThemeColorsProvider.darkColors().primary,
      secondary: ThemeColorsProvider.darkColors().secondary,
      tertiary: ThemeColorsProvider.darkColors().tertiary,
      surface: ThemeColorsProvider.darkColors().surface,
      error: ThemeColorsProvider.darkColors().error,
    ),
  );

  static ThemeData lightTheme = ThemeData(
    textTheme: defaultTextTheme,
    colorScheme: ColorScheme.dark(
      background: ThemeColorsProvider.lightColors().background,
      primary: ThemeColorsProvider.lightColors().primary,
      secondary: ThemeColorsProvider.lightColors().secondary,
      tertiary: ThemeColorsProvider.lightColors().tertiary,
      surface: ThemeColorsProvider.lightColors().surface,
      error: ThemeColorsProvider.lightColors().error,
    ),
  );
}
