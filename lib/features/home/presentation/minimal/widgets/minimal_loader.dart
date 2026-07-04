import 'dart:async';
import 'package:flutter/material.dart';
import 'package:personal_website/theme/minimal/minimal_colors.dart';

/// Debounced in-app loader. Shows nothing for [delay] (fast loads never see
/// it), then fades in a thin sliding accent bar — the same motif as the HTML
/// splash, so the handoff reads as one continuous load.
class MinimalLoader extends StatefulWidget {
  final Duration delay;

  const MinimalLoader({super.key, this.delay = const Duration(milliseconds: 500)});

  @override
  State<MinimalLoader> createState() => _MinimalLoaderState();
}

class _MinimalLoaderState extends State<MinimalLoader>
    with SingleTickerProviderStateMixin {
  bool _visible = false;
  Timer? _appearTimer;
  late final AnimationController _slide = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1100),
  )..repeat();

  @override
  void initState() {
    super.initState();
    _appearTimer = Timer(widget.delay, () {
      if (mounted) setState(() => _visible = true);
    });
  }

  @override
  void dispose() {
    _appearTimer?.cancel();
    _slide.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.minimal;
    return Center(
      child: AnimatedOpacity(
        opacity: _visible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        child: SizedBox(
          width: 72,
          height: 1,
          child: ClipRect(
            child: Stack(
              children: [
                Container(color: colors.hair),
                AnimatedBuilder(
                  animation: _slide,
                  builder: (context, _) {
                    // Sweep the 36px accent segment fully across the track,
                    // entering from the left and exiting right (as the splash).
                    final t = Curves.easeInOut.transform(_slide.value);
                    return Transform.translate(
                      offset: Offset(-36 + 108 * t, 0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(width: 36, height: 1, color: colors.dot),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
