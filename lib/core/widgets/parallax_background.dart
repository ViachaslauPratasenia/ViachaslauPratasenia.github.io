import 'package:flutter/material.dart';

class ParallaxBackground extends StatelessWidget {
  final Widget child;
  final double scrollPosition;
  final double speed;

  const ParallaxBackground({
    super.key,
    required this.child,
    required this.scrollPosition,
    this.speed = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -scrollPosition * speed),
      child: child,
    );
  }
}

