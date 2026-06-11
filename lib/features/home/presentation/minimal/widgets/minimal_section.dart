import 'package:flutter/material.dart';
import 'package:personal_website/theme/minimal/minimal_colors.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/mono_label.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/reveal_on_scroll.dart';

/// Standard content section: top hairline, label with dot, revealed content.
/// Constrained to 780px wide with responsive horizontal padding.
class MinimalSection extends StatelessWidget {
  final String? label;
  final Widget child;

  const MinimalSection({super.key, this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    final colors = context.minimal;
    final narrow = MediaQuery.sizeOf(context).width < 600;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: colors.hair)),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 780),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: narrow ? 24 : 32,
              vertical: narrow ? 56 : 90,
            ),
            child: RevealOnScroll(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (label != null) ...[
                    MonoLabel(label!, color: colors.faint, showDot: true),
                    const SizedBox(height: 40),
                  ],
                  child,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
