import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_website/theme/minimal/minimal_colors.dart';

void main() {
  group('oklchToColor', () {
    test('pure white maps to ~white', () {
      final c = oklchToColor(1.0, 0.0, 0.0);
      expect(c.red, closeTo(255, 1));
      expect(c.green, closeTo(255, 1));
      expect(c.blue, closeTo(255, 1));
    });

    test('pure black maps to black', () {
      final c = oklchToColor(0.0, 0.0, 0.0);
      expect(c.red, 0);
      expect(c.green, 0);
      expect(c.blue, 0);
    });

    test('red dot token (0.62 L, 0.20 C, 28 H) is reddish', () {
      final c = oklchToColor(0.62, 0.20, 28);
      expect(c.red, greaterThan(c.green));
      expect(c.red, greaterThan(c.blue));
      expect(c.red, greaterThan(150));
    });

    test('alpha is applied', () {
      final c = oklchToColor(0.5, 0.0, 0.0, 0.5);
      expect(c.opacity, closeTo(0.5, 0.01));
    });
  });
}
