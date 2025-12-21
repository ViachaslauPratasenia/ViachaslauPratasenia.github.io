import 'package:firebase_analytics_web/firebase_analytics_web.dart';
import 'package:flutter/material.dart';
import 'package:personal_website/core/widgets/animated_card.dart';
import 'package:personal_website/core/widgets/fade_in_slide_animation.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/theme/app_colors.dart';
import 'package:personal_website/theme/theme_controller.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ModernNoteCard extends StatelessWidget {
  final BlogPost note;
  final int index;

  const ModernNoteCard({
    super.key,
    required this.note,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInSlideAnimation(
      delay: Duration(milliseconds: 200 + (index * 100)),
      slideOffset: const Offset(0, 30),
      child: AnimatedCard(
        child: Container(
          margin: const EdgeInsets.only(bottom: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 800;

              if (isWide) {
                return _buildWideLayout(context);
              } else {
                return _buildNarrowLayout(context);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return InkWell(
      onTap: () => _openBlogPost(),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.cardBackground.withValues(alpha: 0.6),
              AppColors.cardBackground.withValues(alpha: 0.4),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.primary.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left side - Date badge
            _buildDateBadge(context),
            const SizedBox(width: 32),
            // Right side - Content
            Expanded(child: _buildContent(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    return InkWell(
      onTap: () => _openBlogPost(),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.cardBackground.withValues(alpha: 0.6),
              AppColors.cardBackground.withValues(alpha: 0.4),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.primary.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDateBadge(context),
            const SizedBox(height: 24),
            _buildContent(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDateBadge(BuildContext context) {
    // Parse the date string (e.g., "December 12, 2023")
    final dateParts = note.date.split(' ');
    final month = dateParts.isNotEmpty ? dateParts[0].substring(0, 3).toUpperCase() : 'JAN';
    final day = dateParts.length > 1 ? dateParts[1].replaceAll(',', '') : '01';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary.withValues(alpha: 0.3),
            AppColors.secondary.withValues(alpha: 0.3),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.5),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Text(
            month,
            style: context.textTheme.bodySmall?.copyWith(
              color: AppColors.accent,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            day,
            style: context.textTheme.headlineSmall?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Article badge
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.accent.withValues(alpha: 0.3),
                    AppColors.primary.withValues(alpha: 0.3),
                  ],
                ),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: AppColors.accent.withValues(alpha: 0.5),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.article_outlined,
                    size: 14,
                    color: AppColors.accent,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'ARTICLE',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: AppColors.accent,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward,
              color: AppColors.primary,
              size: 20,
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Title
        Text(
          note.title,
          style: context.textTheme.titleLarge?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
            fontSize: 22,
            height: 1.3,
          ),
        ),
        const SizedBox(height: 12),

        // Description
        Text(
          note.description,
          style: context.textTheme.bodyMedium?.copyWith(
            color: AppColors.textSecondary,
            height: 1.6,
            fontSize: 15,
          ),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 20),

        // Tags
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: note.tags.map((tag) {
            return Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: AppColors.secondary.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: AppColors.secondary.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: Text(
                tag,
                style: context.textTheme.bodySmall?.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }).toList(),
        ),

        // Read more link
        const SizedBox(height: 16),
        Row(
          children: [
            Icon(
              Icons.schedule,
              size: 14,
              color: AppColors.textTertiary,
            ),
            const SizedBox(width: 4),
            Text(
              '5 min read',
              style: context.textTheme.bodySmall?.copyWith(
                color: AppColors.textTertiary,
                fontSize: 12,
              ),
            ),
            const Spacer(),
            Text(
              'Read on Medium',
              style: context.textTheme.bodySmall?.copyWith(
                color: AppColors.primary,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.open_in_new,
              size: 14,
              color: AppColors.primary,
            ),
          ],
        ),
      ],
    );
  }

  void _openBlogPost() {
    FirebaseAnalyticsWeb().logEvent(name: 'open_blog_post', parameters: {
      'blog_post_title': note.title,
      'blog_post_link': note.link,
    });
    launchUrlString(note.link);
  }
}

