import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:personal_website/theme/minimal/minimal_colors.dart';
import 'package:personal_website/theme/minimal/minimal_typography.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/hover_builder.dart';

/// Nav item labels, in order. Index passed back via onItemTap.
const kNavItems = ['About', 'Work', 'Projects', 'Writing', 'Contact'];

class MinimalNavBar extends StatelessWidget {
  final bool isDark;
  final VoidCallback onToggleTheme;
  final ValueChanged<int> onItemTap;

  const MinimalNavBar({
    super.key,
    required this.isDark,
    required this.onToggleTheme,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.minimal;
    final narrow = MediaQuery.sizeOf(context).width < 640;

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Container(
          height: 72,
          color: colors.navbg,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 780),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: narrow ? 24 : 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: RichText(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          style: MinimalTypography.heading(colors.fg, size: 14)
                              .copyWith(fontWeight: FontWeight.w600),
                          children: [
                            const TextSpan(text: 'Viachaslau Pratasenia'),
                            TextSpan(
                                text: '.', style: TextStyle(color: colors.dot)),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        if (!narrow)
                          for (var i = 0; i < kNavItems.length; i++)
                            Padding(
                              padding: const EdgeInsets.only(left: 24),
                              child: HoverBuilder(
                                builder: (context, hovering) => GestureDetector(
                                  onTap: () => onItemTap(i),
                                  child: Text(
                                    kNavItems[i].toUpperCase(),
                                    style: MinimalTypography.monoLabel(
                                        hovering ? colors.fg : colors.muted),
                                  ),
                                ),
                              ),
                            ),
                        const SizedBox(width: 24),
                        _toggle(context),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _toggle(BuildContext context) {
    final colors = context.minimal;
    return GestureDetector(
      key: const Key('theme-toggle'),
      onTap: onToggleTheme,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: colors.hair),
          borderRadius: BorderRadius.circular(999),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 11,
              height: 11,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: colors.muted, width: 1.5),
                gradient: LinearGradient(
                  colors: [colors.muted, colors.muted, Colors.transparent, Colors.transparent],
                  stops: const [0, 0.5, 0.5, 1],
                ),
              ),
            ),
            const SizedBox(width: 7),
            Text(isDark ? 'Light' : 'Dark',
                style: MinimalTypography.monoLabel(colors.muted)),
          ],
        ),
      ),
    );
  }
}
