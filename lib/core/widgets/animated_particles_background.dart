import 'dart:math';
import 'package:flutter/material.dart';

class ParticlesPainter extends CustomPainter {
  final List<Particle> particles;
  final double animationValue;

  ParticlesPainter(this.particles, this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    for (var particle in particles) {
      final opacity = (sin(animationValue * 2 * pi + particle.phase) + 1) / 2;
      paint.color = particle.color.withOpacity(opacity * 0.6);

      canvas.drawCircle(
        Offset(particle.x * size.width, particle.y * size.height),
        particle.radius,
        paint,
      );

      // Add glow effect
      paint.color = particle.color.withOpacity(opacity * 0.2);
      canvas.drawCircle(
        Offset(particle.x * size.width, particle.y * size.height),
        particle.radius * 2,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(ParticlesPainter oldDelegate) => true;
}

class Particle {
  final double x;
  final double y;
  final double radius;
  final Color color;
  final double phase;

  Particle({
    required this.x,
    required this.y,
    required this.radius,
    required this.color,
    required this.phase,
  });
}

class AnimatedParticlesBackground extends StatefulWidget {
  final Widget child;

  const AnimatedParticlesBackground({
    super.key,
    required this.child,
  });

  @override
  State<AnimatedParticlesBackground> createState() =>
      _AnimatedParticlesBackgroundState();
}

class _AnimatedParticlesBackgroundState
    extends State<AnimatedParticlesBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Particle> particles;

  @override
  void initState() {
    super.initState();
    _initParticles();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
  }

  void _initParticles() {
    final random = Random();
    particles = List.generate(30, (index) {
      return Particle(
        x: random.nextDouble(),
        y: random.nextDouble(),
        radius: random.nextDouble() * 3 + 1,
        color: [
          const Color(0xFF6366F1),
          const Color(0xFF8B5CF6),
          const Color(0xFF06B6D4),
          const Color(0xFFEC4899),
        ][random.nextInt(4)],
        phase: random.nextDouble() * 2 * pi,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              painter: ParticlesPainter(particles, _controller.value),
              child: Container(),
            );
          },
        ),
        widget.child,
      ],
    );
  }
}

