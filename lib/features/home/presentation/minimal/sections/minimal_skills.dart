import 'package:flutter/material.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/theme/minimal/minimal_colors.dart';
import 'package:personal_website/theme/minimal/minimal_typography.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/minimal_section.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/mono_label.dart';

/// Three mono columns: platforms / services / tooling. "Recently" lives in
/// the About section as "Currently working with".
class MinimalSkills extends StatelessWidget {
  final DeveloperProfile profile;

  const MinimalSkills({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 700;
    final groups = [
      ('Platforms', profile.skills.platforms),
      ('Services', profile.skills.services),
      ('Tooling', profile.skills.tooling),
    ];

    return MinimalSection(
      label: 'Skills',
      index: 3,
      child: wide
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < groups.length; i++) ...[
                  if (i > 0) const SizedBox(width: 40),
                  Expanded(
                      child: _group(context, groups[i].$1, groups[i].$2)),
                ],
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < groups.length; i++) ...[
                  if (i > 0) const SizedBox(height: 32),
                  _group(context, groups[i].$1, groups[i].$2),
                ],
              ],
            ),
    );
  }

  Widget _group(BuildContext context, String title, List<String> items) {
    final colors = context.minimal;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MonoLabel(title, color: colors.faint, size: 10.5),
        const SizedBox(height: 14),
        for (final item in items)
          Padding(
            padding: const EdgeInsets.only(bottom: 9),
            child: Text(item,
                style:
                    MinimalTypography.mono(colors.fg).copyWith(fontSize: 12.5)),
          ),
      ],
    );
  }
}
