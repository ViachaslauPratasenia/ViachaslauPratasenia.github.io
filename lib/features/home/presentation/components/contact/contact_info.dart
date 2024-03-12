import 'package:flutter/material.dart';
import 'package:personal_website/core/orientation_provider.dart';
import 'package:personal_website/core/widgets/primary_button.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/features/home/presentation/components/base_block.dart';
import 'package:personal_website/features/home/presentation/components/section_header.dart';
import 'package:personal_website/features/home/presentation/components/social_buttons.dart';
import 'package:personal_website/theme/app_colors.dart';
import 'package:personal_website/theme/theme_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactInfo extends StatelessWidget {
  final DeveloperProfile developerProfile;

  const ContactInfo({super.key, required this.developerProfile});

  @override
  Widget build(BuildContext context) {
    final orientation = OrientationProvider.of(context).orientation;

    final titleStyle = orientation == Orientation.landscape
        ? context.textTheme.displayLarge
        : context.textTheme.headlineMedium;

    return BaseBlock(
      child: SizedBox(
        width: orientation == Orientation.landscape
            ? MediaQuery.sizeOf(context).width * 0.4
            : MediaQuery.sizeOf(context).width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SectionHeader(index: '04.', title: 'What’s Next?', showLine: false),
            const SizedBox(height: 16),
            Text(
              'Get In Touch',
              textAlign: TextAlign.center,
              style: titleStyle?.copyWith(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 24),
            Text(
              developerProfile.contactMeText,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              title: 'Say Hello',
              analyticsName: 'send_email',
              onPressed: () async {
                final uri = Uri(scheme: 'mailto', path: developerProfile.email);
                await launchUrl(uri);
              },
            ),
            const SizedBox(height: 12),
            Text(
              'or',
              style: context.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 12),
            SocialButtons(socialLinks: developerProfile.socialLinks),
          ],
        ),
      ),
    );
  }
}
