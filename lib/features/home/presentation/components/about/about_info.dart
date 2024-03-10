import 'package:flutter/material.dart';
import 'package:personal_website/const/const.dart';
import 'package:personal_website/core/orientation_provider.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/features/home/presentation/components/base_block.dart';
import 'package:personal_website/core/widgets/primary_button.dart';
import 'package:personal_website/theme/app_colors.dart';
import 'package:personal_website/theme/theme_controller.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutInfo extends StatelessWidget {
  final DeveloperProfile developerProfile;

  const AboutInfo({super.key, required this.developerProfile});

  @override
  Widget build(BuildContext context) {
    final orientation = OrientationProvider.of(context).orientation;
    final myNameIsStyle = orientation == Orientation.landscape
        ? context.textTheme.titleLarge
        : context.textTheme.bodyMedium;

    final nameStyle = orientation == Orientation.landscape
        ? context.textTheme.displayLarge
        : context.textTheme.headlineMedium;

    return BaseBlock(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi, my name is',
            style: myNameIsStyle?.copyWith(color: AppColors.primary),
          ),
          const SizedBox(height: 24),
          Text(
            developerProfile.name,
            style: nameStyle?.copyWith(color: AppColors.textPrimary),
          ),
          Text(
            developerProfile.subtitle,
            style: nameStyle?.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 32),
          Text(
            developerProfile.fullDescription,
            style: context.textTheme.bodyLarge?.copyWith(color: AppColors.textTertiary),
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            analyticsName: 'open_cv',
            title: 'Check out my resume',
            onPressed: () => launchUrlString(Const.config.CV_URL),
          ),
        ],
      ),
    );
  }
}
