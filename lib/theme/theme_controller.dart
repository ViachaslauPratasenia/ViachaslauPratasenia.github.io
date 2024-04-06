import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_website/theme/app_colors.dart';
import 'package:personal_website/theme/theme_colors.dart';

class ThemeController {
  static TextTheme get defaultTextTheme => GoogleFonts.exo2TextTheme(const TextTheme(
        displayLarge: TextStyle(fontSize: 54, height: 60 / 54, fontWeight: FontWeight.w600),
        displayMedium: TextStyle(fontSize: 44, height: 56 / 44, fontWeight: FontWeight.w600),
        displaySmall: TextStyle(fontSize: 36, height: 44 / 36, fontWeight: FontWeight.w600),
        headlineLarge: TextStyle(fontSize: 32, height: 40 / 32, fontWeight: FontWeight.w600),
        headlineMedium: TextStyle(fontSize: 28, height: 36 / 28, fontWeight: FontWeight.w600),
        headlineSmall: TextStyle(fontSize: 24, height: 32 / 24, fontWeight: FontWeight.w600),
        titleLarge: TextStyle(fontSize: 24, height: 28 / 24, fontWeight: FontWeight.w600),
        titleMedium: TextStyle(fontSize: 16, height: 24 / 16, fontWeight: FontWeight.w600),
        titleSmall: TextStyle(fontSize: 14, height: 20 / 14, fontWeight: FontWeight.w600),
        bodyLarge: TextStyle(fontSize: 16, height: 24 / 16, fontWeight: FontWeight.w400),
        bodyMedium: TextStyle(fontSize: 14, height: 20 / 14, fontWeight: FontWeight.w400),
        bodySmall: TextStyle(fontSize: 12, height: 16 / 12, fontWeight: FontWeight.w400),
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

extension ThemeControllerExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  MarkdownStyleSheet get markdownStyleSheet => MarkdownStyleSheet(
        h1: Theme.of(this).textTheme.displayMedium?.copyWith(color: AppColors.textPrimary),
        h1Padding: const EdgeInsets.only(bottom: 16),
        h2: Theme.of(this).textTheme.headlineMedium?.copyWith(color: AppColors.textPrimary),
        h2Padding: const EdgeInsets.only(top: 24, bottom: 16),
        p: Theme.of(this).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
        strong: Theme.of(this).textTheme.bodyLarge?.copyWith(color: AppColors.primary),
        codeblockDecoration: BoxDecoration(
          color: AppColors.backgroundSecondary,
          borderRadius: BorderRadius.circular(8),
        ),
        code: Theme.of(this).textTheme.bodyLarge?.copyWith(color: AppColors.textPrimary),
        codeblockPadding: const EdgeInsets.all(16),
        listIndent: 16,
      );
}
