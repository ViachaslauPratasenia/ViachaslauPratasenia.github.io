import 'package:flutter/material.dart';
import 'package:personal_website/theme/app_colors.dart';
import 'package:personal_website/theme/theme_controller.dart';

class SectionHeader extends StatelessWidget {
  final String index;
  final String title;

  const SectionHeader({super.key, required this.index, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: Text(
                index,
                style: context.textTheme.bodyMedium?.copyWith(color: AppColors.primary),
              ),
            ),
            SizedBox(width: 8),
            Text(
              title,
              style: context.textTheme.titleMedium?.copyWith(color: AppColors.textPrimary),
            ),
          ],
        ),
        SizedBox(width: 8),
        Expanded(
          child: Container(
            height: 1,
            color: AppColors.textTertiary,
          ),
        ),
      ],
    );
  }
}
