import 'package:flutter/material.dart';
import 'package:personal_website/core/widgets/animated_card.dart';
import 'package:personal_website/core/widgets/fade_in_slide_animation.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/theme/app_colors.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ModernProjectCard extends StatelessWidget {
  final Project project;
  final int index;

  const ModernProjectCard({
    super.key,
    required this.project,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final isEven = index % 2 == 0;

    return FadeInSlideAnimation(
      delay: Duration(milliseconds: 200 + (index * 100)),
      slideOffset: Offset(isEven ? -30 : 30, 0),
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
    final isEven = index % 2 == 0;

    return Stack(
      children: [
        // Background Image
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: AppColors.cardBackground,
              child: project.image.isNotEmpty
                  ? Opacity(
                      opacity: 0.15,
                      child: Image.network(
                        project.image,
                        fit: BoxFit.cover,
                      ),
                    )
                  : null,
            ),
          ),
        ),

        // Content
        Padding(
          padding: const EdgeInsets.all(40),
          child: Row(
            children: [
              if (isEven) ...[
                Expanded(flex: 5, child: _buildContent(context)),
                const SizedBox(width: 40),
                Expanded(flex: 4, child: _buildTechStack()),
              ] else ...[
                Expanded(flex: 4, child: _buildTechStack()),
                const SizedBox(width: 40),
                Expanded(flex: 5, child: _buildContent(context)),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.cardBackground.withValues(alpha: 0.9),
            AppColors.cardBackground.withValues(alpha: 0.7),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.glowPrimary,
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildContent(context),
          const SizedBox(height: 24),
          _buildTechStack(),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Featured label
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.accent, AppColors.primary],
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Text(
            'FEATURED PROJECT',
            style: TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Title
        InkWell(
          onTap: () {
            if (project.link.isNotEmpty) {
              launchUrlString(project.link);
            }
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  project.title,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    height: 1.2,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.open_in_new,
                color: AppColors.accent,
                size: 20,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Description
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.background.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
          child: Text(
            project.description,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 16,
              height: 1.7,
            ),
          ),
        ),

        // Links
        if (project.link.isNotEmpty && project.linkName.isNotEmpty) ...[
          const SizedBox(height: 20),
          InkWell(
            onTap: () => launchUrlString(project.link),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.5),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.link,
                    color: AppColors.primary,
                    size: 16,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    project.linkName,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildTechStack() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tech Stack',
          style: TextStyle(
            color: AppColors.accent,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: project.tags.map((tech) {
            return Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.secondary.withValues(alpha: 0.2),
                    AppColors.primary.withValues(alpha: 0.1),
                  ],
                ),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.secondary.withValues(alpha: 0.4),
                  width: 1,
                ),
              ),
              child: Text(
                tech,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

