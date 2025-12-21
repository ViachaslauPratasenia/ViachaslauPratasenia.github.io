import 'package:flutter/material.dart';
import 'package:personal_website/core/orientation_provider.dart';
import 'package:personal_website/core/widgets/fade_in_slide_animation.dart';
import 'package:personal_website/core/widgets/glowing_button.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/features/home/presentation/components/base_block.dart';
import 'package:personal_website/features/home/presentation/components/section_header.dart';
import 'package:personal_website/features/home/presentation/components/social_buttons.dart';
import 'package:personal_website/features/home/presentation/components/visibility_block.dart';
import 'package:personal_website/theme/app_colors.dart';
import 'package:personal_website/theme/theme_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class ModernContactInfo extends StatelessWidget {
  final DeveloperProfile developerProfile;

  const ModernContactInfo({super.key, required this.developerProfile});

  @override
  Widget build(BuildContext context) {
    final orientation = OrientationProvider.of(context).orientation;

    final titleStyle = orientation == Orientation.landscape
        ? context.textTheme.displayLarge?.copyWith(
            fontSize: 56,
            fontWeight: FontWeight.w900,
          )
        : context.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w900,
          );

    return VisibilityBlock(
      blockKey: const Key('contact-info'),
      child: BaseBlock(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 80),
          child: Center(
            child: SizedBox(
              width: orientation == Orientation.landscape
                  ? MediaQuery.sizeOf(context).width * 0.5
                  : MediaQuery.sizeOf(context).width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FadeInSlideAnimation(
                    delay: const Duration(milliseconds: 100),
                    child: const SectionHeader(
                      index: '04.',
                      title: "What's Next?",
                      showLine: false,
                    ),
                  ),
                  const SizedBox(height: 24),
                  FadeInSlideAnimation(
                    delay: const Duration(milliseconds: 200),
                    child: ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [
                          AppColors.accent,
                          AppColors.primary,
                          AppColors.secondary,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds),
                      child: Text(
                        'Get In Touch',
                        textAlign: TextAlign.center,
                        style: titleStyle?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  FadeInSlideAnimation(
                    delay: const Duration(milliseconds: 300),
                    child: Container(
                      padding: const EdgeInsets.all(32),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            AppColors.cardBackground.withValues(alpha: 0.6),
                            AppColors.cardBackground.withValues(alpha: 0.3),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: AppColors.primary.withValues(alpha: 0.3),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.glowPrimary,
                            blurRadius: 30,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            developerProfile.contactMeText,
                            textAlign: TextAlign.center,
                            style: context.textTheme.bodyLarge?.copyWith(
                              color: AppColors.textSecondary,
                              height: 1.8,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 40),
                          GlowingButton(
                            text: '✉️  Say Hello',
                            onPressed: () async {
                              final uri = Uri(
                                scheme: 'mailto',
                                path: developerProfile.email,
                              );
                              await launchUrl(uri);
                            },
                            color: AppColors.primary,
                            glowColor: AppColors.primary,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 48,
                              vertical: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
                  FadeInSlideAnimation(
                    delay: const Duration(milliseconds: 400),
                    child: Column(
                      children: [
                        Text(
                          'or connect with me on',
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 24),
                        SocialButtons(
                          socialLinks: developerProfile.socialLinks,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 60),
                  FadeInSlideAnimation(
                    delay: const Duration(milliseconds: 500),
                    child: Text(
                      'Built with Flutter 💙',
                      style: context.textTheme.bodySmall?.copyWith(
                        color: AppColors.textTertiary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

