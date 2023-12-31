import 'package:firebase_analytics_web/firebase_analytics_web.dart';
import 'package:flutter/material.dart';
import 'package:personal_website/const/assets/assets.gen.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LinkItem extends StatelessWidget {
  final WorkLink link;

  const LinkItem({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(32),
      onTap: () {
        FirebaseAnalyticsWeb().logEvent(name: 'open_link', parameters: {
          'link_url': link.url,
          'link_name': link.name,
        });
        launchUrlString(link.url);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Assets.images.icLink.image(
              width: 16,
              height: 16,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            const SizedBox(width: 8),
            Text(
              link.name,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).colorScheme.tertiary,
                    height: 1.1,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
