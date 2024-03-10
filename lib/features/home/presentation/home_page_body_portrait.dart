import 'package:flutter/material.dart';
import 'package:personal_website/features/change_theme/presentation/theme_icon.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/features/home/presentation/components/blog_post_item.dart';
import 'package:personal_website/features/home/presentation/components/languages_block.dart';
import 'package:personal_website/features/home/presentation/components/project_block.dart';
import 'package:personal_website/features/home/presentation/components/social_buttons.dart';
import 'package:personal_website/features/home/presentation/components/work_item.dart';

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
            const SizedBox(height: 32),
            const Align(
              alignment: Alignment.centerRight,
              child: ThemeIcon(),
            ),
            const SizedBox(height: 16),
            Text(
              profile.name,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              profile.jobTitle,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
            ),
            const SizedBox(height: 24),
            Text(
              profile.shortDescription,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).colorScheme.surface,
                  ),
            ),
            const SizedBox(height: 48),
            Text(
              'About',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
            ),
            const SizedBox(height: 16),
            Text(
              profile.fullDescription,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).colorScheme.surface,
                  ),
            ),
            const SizedBox(height: 24),
            // DownloadButton(title: 'Download full Resume', url: Const.config.CV_URL),
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
            ...profile.blogPosts.map((blogPost) => BlogPostItem(blogPost: blogPost)).toList(),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
