import 'package:flutter/material.dart';
import 'package:personal_website/theme/app_colors.dart';
import 'package:personal_website/theme/theme_controller.dart';

class MenuDrawer extends StatelessWidget {
  final void Function()? onAboutMeClicked;
  final void Function()? onExperienceClicked;
  final void Function()? onWorkClicked;
  final void Function()? onContactClicked;

  const MenuDrawer({
    super.key,
    this.onAboutMeClicked,
    this.onExperienceClicked,
    this.onWorkClicked,
    this.onContactClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.backgroundSecondary,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Spacer(),
                _TabItem(
                  index: '1',
                  title: 'About Me',
                  onTap: () {
                    Navigator.of(context).pop();
                    onAboutMeClicked?.call();
                  },
                ),
                const SizedBox(height: 40),
                _TabItem(
                  index: '2',
                  title: 'Experience',
                  onTap: () {
                    Navigator.of(context).pop();
                    onExperienceClicked?.call();
                  },
                ),
                const SizedBox(height: 40),
                _TabItem(
                  index: '3',
                  title: 'Projects',
                  onTap: () {
                    Navigator.of(context).pop();
                    onWorkClicked?.call();
                  },
                ),
                const SizedBox(height: 40),
                _TabItem(
                  index: '4',
                  title: 'Contact',
                  onTap: () {
                    Navigator.of(context).pop();
                    onContactClicked?.call();
                  },
                ),
                const Spacer(),
              ],
            ),
          ),
          Positioned(
            top: 8,
            right: 16,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              splashRadius: 1,
              icon: const Icon(Icons.close_rounded, color: AppColors.primary, size: 32),
            ),
          ),
        ],
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
      child: Column(
        children: [
          Text('0$index', style: context.textTheme.bodyMedium?.copyWith(color: AppColors.primary)),
          Text(
            title,
            style: context.textTheme.bodyMedium?.copyWith(color: AppColors.textPrimary),
          ),
        ],
      ),
    );
  }
}
