import 'dart:ui';
import 'package:flutter/foundation.dart';
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

  /// Index into [kNavItems] of the section currently in view, -1 for none.
  final ValueListenable<int> activeIndex;

  /// Reading progress 0..1, drawn as a hairline-thin accent bar on top.
  final ValueListenable<double> progress;

  const MinimalNavBar({
    super.key,
    required this.isDark,
    required this.onToggleTheme,
    required this.onItemTap,
    required this.activeIndex,
    required this.progress,
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
          child: Column(
            children: [
              _progressBar(context),
              Expanded(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1100),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: narrow ? 24 : 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: RichText(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                style: MinimalTypography.heading(colors.fg,
                                        size: 14)
                                    .copyWith(fontWeight: FontWeight.w600),
                                children: [
                                  const TextSpan(
                                      text: 'Viachaslau Pratasenia'),
                                  TextSpan(
                                      text: '.',
                                      style: TextStyle(color: colors.dot)),
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
                                    child: _item(context, i),
                                  ),
                              if (!narrow) const SizedBox(width: 24),
                              _toggle(context),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 2px accent reading-progress bar hugging the top edge.
  Widget _progressBar(BuildContext context) {
    final colors = context.minimal;
    return ValueListenableBuilder<double>(
      valueListenable: progress,
      builder: (context, value, _) => Align(
        alignment: Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: value.clamp(0.0, 1.0),
          child: Container(height: 2, color: colors.dot),
        ),
      ),
    );
  }

  /// Nav item with an accent dot marking the active section.
  Widget _item(BuildContext context, int i) {
    final colors = context.minimal;
    return ValueListenableBuilder<int>(
      valueListenable: activeIndex,
      builder: (context, active, _) => HoverBuilder(
        builder: (context, hovering) => GestureDetector(
          onTap: () => onItemTap(i),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                width: active == i ? 5 : 0,
                height: 5,
                margin: EdgeInsets.only(right: active == i ? 7 : 0),
                decoration:
                    BoxDecoration(color: colors.dot, shape: BoxShape.circle),
              ),
              Text(
                kNavItems[i].toUpperCase(),
                style: MinimalTypography.monoLabel(
                    hovering || active == i ? colors.fg : colors.muted),
              ),
            ],
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
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
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
