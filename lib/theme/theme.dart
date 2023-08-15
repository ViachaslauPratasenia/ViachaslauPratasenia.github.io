import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_website/theme/colors.dart';

/// access point for all styling parameters
/// connecting together all theme parts - text styles, sizes and colors
class AppTheme extends ChangeNotifier {
  static double fontScaleFactor = 1.0;

  static AppColors get colors => AppColors();

  static TextStyle get typography => _instance._typography;

  static ThemeData get defaultThemeData => ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
          ),
        ),
        dialogBackgroundColor: Colors.white,
        canvasColor: Colors.white,
      );

  late final TextStyle _typography;

  /// screen width that is being used by design layouts
  static const double _designLayoutWidth = 320.0;

  static final AppTheme _instance = AppTheme._();

  factory AppTheme() => _instance;

  AppTheme._()
      : _typography = TextStyle(
          fontFamily: 'Inter-Regular',
          fontWeight: FontWeight.normal,
          height: 1.5,
          decoration: TextDecoration.none,
          color: colors.textBase,
        );

  /// adjust font scale factor depending on how device screen width is relates to design layout
  /// helps to keep size proportions
  void adjustFontScaleFactorToFitScreen(double screenWidth) {
    fontScaleFactor = (screenWidth / _designLayoutWidth).clamp(0.75, 1.25);
    notifyListeners();
  }
}
