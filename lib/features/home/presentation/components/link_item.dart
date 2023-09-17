import 'package:flutter/material.dart';
import 'package:personal_website/const/assets/assets.gen.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/theme/theme.dart';
import 'package:personal_website/theme/typografy.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LinkItem extends StatelessWidget {
  final WorkLink link;

  const LinkItem({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(32),
      onTap: () => launchUrlString(link.url),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Assets.images.icLink.image(width: 16, height: 16, color: AppTheme.colors.accent),
            const SizedBox(width: 8),
            Text(link.name, style: AppTheme.typography.standard.regular.accent),
          ],
        ),
      ),
    );
  }
}
