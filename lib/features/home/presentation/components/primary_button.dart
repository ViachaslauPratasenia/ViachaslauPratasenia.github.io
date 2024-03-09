import 'package:firebase_analytics_web/firebase_analytics_web.dart';
import 'package:flutter/material.dart';
import 'package:personal_website/theme/app_colors.dart';
import 'package:personal_website/theme/theme_controller.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PrimaryButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  final String? analyticsName;

  const PrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.analyticsName,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: AppColors.primary),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      ),
      onPressed: () {
        if (analyticsName != null) {
          FirebaseAnalyticsWeb().logEvent(name: analyticsName!);
          onPressed();
        }
      },
      child: Text(
        title,
        style: context.textTheme.titleMedium?.copyWith(color: AppColors.primary, height: 1),
      ),
    );
  }
}
