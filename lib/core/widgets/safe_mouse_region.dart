import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Wrapper for MouseRegion that safely handles mounted state
class SafeMouseRegion extends StatefulWidget {
  final Widget child;
  final void Function(PointerEnterEvent)? onEnter;
  final void Function(PointerExitEvent)? onExit;
  final void Function(PointerHoverEvent)? onHover;

  const SafeMouseRegion({
    super.key,
    required this.child,
    this.onEnter,
    this.onExit,
    this.onHover,
  });

  @override
  State<SafeMouseRegion> createState() => _SafeMouseRegionState();
}

class _SafeMouseRegionState extends State<SafeMouseRegion> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: widget.onEnter != null
          ? (event) {
              if (mounted) {
                widget.onEnter!(event);
              }
            }
          : null,
      onExit: widget.onExit != null
          ? (event) {
              if (mounted) {
                widget.onExit!(event);
              }
            }
          : null,
      onHover: widget.onHover != null
          ? (event) {
              if (mounted) {
                widget.onHover!(event);
              }
            }
          : null,
      child: widget.child,
    );
  }
}

