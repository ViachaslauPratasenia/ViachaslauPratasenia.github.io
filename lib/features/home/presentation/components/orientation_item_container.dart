import 'package:flutter/material.dart';
import 'package:personal_website/core/orientation_provider.dart';
import 'package:personal_website/theme/theme.dart';

class OrientationItemContainer extends StatelessWidget {
  final Widget child;
  final void Function() onTap;

  const OrientationItemContainer({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    if (OrientationProvider.of(context).orientation == Orientation.landscape) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        hoverColor: AppTheme.colors.accent.withOpacity(0.05),
        highlightColor: AppTheme.colors.accent.withOpacity(0.1),
        child: child,
      );
    }

    return child;
  }
}
