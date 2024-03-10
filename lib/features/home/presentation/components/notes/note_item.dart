import 'package:flutter/material.dart';
import 'package:personal_website/const/assets/assets.gen.dart';
import 'package:personal_website/theme/app_colors.dart';
import 'package:personal_website/theme/theme_controller.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.backgroundSecondary,
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.folder_outlined, size: 40, color: AppColors.primary),
              Assets.svg.icExternalLink.svg(
                width: 24,
                height: 24,
                colorFilter: const ColorFilter.mode(AppColors.textPrimary, BlendMode.srcIn),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Time to Have More Fun',
            style: context.textTheme.titleLarge?.copyWith(color: AppColors.textPrimary),
          ),
          const SizedBox(height: 12),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non condimentum massa. Aenean diam velit, maximus sed lacus et, euismod commodo sem. Mauris massa ipsum, consectetur in neque sed, rhoncus tincidunt diam.',
            style: context.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
          ),
          const Spacer(),
          SizedBox(
            height: 24,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(width: 16),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) => Text(
                'Text',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}