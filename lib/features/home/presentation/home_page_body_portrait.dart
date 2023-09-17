import 'package:flutter/material.dart';
import 'package:personal_website/const/const.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/features/home/presentation/components/download_button.dart';
import 'package:personal_website/features/home/presentation/components/languages_block.dart';
import 'package:personal_website/features/home/presentation/components/project_block.dart';
import 'package:personal_website/features/home/presentation/components/social_buttons.dart';
import 'package:personal_website/features/home/presentation/components/work_item.dart';
import 'package:personal_website/theme/theme.dart';
import 'package:personal_website/theme/typografy.dart';

class HomePageBodyPortrait extends StatelessWidget {
  final DeveloperProfile profile;

  const HomePageBodyPortrait({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Text(
              profile.name,
              style: AppTheme.typography.huge.bold.accent,
            ),
            const SizedBox(height: 8),
            Text(
              profile.jobTitle,
              style: AppTheme.typography.standard.regular.accent,
            ),
            const SizedBox(height: 24),
            Text(
              profile.shortDescription,
              style: AppTheme.typography.small.regular.textBase,
            ),
            const SizedBox(height: 48),
            Text(
              'About',
              style: AppTheme.typography.semiLarge.bold.accent,
            ),
            const SizedBox(height: 16),
            Text(
              profile.fullDescription,
              style: AppTheme.typography.small.regular.textBase,
            ),
            const SizedBox(height: 24),
            DownloadButton(title: 'Download full Resume', url: Const.config.CV_URL),
            const SizedBox(height: 24),
            SocialButtons(socialLinks: profile.socialLinks),
            if (profile.showLanguages) ...[
              const SizedBox(height: 48),
              LanguagesBlock(languages: profile.languages),
            ],
            const SizedBox(height: 48),
            ...profile.work.map((work) => WorkItem(workExperience: work)).toList(),
            const SizedBox(height: 48),
            ...profile.projects.map((project) => ProjectItem(project: project)).toList(),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
