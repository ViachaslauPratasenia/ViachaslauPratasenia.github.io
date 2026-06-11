import 'package:flutter_test/flutter_test.dart';
import 'package:personal_website/theme/minimal/minimal_colors.dart';
import 'package:personal_website/theme/minimal/minimal_theme.dart';

void main() {
  test('light theme carries light MinimalColors extension', () {
    final ext = MinimalTheme.light.extension<MinimalColors>();
    expect(ext, isNotNull);
    expect(ext!.bg, MinimalColors.light.bg);
    expect(MinimalTheme.light.scaffoldBackgroundColor, MinimalColors.light.bg);
  });

  test('dark theme carries dark MinimalColors extension', () {
    final ext = MinimalTheme.dark.extension<MinimalColors>();
    expect(ext!.bg, MinimalColors.dark.bg);
  });
}
