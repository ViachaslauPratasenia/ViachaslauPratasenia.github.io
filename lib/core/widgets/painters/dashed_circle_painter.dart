import 'dart:math' as math;

import 'package:flutter/material.dart';

class DashedCirclePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  DashedCirclePainter({
    this.color = Colors.black,
    this.strokeWidth = 1,
    this.dashWidth = 12.0,
    this.dashSpace = 12.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    var startPoint = 0.0;
    final radius = size.width / 2;

    while (startPoint < 360) {
      startPoint += dashWidth;
      canvas.drawArc(Rect.fromCircle(center: Offset(radius, radius), radius: radius),
          math.pi * startPoint / 180, math.pi * dashSpace / 180, false, paint);
      startPoint += dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
