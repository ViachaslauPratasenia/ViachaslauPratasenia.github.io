import 'package:flutter/material.dart';

class AnimatedSocialIcon extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color? color;
  final double size;

  const AnimatedSocialIcon({
    super.key,
    required this.icon,
    required this.onPressed,
    this.color,
    this.size = 24,
  });

  @override
  State<AnimatedSocialIcon> createState() => _AnimatedSocialIconState();
}

class _AnimatedSocialIconState extends State<AnimatedSocialIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleEnter() {
    if (mounted) {
      setState(() => _isHovered = true);
      _controller.forward();
    }
  }

  void _handleExit() {
    if (mounted) {
      setState(() => _isHovered = false);
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _handleEnter(),
      onExit: (_) => _handleExit(),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedScale(
          scale: _isHovered ? 1.2 : 1.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: _isHovered
                  ? (widget.color ?? Colors.white).withValues(alpha: 0.1)
                  : Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: (widget.color ?? Colors.white)
                    .withValues(alpha: _isHovered ? 1.0 : 0.5),
                width: 2,
              ),
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: (widget.color ?? Colors.white)
                            .withValues(alpha: 0.3),
                        blurRadius: 15,
                        spreadRadius: 2,
                      ),
                    ]
                  : null,
            ),
            child: Icon(
              widget.icon,
              size: widget.size,
              color: widget.color ?? Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}


