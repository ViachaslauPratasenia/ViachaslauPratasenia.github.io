import 'package:flutter/material.dart';
import 'package:personal_website/core/orientation_provider.dart';
import 'package:personal_website/core/widgets/fade_in_slide_animation.dart';
import 'package:personal_website/core/widgets/glowing_button.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/features/home/presentation/components/base_block.dart';
import 'package:personal_website/theme/app_colors.dart';
import 'package:personal_website/theme/theme_controller.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ModernAboutInfo extends StatelessWidget {
  final DeveloperProfile developerProfile;
  final VoidCallback? onViewWorkPressed;

  const ModernAboutInfo({
    super.key,
    required this.developerProfile,
    this.onViewWorkPressed,
  });

  @override
  Widget build(BuildContext context) {
    final orientation = OrientationProvider.of(context).orientation;
    final isLandscape = orientation == Orientation.landscape;

    final myNameIsStyle = isLandscape
        ? context.textTheme.titleLarge?.copyWith(
            color: AppColors.accent,
            fontWeight: FontWeight.w600,
            letterSpacing: 2,
          )
        : context.textTheme.bodyMedium?.copyWith(
            color: AppColors.accent,
            fontWeight: FontWeight.w600,
            letterSpacing: 2,
          );

    final nameStyle = isLandscape
        ? context.textTheme.displayLarge?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w900,
            fontSize: 72,
            height: 1.1,
          )
        : context.textTheme.headlineMedium?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w900,
          );

    final subtitleStyle = isLandscape
        ? context.textTheme.displayMedium?.copyWith(
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w700,
            fontSize: 64,
            height: 1.1,
          )
        : context.textTheme.headlineSmall?.copyWith(
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w700,
          );

    final descriptionStyle = context.textTheme.bodyLarge?.copyWith(
      color: AppColors.textSecondary,
      fontSize: 18,
      height: 1.6,
    );

    return BaseBlock(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInSlideAnimation(
              delay: const Duration(milliseconds: 200),
              slideOffset: const Offset(0, 30),
              child: Text(
                'Hi, my name is',
                style: myNameIsStyle,
              ),
            ),
            const SizedBox(height: 24),
            FadeInSlideAnimation(
              delay: const Duration(milliseconds: 400),
              slideOffset: const Offset(0, 30),
              child: ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: [
                    AppColors.primary,
                    AppColors.secondary,
                    AppColors.accent,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds),
                child: Text(
                  developerProfile.name,
                  style: nameStyle?.copyWith(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 8),
            FadeInSlideAnimation(
              delay: const Duration(milliseconds: 600),
              slideOffset: const Offset(0, 30),
              child: Text(
                developerProfile.subtitle,
                style: subtitleStyle,
              ),
            ),
            const SizedBox(height: 24),
            FadeInSlideAnimation(
              delay: const Duration(milliseconds: 800),
              slideOffset: const Offset(0, 30),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Text(
                  developerProfile.aboutMe.text,
                  style: descriptionStyle,
                ),
              ),
            ),
            const SizedBox(height: 32),
            FadeInSlideAnimation(
              delay: const Duration(milliseconds: 1000),
              slideOffset: const Offset(0, 30),
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  GlowingButton(
                    text: 'View My Work',
                    onPressed: onViewWorkPressed ?? () {},
                    color: AppColors.primary,
                    glowColor: AppColors.glowPrimary,
                  ),
                  GlowingButton(
                    text: 'Download CV',
                    onPressed: () {
                      launchUrlString('resume.pdf');
                    },
                    color: Colors.transparent,
                    glowColor: AppColors.accent,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
