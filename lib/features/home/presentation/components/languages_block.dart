import 'package:flutter/material.dart';
import 'package:personal_website/core/orientation_provider.dart';
import 'package:personal_website/features/home/data/developer_profile.dart';
import 'package:personal_website/theme/theme.dart';
import 'package:personal_website/theme/typografy.dart';

class LanguagesBlock extends StatelessWidget {
  final List<Language> languages;

  const LanguagesBlock({super.key, required this.languages});

  @override
  Widget build(BuildContext context) {
    final orientation = OrientationProvider.of(context).orientation;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Languages',
          style: AppTheme.typography.bold.accent.copyWith(
            fontSize: orientation == Orientation.landscape
                ? AppTheme.typography.huge.fontSize
                : AppTheme.typography.semiLarge.fontSize,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          direction: Axis.horizontal,
          spacing: 12,
          runSpacing: 8,
          children: List.generate(
            languages.length,
            (index) => _LanguageBlock(
              language: languages[index].name,
              level: languages[index].level,
            ),
          ),
        )
      ],
    );
  }
}

class _LanguageBlock extends StatelessWidget {
  final String language;
  final String level;

  const _LanguageBlock({required this.language, required this.level});

  @override
  Widget build(BuildContext context) {
    final fontSize = OrientationProvider.of(context).orientation == Orientation.landscape
        ? AppTheme.typography.standard.fontSize
        : AppTheme.typography.small.fontSize;
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.colors.primary,
        borderRadius: BorderRadius.circular(32),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: RichText(
        text: TextSpan(
          text: language,
          style: AppTheme.typography.regular.accent.copyWith(fontSize: fontSize),
          children: [
            if (level.isNotEmpty)
              TextSpan(
                text: ' $level',
                style: AppTheme.typography.bold.accent.copyWith(fontSize: fontSize),
              ),
          ],
        ),
      ),
    );
  }
}
