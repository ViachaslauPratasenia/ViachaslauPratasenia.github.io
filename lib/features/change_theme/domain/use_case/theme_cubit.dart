import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  /// Starts from the browser/OS preference resolved to an explicit mode, so the
  /// cubit state always matches what's on screen (keeps the toggle in sync).
  ThemeCubit() : super(_initialMode());

  static ThemeMode _initialMode() =>
      PlatformDispatcher.instance.platformBrightness == Brightness.dark
          ? ThemeMode.dark
          : ThemeMode.light;

  void changeTheme(ThemeMode mode) => emit(mode);
}