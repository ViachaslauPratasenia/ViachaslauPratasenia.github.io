import 'package:firebase_analytics_web/firebase_analytics_web.dart';
import 'package:flutter/material.dart';
import 'package:personal_website/const/assets/assets.gen.dart';
import 'package:personal_website/theme/app_colors.dart';
import 'package:personal_website/theme/theme_controller.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LinkItem extends StatelessWidget {
  final String title;
  final String url;

  final String analyticsName;

  const LinkItem({
    super.key,
    required this.title,
    required this.url,
    this.analyticsName = 'open_link',
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FirebaseAnalyticsWeb().logEvent(name: analyticsName, parameters: {
          'link_url': url,
          'link_name': title,
        });

        launchUrlString(url);
      },
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              title,
              style: context.textTheme.bodyMedium?.copyWith(color: AppColors.primary),
            ),
          ),
          const SizedBox(width: 2),
          Assets.svg.icExternalLink.svg(
            width: 12,
            height: 12,
            colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
          ),
          // Icon(Icons.external)
        ],
      ),
    );
  }
}
