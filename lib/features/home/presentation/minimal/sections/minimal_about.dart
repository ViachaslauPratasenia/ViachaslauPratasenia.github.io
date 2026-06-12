import 'package:flutter/material.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/theme/minimal/minimal_colors.dart';
import 'package:personal_website/theme/minimal/minimal_typography.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/minimal_section.dart';

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(lede, style: MinimalTypography.lede(colors.fg)),
          const SizedBox(height: 28),
          for (final para in prose) ...[
            Text(para, style: MinimalTypography.prose(colors.muted)),
            const SizedBox(height: 16),
          ],
        ],
      ),
    );
  }
}
