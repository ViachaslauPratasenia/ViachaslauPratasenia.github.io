import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// Fades + slides [child] up by 16px the first time it becomes >10% visible.
class RevealOnScroll extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const RevealOnScroll({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1000),
  });

  @override
  State<RevealOnScroll> createState() => _RevealOnScrollState();
}

class _RevealOnScrollState extends State<RevealOnScroll> {
  bool _shown = false;
  final Key _detectorKey = UniqueKey();

  void _onVisible(VisibilityInfo info) {
    if (!_shown && info.visibleFraction > 0.1 && mounted) {
      setState(() => _shown = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: _detectorKey,
      onVisibilityChanged: _onVisible,
      child: AnimatedSlide(
        offset: _shown ? Offset.zero : const Offset(0, 0.06),
        duration: widget.duration,
        curve: Curves.easeOutCubic,
        child: AnimatedOpacity(
          opacity: _shown ? 1.0 : 0.0,
          duration: widget.duration,
          curve: Curves.easeOutCubic,
          child: widget.child,
        ),
      ),
    );
  }
}
