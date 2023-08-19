import 'package:flutter/material.dart';
import 'package:personal_website/theme/theme.dart';
import 'package:personal_website/theme/typografy.dart';

class SkillElement extends StatelessWidget {
  final String skillName;

  const SkillElement({super.key, required this.skillName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.colors.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        skillName,
        style: AppTheme.typography.standard.regular.accent,
      ),
    );
  }
}
