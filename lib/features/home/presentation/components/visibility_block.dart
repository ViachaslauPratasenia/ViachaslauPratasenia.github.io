import 'package:flutter/material.dart';
import 'package:personal_website/core/orientation_provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VisibilityBlock extends StatefulWidget {
  final Key blockKey;
  final Widget child;
  final int visibilityPercent;

  const VisibilityBlock({
    super.key,
    required this.blockKey,
    required this.child,
    this.visibilityPercent = 5,
  });

  @override
  State<VisibilityBlock> createState() => _VisibilityBlockState();
}

class _VisibilityBlockState extends State<VisibilityBlock> {
  double opacity = 0;

  @override
  Widget build(BuildContext context) {
    final orientation = OrientationProvider.of(context).orientation;

    if (orientation == Orientation.portrait) {
      return widget.child;
    }

    return VisibilityDetector(
      key: widget.blockKey,
      onVisibilityChanged: (info) {
        var visiblePercentage = info.visibleFraction * 100;

        if (visiblePercentage > widget.visibilityPercent && opacity == 0) {
          setState(() {
            opacity = 1;
          });
        }
      },
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        opacity: opacity,
        child: widget.child,
      ),
    );
  }
}
