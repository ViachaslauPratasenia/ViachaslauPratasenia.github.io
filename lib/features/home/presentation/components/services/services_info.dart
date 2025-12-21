import 'package:flutter/material.dart';
import 'package:personal_website/core/orientation_provider.dart';
import 'package:personal_website/core/widgets/fade_in_slide_animation.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/features/home/presentation/components/base_block.dart';
import 'package:personal_website/features/home/presentation/components/section_header.dart';
import 'package:personal_website/features/home/presentation/components/visibility_block.dart';
import 'package:personal_website/theme/app_colors.dart';
import 'package:personal_website/theme/theme_controller.dart';

class ServicesInfo extends StatelessWidget {
  final DeveloperProfile developerProfile;

  const ServicesInfo({super.key, required this.developerProfile});

  @override
  Widget build(BuildContext context) {
    final orientation = OrientationProvider.of(context).orientation;
    final isLandscape = orientation == Orientation.landscape;

    // Debug: Check if services are loaded
    if (developerProfile.services.isEmpty) {
      return VisibilityBlock(
        blockKey: const Key('services-info'),
        child: BaseBlock(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInSlideAnimation(
                delay: const Duration(milliseconds: 100),
                child: const SectionHeader(
                  index: '02.',
                  title: 'What I Can Do For You',
                ),
              ),
              const SizedBox(height: 48),
              Center(
                child: Text(
                  'No services available. Please check profile.json',
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return VisibilityBlock(
      blockKey: const Key('services-info'),
      child: BaseBlock(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInSlideAnimation(
              delay: const Duration(milliseconds: 100),
              child: const SectionHeader(
                index: '02.',
                title: 'What I Can Do For You',
              ),
            ),
            const SizedBox(height: 48),
            LayoutBuilder(
              builder: (context, constraints) {
                if (isLandscape) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                      childAspectRatio: 1.8,
                    ),
                    itemCount: developerProfile.services.length,
                    itemBuilder: (context, index) {
                      return FadeInSlideAnimation(
                        delay: Duration(milliseconds: 200 + (index * 100)),
                        child: _ServiceCard(service: developerProfile.services[index]),
                      );
                    },
                  );
                } else {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: developerProfile.services.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 24),
                    itemBuilder: (context, index) {
                      return FadeInSlideAnimation(
                        delay: Duration(milliseconds: 200 + (index * 100)),
                        child: _ServiceCard(service: developerProfile.services[index]),
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ServiceCard extends StatefulWidget {
  final Service service;

  const _ServiceCard({required this.service});

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _isHovered = false;

  void _handleEnter() {
    if (mounted) {
      setState(() => _isHovered = true);
    }
  }

  void _handleExit() {
    if (mounted) {
      setState(() => _isHovered = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _handleEnter(),
      onExit: (_) => _handleExit(),
      child: TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        tween: Tween<double>(begin: 0, end: _isHovered ? 1 : 0),
        builder: (context, value, child) {
          return Transform.translate(
            offset: Offset(0, -value * 4),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.cardBackground.withValues(alpha: 0.6 + (value * 0.4)),
                    AppColors.cardBackground.withValues(alpha: 0.4 + (value * 0.5)),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.2 + (value * 0.3)),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.glowPrimary.withValues(alpha: value * 0.3),
                    blurRadius: 20 * value,
                    offset: Offset(0, 10 * value),
                  ),
                ],
              ),
              child: child,
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon with gradient background
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary.withValues(alpha: 0.2),
                    AppColors.secondary.withValues(alpha: 0.2),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: Icon(
                _getIconData(widget.service.icon),
                size: 28,
                color: AppColors.accent,
              ),
            ),
            const SizedBox(height: 16),

            // Title
            Text(
              widget.service.title,
              style: context.textTheme.titleMedium?.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),

            // Description
            Text(
              widget.service.description,
              style: context.textTheme.bodySmall?.copyWith(
                color: AppColors.textSecondary,
                height: 1.5,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),

            // Technologies
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: widget.service.technologies.map((tech) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.3),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    tech,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'phone_android':
        return Icons.phone_android;
      case 'language':
        return Icons.language;
      case 'business':
        return Icons.business;
      case 'shopping_cart':
        return Icons.shopping_cart;
      case 'desktop_windows':
        return Icons.desktop_windows;
      case 'brush':
        return Icons.brush;
      default:
        return Icons.star;
    }
  }
}
