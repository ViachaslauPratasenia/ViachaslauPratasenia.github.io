import 'package:flutter/material.dart';
import 'package:personal_website/core/orientation_provider.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';

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
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.tertiary,
                fontSize: orientation == Orientation.landscape
                    ? Theme.of(context).textTheme.headlineSmall?.fontSize
                    : Theme.of(context).textTheme.bodyLarge?.fontSize,
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
    final textTheme = (OrientationProvider.of(context).orientation == Orientation.landscape
            ? Theme.of(context).textTheme.bodyMedium
            : Theme.of(context).textTheme.bodySmall)
        ?.copyWith(
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.tertiary,
    );
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(32),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: RichText(
        text: TextSpan(
          text: language,
          style: textTheme,
          children: [
            if (level.isNotEmpty)
              TextSpan(text: ' $level', style: textTheme?.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
