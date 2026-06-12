import 'package:flutter/material.dart';
import 'package:personal_website/const/assets/assets.gen.dart';
import 'package:personal_website/core/orientation_provider.dart';
import 'package:personal_website/core/widgets/animated_skill_chip.dart';
import 'package:personal_website/core/widgets/fade_in_slide_animation.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/features/home/presentation/components/base_block.dart';
import 'package:personal_website/features/home/presentation/components/section_header.dart';
import 'package:personal_website/features/home/presentation/components/visibility_block.dart';
import 'package:personal_website/theme/app_colors.dart';
import 'package:personal_website/theme/theme_controller.dart';

class ModernProfileInfo extends StatelessWidget {
  final DeveloperProfile developerProfile;

  const ModernProfileInfo({super.key, required this.developerProfile});

  @override
  Widget build(BuildContext context) {
    final orientation = OrientationProvider.of(context).orientation;

    return VisibilityBlock(
      blockKey: const Key('profile-info'),
      child: BaseBlock(
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: LayoutBuilder(builder: (context, constraints) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInSlideAnimation(
                      delay: const Duration(milliseconds: 100),
                      child: const SectionHeader(index: '01.', title: 'About me'),
                    ),
                    const SizedBox(height: 24),
                    FadeInSlideAnimation(
                      delay: const Duration(milliseconds: 200),
                      child: Text(
                        developerProfile.aboutMe.title,
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: AppColors.textSecondary,
                          height: 1.8,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    FadeInSlideAnimation(
                      delay: const Duration(milliseconds: 300),
                      child: Text(
                        'Recent Technologies',
                        style: context.textTheme.titleMedium?.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: orientation == Orientation.landscape
                          ? constraints.maxWidth * 0.9
                          : constraints.maxWidth,
                      child: Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: List.generate(
                          developerProfile.recentTechnologies.length,
                          (index) => FadeInSlideAnimation(
                            delay: Duration(milliseconds: 400 + (index * 50)),
                            child: AnimatedSkillChip(
                              skill: developerProfile.recentTechnologies[index],
                              index: index,
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (orientation == Orientation.portrait) ...[
                      const SizedBox(height: 40),
                      Center(
                        child: FadeInSlideAnimation(
                          delay: const Duration(milliseconds: 600),
                          child: _AnimatedProfileImage(
                            constraints: constraints,
                          ),
                        ),
                      ),
                    ],
                  ],
                );
              }),
            ),
            if (orientation == Orientation.landscape) ...[
              const SizedBox(width: 32),
              Expanded(
                flex: 4,
                child: LayoutBuilder(builder: (context, constraints) {
                  return FadeInSlideAnimation(
                    delay: const Duration(milliseconds: 400),
                    slideOffset: const Offset(50, 0),
                    child: Center(
                      child: _AnimatedProfileImage(
                        constraints: constraints,
                      ),
                    ),
                  );
                }),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _AnimatedProfileImage extends StatefulWidget {
  final BoxConstraints constraints;

  const _AnimatedProfileImage({required this.constraints});

  @override
  State<_AnimatedProfileImage> createState() => _AnimatedProfileImageState();
}

class _AnimatedProfileImageState extends State<_AnimatedProfileImage> {
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        height: widget.constraints.maxWidth * 0.75,
        width: widget.constraints.maxWidth * 0.75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: _isHovered ? 0.4 : 0.2),
              blurRadius: _isHovered ? 40 : 20,
              spreadRadius: _isHovered ? 5 : 0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Assets.images.profilePhoto.image(
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              AnimatedOpacity(
                opacity: _isHovered ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.primary.withValues(alpha: 0.2),
                        AppColors.secondary.withValues(alpha: 0.2),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

