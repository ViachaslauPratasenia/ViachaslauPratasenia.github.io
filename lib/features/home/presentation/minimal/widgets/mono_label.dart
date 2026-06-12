import 'package:flutter/material.dart';
import 'package:personal_website/theme/minimal/minimal_colors.dart';
import 'package:personal_website/theme/minimal/minimal_typography.dart';

/// Uppercase, mono, letter-tracked label (.lbl / .av / .co / nav items).
class MonoLabel extends StatelessWidget {
  final String text;
  final Color? color;
  final double size;
  final bool showDot;
  final FontWeight weight;

  const MonoLabel(
    this.text, {
    super.key,
    this.color,
    this.size = 11,
    this.showDot = false,
    this.weight = FontWeight.w400,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.minimal;
    final style = MinimalTypography.monoLabel(color ?? colors.muted, size: size, weight: weight);
    if (!showDot) return Text(text.toUpperCase(), style: style);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 5,
          height: 5,
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(color: colors.dot, shape: BoxShape.circle),
        ),
        Text(text.toUpperCase(), style: style),
      ],
    );
  }
}
