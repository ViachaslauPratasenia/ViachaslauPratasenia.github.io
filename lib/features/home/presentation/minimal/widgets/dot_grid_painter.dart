import 'package:flutter/material.dart';

/// Near-invisible dot grid: an engineering texture behind the hero.
/// Dots fade out towards the bottom so content below stays clean.
class DotGridPainter extends CustomPainter {
  final Color color;
  final double spacing;

  const DotGridPainter({required this.color, this.spacing = 28});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    for (var y = spacing; y < size.height; y += spacing) {
      final fade = 1.0 - (y / size.height);
      paint.color = color.withValues(alpha: color.a * fade);
      for (var x = spacing; x < size.width; x += spacing) {
        canvas.drawCircle(Offset(x, y), 1.0, paint);
      }
    }
  }

  @override
  bool shouldRepaint(DotGridPainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.spacing != spacing;
}
