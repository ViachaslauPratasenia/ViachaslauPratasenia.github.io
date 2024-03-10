import 'package:flutter/material.dart';
import 'package:personal_website/core/orientation_provider.dart';
import 'package:personal_website/features/home/presentation/components/base_block.dart';
import 'package:personal_website/core/widgets/primary_button.dart';
import 'package:personal_website/theme/app_colors.dart';
import 'package:personal_website/theme/theme_controller.dart';

class AboutInfo extends StatelessWidget {
  const AboutInfo({super.key});

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
            'Viachaslau Pratasenia',
            style: nameStyle?.copyWith(color: AppColors.textPrimary),
          ),
          Text(
            'I build things with Flutter.',
            style: nameStyle?.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 32),
          Text(
            'I\'m a Flutter developer dedicated to crafting exceptional digital experiences across multiple platforms. Currently, I\'m focused on developing accessible, user-centric applications for Android, iOS, web, and desktop at AventusIT.',
            style: context.textTheme.bodyLarge?.copyWith(color: AppColors.textTertiary),
          ),
          const SizedBox(height: 24),
          PrimaryButton(title: 'Check out my resume', onPressed: () {}),
        ],
      ),
    );
  }
}
