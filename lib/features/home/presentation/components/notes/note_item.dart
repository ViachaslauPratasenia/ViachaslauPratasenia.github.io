import 'package:firebase_analytics_web/firebase_analytics_web.dart';
import 'package:flutter/material.dart';
import 'package:personal_website/const/assets/assets.gen.dart';
import 'package:personal_website/core/orientation_provider.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/theme/app_colors.dart';
import 'package:personal_website/theme/theme_controller.dart';
import 'package:url_launcher/url_launcher_string.dart';

class NoteItem extends StatelessWidget {
  final BlogPost note;

  const NoteItem({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    final orientation = OrientationProvider.of(context).orientation;

    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: () {
        FirebaseAnalyticsWeb().logEvent(name: 'open_blog_post', parameters: {
          'blog_post_title': note.title,
          'blog_post_link': note.link,
        });
        launchUrlString(note.link);
      },
      child: Container(
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
              note.title,
              style: context.textTheme.titleLarge?.copyWith(color: AppColors.textPrimary),
            ),
            const SizedBox(height: 12),
            Text(
              note.description,
              style: context.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
            ),
            if (orientation == Orientation.landscape) const Spacer() else const SizedBox(height: 32),
            Wrap(
              direction: Axis.horizontal,
              runSpacing: 8,
              spacing: 16,
              children: List.generate(
                note.tags.length,
                (index) => Text(
                  note.tags[index],
                  style: context.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
