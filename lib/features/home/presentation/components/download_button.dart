import 'package:flutter/material.dart';
import 'package:personal_website/theme/theme.dart';
import 'package:personal_website/theme/typografy.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DownloadButton extends StatelessWidget {
  final String title;
  final String url;

  const DownloadButton({super.key, required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.colors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      ),
      onPressed: () => launchUrlString(url),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppTheme.typography.standard.medium.accent,
          ),
          const SizedBox(width: 8),
          Icon(Icons.file_download_outlined, color: AppTheme.colors.accent, size: 24),
        ],
      )
    );
  }
}
