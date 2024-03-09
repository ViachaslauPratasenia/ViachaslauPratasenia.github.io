import 'package:flutter/material.dart';
import 'package:personal_website/theme/app_colors.dart';
import 'package:personal_website/theme/theme_controller.dart';

class TechItem extends StatelessWidget {
  final String title;

  const TechItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.arrow_right, color: AppColors.primary, size: 20),
        const SizedBox(width: 8),
        Text(
          title,
          style: context.textTheme.bodyLarge?.copyWith(color: AppColors.textTertiary, height: 1),
        ),
      ],
    );
  }
}
