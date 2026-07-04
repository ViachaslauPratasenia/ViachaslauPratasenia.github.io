import 'package:flutter/material.dart';
import 'package:personal_website/theme/minimal/minimal_colors.dart';
import 'package:personal_website/theme/minimal/minimal_typography.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/reveal_on_scroll.dart';

/// Standard content section: top hairline, editorial two-column layout.
/// Left column holds the mono index (`01`) and a large display title;
/// content sits right. Collapses to a single column under 900px.
class MinimalSection extends StatelessWidget {
  final String? label;

  /// 1-based section number rendered as `01`, `02`… next to the label.
  final int? index;
  final Widget child;

  const MinimalSection({super.key, this.label, this.index, required this.child});

  static const maxWidth = 1100.0;
  static const leftColumnWidth = 250.0;

  @override
  Widget build(BuildContext context) {
    final colors = context.minimal;
    final width = MediaQuery.sizeOf(context).width;
    final narrow = width < 600;
    final twoColumn = width >= 900 && label != null;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: colors.hair)),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: maxWidth),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: narrow ? 24 : 32,
              vertical: narrow ? 56 : 96,
            ),
            child: RevealOnScroll(
              child: twoColumn ? _twoColumn(context) : _singleColumn(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _twoColumn(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: leftColumnWidth, child: _header(context)),
        const SizedBox(width: 56),
        Expanded(child: child),
      ],
    );
  }

  Widget _singleColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          _header(context),
          const SizedBox(height: 36),
        ],
        child,
      ],
    );
  }

  /// Index row (`01` + accent dot) above the large display title.
  Widget _header(BuildContext context) {
    final colors = context.minimal;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (index != null) ...[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                index!.toString().padLeft(2, '0'),
                style: MinimalTypography.monoLabel(colors.dot, size: 11),
              ),
              const SizedBox(width: 10),
              Container(width: 22, height: 1, color: colors.hair),
            ],
          ),
          const SizedBox(height: 16),
        ],
        Text(
          label!,
          style: MinimalTypography.sectionTitle(colors.fg, size: 30),
        ),
      ],
    );
  }
}
