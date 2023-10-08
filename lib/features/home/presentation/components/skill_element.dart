import 'package:flutter/material.dart';

class SkillElement extends StatelessWidget {
  final String skillName;

  const SkillElement({super.key, required this.skillName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(32),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        skillName,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.normal,
              color: Theme.of(context).colorScheme.tertiary,
            ),
      ),
    );
  }
}
