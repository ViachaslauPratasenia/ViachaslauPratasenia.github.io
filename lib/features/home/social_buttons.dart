import 'package:flutter/material.dart';
import 'package:personal_website/const/assets/assets.gen.dart';
import 'package:personal_website/theme/theme.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _Icon(imagePath: Assets.images.icEmail.path),
        const SizedBox(width: 32),
        _Icon(imagePath: Assets.images.icGithub.path),
        const SizedBox(width: 32),
        _Icon(imagePath: Assets.images.icLinkedin.path),
        const SizedBox(width: 32),
        _Icon(imagePath: Assets.images.icInstagram.path),
        const SizedBox(width: 32),
        _Icon(imagePath: Assets.images.icTelegram.path),
      ],
    );
  }
}

class _Icon extends StatefulWidget {
  final String imagePath;

  const _Icon({required this.imagePath});

  @override
  State<_Icon> createState() => _IconState();
}

class _IconState extends State<_Icon> {
  Color? containerColor = AppTheme.colors.textBase;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (value) => setState(() => containerColor = AppTheme.colors.accent),
      onExit: (value) => setState(() => containerColor = AppTheme.colors.textBase),
      child: GestureDetector(
        onTap: () {},
        child: Image.asset(
          widget.imagePath,
          width: 36,
          height: 36,
          color: containerColor,
        ),
      ),
    );
  }
}
