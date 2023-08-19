import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:personal_website/features/home/data/developer_profile.dart';
import 'package:personal_website/features/home/data/social_button_element.dart';
import 'package:personal_website/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SocialButtons extends StatelessWidget {
  final List<SocialLink> socialLinks;

  const SocialButtons({super.key, required this.socialLinks});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(socialLinks.length, (index) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if(index != 0) const SizedBox(width: 32),
            _Icon(socialLink: socialLinks[index]),
          ],
        );
      }),
    );
  }
}

class _Icon extends StatefulWidget {
  final SocialLink socialLink;

  const _Icon({required this.socialLink});

  @override
  State<_Icon> createState() => _IconState();
}

class _IconState extends State<_Icon> {
  Color? containerColor = AppTheme.colors.textBase;

  @override
  Widget build(BuildContext context) {
    final socialLinkElement = SocialButtonElement.values.firstWhereOrNull(
      (element) => element.name == widget.socialLink.name,
    );
    if (socialLinkElement == null) return Container();

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (value) => setState(() => containerColor = AppTheme.colors.accent),
      onExit: (value) => setState(() => containerColor = AppTheme.colors.textBase),
      child: GestureDetector(
        onTap: () async {
          if (socialLinkElement != SocialButtonElement.email) {
            launchUrlString(widget.socialLink.url);
            return;
          }

          final uri = Uri(
            scheme: 'mailto',
            path: widget.socialLink.url,
          );

          await launchUrl(uri);
        },
        child: Image.asset(
          socialLinkElement.imagePath,
          width: 36,
          height: 36,
          color: containerColor,
        ),
      ),
    );
  }
}
