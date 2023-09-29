import 'package:collection/collection.dart';
import 'package:firebase_analytics_web/firebase_analytics_web.dart';
import 'package:flutter/material.dart';
import 'package:personal_website/core/orientation_provider.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/features/home/data/social_button_element.dart';
import 'package:personal_website/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SocialButtons extends StatelessWidget {
  final List<SocialLink> socialLinks;

  const SocialButtons({super.key, required this.socialLinks});

  @override
  Widget build(BuildContext context) {
    final orientation = OrientationProvider.of(context).orientation;

    final divider = orientation == Orientation.landscape
        ? const SizedBox(width: 32)
        : const SizedBox(width: 16);

    final iconSize = orientation == Orientation.landscape ? 36.0 : 24.0;

    return Row(
      children: List.generate(socialLinks.length, (index) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (index != 0) divider,
            _Icon(socialLink: socialLinks[index], iconSize: iconSize),
          ],
        );
      }),
    );
  }
}

class _Icon extends StatefulWidget {
  final double iconSize;
  final SocialLink socialLink;

  const _Icon({required this.socialLink, this.iconSize = 36});

  @override
  State<_Icon> createState() => _IconState();
}

class _IconState extends State<_Icon> {
  @override
  Widget build(BuildContext context) {
    final socialLinkElement = SocialButtonElement.values.firstWhereOrNull(
      (element) => element.name == widget.socialLink.name,
    );
    if (socialLinkElement == null) return Container();

    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: () async {
        FirebaseAnalyticsWeb().logEvent(name: 'open_social_link', parameters: {
          'link_name': widget.socialLink.name,
        });
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
        width: widget.iconSize,
        height: widget.iconSize,
        color: AppTheme.colors.accent,
      ),
    );
  }
}
