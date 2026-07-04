import 'package:flutter/material.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/theme/minimal/minimal_colors.dart';
import 'package:personal_website/theme/minimal/minimal_typography.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/minimal_section.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/mono_label.dart';

class MinimalAbout extends StatelessWidget {
  final DeveloperProfile profile;

  const MinimalAbout({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final colors = context.minimal;
    final lede = profile.aboutMe.title;
    final prose = profile.aboutMe.text
        .split('\n')
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toList();

    return MinimalSection(
      label: 'About',
      index: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(lede, style: MinimalTypography.lede(colors.fg)),
          const SizedBox(height: 28),
          for (final para in prose) ...[
            Text(para, style: MinimalTypography.prose(colors.muted)),
            const SizedBox(height: 16),
          ],
          const SizedBox(height: 14),
          MonoLabel('Currently working with', color: colors.faint, size: 10.5),
          const SizedBox(height: 14),
          Wrap(
            spacing: 26,
            runSpacing: 12,
            children: [
              for (final tech in profile.skills.recently) _tech(context, tech),
            ],
          ),
        ],
      ),
    );
  }

  /// Accent-dotted mono item — the techy counterpart to a bullet list.
  Widget _tech(BuildContext context, String name) {
    final colors = context.minimal;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 4,
          height: 4,
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(color: colors.dot, shape: BoxShape.circle),
        ),
        Text(name,
            style: MinimalTypography.mono(colors.fg).copyWith(fontSize: 12.5)),
      ],
    );
  }
}
