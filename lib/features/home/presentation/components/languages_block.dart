import 'package:flutter/material.dart';
import 'package:personal_website/features/home/data/developer_profile.dart';
import 'package:personal_website/theme/theme.dart';
import 'package:personal_website/theme/typografy.dart';

class LanguagesBlock extends StatelessWidget {
  final List<Language> languages;

  const LanguagesBlock({super.key, required this.languages});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Languages',
          style: AppTheme.typography.huge.bold.accent,
        ),
        const SizedBox(height: 16),
        Wrap(
          direction: Axis.horizontal,
          spacing: 16,
          runSpacing: 12,
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
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.colors.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: RichText(
        text: TextSpan(
          text: language,
          style: AppTheme.typography.standard.regular.accent,
          children: [
            if (level.isNotEmpty)
              TextSpan(
                text: ' $level',
                style: AppTheme.typography.standard.bold.accent,
              ),
          ],
        ),
      ),
    );
  }
}
