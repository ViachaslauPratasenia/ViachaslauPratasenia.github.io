import 'package:flutter/material.dart';

/// Renders [text] with each laid-out line sliding up from behind a clip mask,
/// staggered top to bottom. Runs once when first built.
class LineRevealText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final Duration lineDuration;
  final Duration stagger;

  const LineRevealText(
    this.text, {
    super.key,
    required this.style,
    this.lineDuration = const Duration(milliseconds: 650),
    this.stagger = const Duration(milliseconds: 90),
  });

  @override
  State<LineRevealText> createState() => _LineRevealTextState();
}

class _LineRevealTextState extends State<LineRevealText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  int _lineCount = 1;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _totalDuration(1))
      ..forward();
    // Re-split lines once web fonts finish loading — the initial layout may
    // have measured with a fallback font.
    PaintingBinding.instance.systemFonts.addListener(_onFontsChanged);
  }

  void _onFontsChanged() {
    if (mounted) setState(() {});
  }

  Duration _totalDuration(int lines) =>
      widget.lineDuration + widget.stagger * (lines - 1);

  @override
  void dispose() {
    PaintingBinding.instance.systemFonts.removeListener(_onFontsChanged);
    _controller.dispose();
    super.dispose();
  }

  /// Splits [widget.text] into the lines it will wrap into at [maxWidth],
  /// using greedy word measurement. (TextPainter.getLineBoundary is not
  /// reliable on the web/canvaskit backend, so lines are measured per word.)
  List<String> _layoutLines(double maxWidth) {
    final words = widget.text.split(' ').where((w) => w.isNotEmpty);
    final lines = <String>[];
    var current = '';
    for (final word in words) {
      final candidate = current.isEmpty ? word : '$current $word';
      if (current.isNotEmpty && _measure(candidate) > maxWidth) {
        lines.add(current);
        current = word;
      } else {
        current = candidate;
      }
    }
    if (current.isNotEmpty) lines.add(current);
    return lines.isEmpty ? [widget.text] : lines;
  }

  double _measure(String s) {
    final painter = TextPainter(
      text: TextSpan(text: s, style: widget.style),
      textDirection: TextDirection.ltr,
      maxLines: 1,
    )..layout();
    final width = painter.width;
    painter.dispose();
    return width;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final lines = _layoutLines(constraints.maxWidth);
        if (lines.length != _lineCount) {
          _lineCount = lines.length;
          _controller.duration = _totalDuration(_lineCount);
          if (_controller.isAnimating) _controller.forward();
        }
        final total = _controller.duration!.inMilliseconds.toDouble();
        final lineMs = widget.lineDuration.inMilliseconds.toDouble();
        final staggerMs = widget.stagger.inMilliseconds.toDouble();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var i = 0; i < lines.length; i++)
              ClipRect(
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    final begin = (i * staggerMs) / total;
                    final end = (i * staggerMs + lineMs) / total;
                    final t = CurvedAnimation(
                      parent: _controller,
                      curve: Interval(begin, end, curve: Curves.easeOutCubic),
                    ).value;
                    return FractionalTranslation(
                      translation: Offset(0, 1.0 - t),
                      child: Opacity(opacity: t, child: child),
                    );
                  },
                  child: Text(lines[i], style: widget.style),
                ),
              ),
          ],
        );
      },
    );
  }
}
