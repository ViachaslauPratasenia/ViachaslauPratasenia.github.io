import 'package:flutter/material.dart';
import 'package:personal_website/const/assets/assets.gen.dart';
import 'package:personal_website/core/orientation_provider.dart';
import 'package:personal_website/core/widgets/primary_button.dart';
import 'package:personal_website/features/home/presentation/components/base_block.dart';
import 'package:personal_website/features/home/presentation/components/section_header.dart';
import 'package:personal_website/theme/app_colors.dart';
import 'package:personal_website/theme/theme_controller.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = OrientationProvider.of(context).orientation;

    final titleStyle = orientation == Orientation.landscape
        ? context.textTheme.displayLarge
        : context.textTheme.headlineMedium;

    final iconsPadding = orientation == Orientation.landscape ? 24.0 : 16.0;

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
              'Although I’m not currently looking for any new opportunities, my inbox is always open. Whether you have a question or just want to say hi, I’ll try my best to get back to you!',
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 24),
            PrimaryButton(title: 'Say Hello', onPressed: () {}),
            const SizedBox(height: 12),
            Text(
              'or',
              style: context.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Assets.svg.icLinkedin.svg(
                  width: 32,
                  height: 32,
                  colorFilter: const ColorFilter.mode(AppColors.textPrimary, BlendMode.srcIn),
                ),
                SizedBox(width: iconsPadding),
                Assets.svg.icGithub.svg(
                  width: 32,
                  height: 32,
                  colorFilter: const ColorFilter.mode(AppColors.textPrimary, BlendMode.srcIn),
                ),
                SizedBox(width: iconsPadding),
                Assets.svg.icMedium.svg(
                  width: 32,
                  height: 32,
                  colorFilter: const ColorFilter.mode(AppColors.textPrimary, BlendMode.srcIn),
                ),
                SizedBox(width: iconsPadding),
                Assets.svg.icTelegram.svg(
                  width: 32,
                  height: 32,
                  colorFilter: const ColorFilter.mode(AppColors.textPrimary, BlendMode.srcIn),
                ),
                SizedBox(width: iconsPadding),
                Assets.svg.icInstagram.svg(
                  width: 32,
                  height: 32,
                  colorFilter: const ColorFilter.mode(AppColors.textPrimary, BlendMode.srcIn),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
