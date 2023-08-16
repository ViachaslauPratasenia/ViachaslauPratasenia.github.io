import 'package:flutter/material.dart';
import 'package:personal_website/theme/theme.dart';
import 'package:personal_website/theme/typografy.dart';

class EducationBlock extends StatelessWidget {
  const EducationBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Education',
          style: AppTheme.typography.huge.bold.accent,
        ),
        const SizedBox(height: 4),
        Text(
          'Belarusian State University of Informatics and\nRadioelectronics',
          style: AppTheme.typography.semiLarge.regular.accent,
        ),
        const SizedBox(height: 4),
        Text(
          'Electronic computing machines',
          style: AppTheme.typography.standard.regular.textBase,
        ),
      ],
    );
  }
}
