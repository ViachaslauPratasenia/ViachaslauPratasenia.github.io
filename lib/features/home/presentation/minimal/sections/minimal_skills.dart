import 'package:flutter/material.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/theme/minimal/minimal_colors.dart';
import 'package:personal_website/theme/minimal/minimal_typography.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/minimal_section.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/mono_label.dart';

class MinimalSkills extends StatelessWidget {
  final DeveloperProfile profile;

  const MinimalSkills({super.key, required this.profile});

  // Static lists per spec (not in profile model).
  static const _platforms = ['iOS', 'Android', 'Web', 'Windows', 'macOS', 'Linux'];
  static const _tooling = ['Xcode', 'Android Studio', 'Figma', 'Firebase', 'GCP'];

  @override
  Widget build(BuildContext context) {
    final services = profile.services.map((s) => s.title).toList();
    return MinimalSection(
      label: 'Skills & Services',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _group(context, 'Recently', profile.recentTechnologies),
          _group(context, 'Platforms', _platforms),
          _group(context, 'Services', services),
          _group(context, 'Tooling', _tooling, last: true),
        ],
      ),
    );
  }

  Widget _group(BuildContext context, String title, List<String> items, {bool last = false}) {
    final colors = context.minimal;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 22),
      decoration: BoxDecoration(
        border: last ? null : Border(bottom: BorderSide(color: colors.hair)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MonoLabel(title, color: colors.faint, size: 10.5),
          const SizedBox(height: 12),
          Text.rich(
            TextSpan(
              style: MinimalTypography.heading(colors.fg, size: 16),
              children: [
                for (var i = 0; i < items.length; i++) ...[
                  TextSpan(text: items[i]),
                  if (i < items.length - 1)
                    TextSpan(text: '  ·  ', style: TextStyle(color: colors.faint)),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
