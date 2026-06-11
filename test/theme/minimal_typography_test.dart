import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_website/theme/minimal/minimal_typography.dart';

void main() {
  test('mono style has wide letter spacing and uppercase tracking', () {
    final style = MinimalTypography.monoLabel(const Color(0xFF000000));
    expect(style.letterSpacing, greaterThan(0));
    expect(style.color, const Color(0xFF000000));
  });

  test('h1 style is large and not bold-900', () {
    final style = MinimalTypography.h1(const Color(0xFF000000));
    expect(style.fontSize, greaterThanOrEqualTo(38));
    expect(style.fontWeight, FontWeight.w500);
  });

  test('lede style is medium weight', () {
    final style = MinimalTypography.lede(const Color(0xFF000000));
    expect(style.fontWeight, FontWeight.w500);
  });
}
