import 'package:firebase_analytics_web/firebase_analytics_web.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DownloadButton extends StatelessWidget {
  final String title;
  final String url;

  const DownloadButton({super.key, required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      ),
      onPressed: () {
        FirebaseAnalyticsWeb().logEvent(name: 'download_cv');
        launchUrlString(url);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.tertiary,
                  height: 1.1,
                ),
          ),
          const SizedBox(width: 8),
          Icon(
            Icons.file_download_outlined,
            color: Theme.of(context).colorScheme.tertiary,
            size: 24,
          ),
        ],
      ),
    );
  }
}
