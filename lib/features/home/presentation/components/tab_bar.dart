import 'package:flutter/material.dart';
import 'package:personal_website/core/orientation_provider.dart';
import 'package:personal_website/theme/app_colors.dart';
import 'package:personal_website/theme/theme_controller.dart';

class ProfileAppBar extends StatefulWidget {
  final void Function()? onAboutMeClicked;
  final void Function()? onExperienceClicked;
  final void Function()? onWorkClicked;
  final void Function()? onContactClicked;

  final void Function()? onMenuClicked;

  final double tabHeight;

  const ProfileAppBar({
    super.key,
    required this.tabHeight,
    this.onAboutMeClicked,
    this.onExperienceClicked,
    this.onWorkClicked,
    this.onContactClicked,
    this.onMenuClicked,
  });

  @override
  State<ProfileAppBar> createState() => _ProfileAppBarState();
}

class _ProfileAppBarState extends State<ProfileAppBar> {
  double opacity = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 250), () {
      setState(() {
        opacity = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final orientation = OrientationProvider.of(context).orientation;

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      opacity: opacity,
      child: Container(
        height: widget.tabHeight,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        color: AppColors.background,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const _Icon(),
            if (orientation == Orientation.landscape)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _TabItem(index: '01', title: 'About Me', onTap: widget.onAboutMeClicked),
                  const SizedBox(width: 32),
                  _TabItem(index: '02', title: 'Experience', onTap: widget.onExperienceClicked),
                  const SizedBox(width: 32),
                  _TabItem(index: '03', title: 'Projects', onTap: widget.onWorkClicked),
                  const SizedBox(width: 32),
                  _TabItem(index: '04', title: 'Contact', onTap: widget.onContactClicked),
                  // const SizedBox(width: 32),
                  // PrimaryButton(title: 'Resume', onPressed: () {}),
                ],
              )
            else
              IconButton(
                icon: const Icon(Icons.menu, color: AppColors.primary, size: 32),
                splashRadius: 24,
                onPressed: widget.onMenuClicked,
              ),
          ],
        ),
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  const _Icon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primary, width: 1),
      ),
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        width: 24,
        height: 24,
        child: Center(
          child: Text(
            'V',
            style: context.textTheme.headlineSmall?.copyWith(
              color: AppColors.primary,
              height: 1,
            ),
          ),
        ),
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final String index;
  final String title;

  final void Function()? onTap;

  const _TabItem({required this.index, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$index. ',
              style: context.textTheme.bodyLarge?.copyWith(color: AppColors.primary),
            ),
            TextSpan(
              text: title,
              style: context.textTheme.bodyLarge?.copyWith(color: AppColors.textPrimary),
            ),
          ],
        ),
      ),
    );
  }
}
