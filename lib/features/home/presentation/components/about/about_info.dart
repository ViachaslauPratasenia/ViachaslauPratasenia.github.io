import 'package:flutter/material.dart';
import 'package:personal_website/const/const.dart';
import 'package:personal_website/core/orientation_provider.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/features/home/presentation/components/base_block.dart';
import 'package:personal_website/core/widgets/primary_button.dart';
import 'package:personal_website/theme/app_colors.dart';
import 'package:personal_website/theme/theme_controller.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutInfo extends StatefulWidget {
  final DeveloperProfile developerProfile;

  const AboutInfo({super.key, required this.developerProfile});

  @override
  State<AboutInfo> createState() => _AboutInfoState();
}

class _AboutInfoState extends State<AboutInfo> {
  Duration defaultDuration = const Duration(milliseconds: 1000);

  double myNameIsOpacity = 0;
  double nameOpacity = 0;
  double descriptionOpacity = 0;
  double buttonOpacity = 0;

  Curve defaultCurve = Curves.easeInOut;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final orientation = OrientationProvider.of(context).orientation;
      if (orientation == Orientation.portrait) {
        defaultDuration = const Duration(milliseconds: 500);
      }
      initOpacity();
    });
  }

  Duration getDelay(int index) => Duration(milliseconds: 250 + 250 * index);

  void initOpacity() {
    Future.delayed(getDelay(0), () => setState(() => myNameIsOpacity = 1));
    Future.delayed(getDelay(1), () => setState(() => nameOpacity = 1));
    Future.delayed(getDelay(2), () => setState(() => descriptionOpacity = 1));
    Future.delayed(getDelay(3), () => setState(() => buttonOpacity = 1));
  }

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
          AnimatedOpacity(
            duration: defaultDuration,
            curve: Curves.easeInOut,
            opacity: myNameIsOpacity,
            child: Text(
              'Hi, my name is',
              style: myNameIsStyle?.copyWith(color: AppColors.primary),
            ),
          ),
          const SizedBox(height: 24),
          AnimatedOpacity(
            duration: defaultDuration,
            curve: defaultCurve,
            opacity: nameOpacity,
            child: Text(
              widget.developerProfile.name,
              style: nameStyle?.copyWith(color: AppColors.textPrimary),
            ),
          ),
          AnimatedOpacity(
            duration: defaultDuration,
            curve: defaultCurve,
            opacity: nameOpacity,
            child: Text(
              widget.developerProfile.subtitle,
              style: nameStyle?.copyWith(color: AppColors.textSecondary),
            ),
          ),
          const SizedBox(height: 32),
          AnimatedOpacity(
            duration: defaultDuration,
            curve: defaultCurve,
            opacity: descriptionOpacity,
            child: Text(
              widget.developerProfile.fullDescription,
              style: context.textTheme.bodyLarge?.copyWith(color: AppColors.textTertiary),
            ),
          ),
          const SizedBox(height: 24),
          AnimatedOpacity(
            duration: defaultDuration,
            curve: defaultCurve,
            opacity: buttonOpacity,
            child: PrimaryButton(
              analyticsName: 'open_cv',
              title: 'Check out my resume',
              onPressed: () => launchUrlString(Const.config.CV_URL),
            ),
          ),
        ],
      ),
    );
  }
}
