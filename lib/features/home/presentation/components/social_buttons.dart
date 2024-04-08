import 'package:collection/collection.dart';
import 'package:firebase_analytics_web/firebase_analytics_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:personal_website/core/data/models/profile/profile.dart';
import 'package:personal_website/core/orientation_provider.dart';
import 'package:personal_website/features/home/social_button_element.dart';
import 'package:personal_website/theme/app_colors.dart';
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

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(socialLinks.length, (index) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (index != 0) divider,
            _Icon(socialLink: socialLinks[index], iconSize: 32),
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
  Color iconColor = AppColors.textPrimary;

  @override
  Widget build(BuildContext context) {
    final socialLinkElement = SocialButtonElement.values.firstWhereOrNull(
      (element) => element.name == widget.socialLink.type,
    );
    if (socialLinkElement == null) return Container();

    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onHover: (hover) {
        setState(() => iconColor = hover ? AppColors.primary : AppColors.textPrimary);
      },
      onTap: () async {
        FirebaseAnalyticsWeb().logEvent(name: 'open_social_link', parameters: {
          'link_name': widget.socialLink.type,
        });

        launchUrlString(widget.socialLink.url);
      },
      child: SvgPicture.asset(
        socialLinkElement.imagePath,
        width: widget.iconSize,
        height: widget.iconSize,
        colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
      ),
    );
  }
}
