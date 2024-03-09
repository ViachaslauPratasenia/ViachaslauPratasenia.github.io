import 'package:flutter/material.dart';
import 'package:personal_website/const/assets/assets.gen.dart';
import 'package:personal_website/theme/app_colors.dart';
import 'package:personal_website/theme/theme_controller.dart';

class LinkItem extends StatelessWidget {
  final String title;
  final String url;

  const LinkItem({super.key, required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            title,
            style: context.textTheme.bodyMedium?.copyWith(color: AppColors.primary),
          ),
        ),
        const SizedBox(width: 2),
        Assets.svg.icExternalLink.svg(
          width: 12,
          height: 12,
          colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
        ),
        // Icon(Icons.external)
      ],
    );
  }
}
