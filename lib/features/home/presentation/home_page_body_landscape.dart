import 'package:flutter/material.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/features/home/presentation/components/about/about_info.dart';
import 'package:personal_website/features/home/presentation/components/contact/contact_info.dart';
import 'package:personal_website/features/home/presentation/components/notes/notes_info.dart';
import 'package:personal_website/features/home/presentation/components/profile/profile_info.dart';
import 'package:personal_website/features/home/presentation/components/projects/project_info.dart';
import 'package:personal_website/features/home/presentation/components/work/work_info.dart';

class HomePageBodyLandscape extends StatelessWidget {
  final DeveloperProfile profile;

  const HomePageBodyLandscape({super.key, required this.profile});

  static GlobalKey aboutKey = GlobalKey();
  static GlobalKey workKey = GlobalKey();
  static GlobalKey projectsKey = GlobalKey();
  static GlobalKey blogKey = GlobalKey();

  static const double tabSize = 72.0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 980),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: const Center(child: AboutInfo()),
              ),
              ProfileInfo(),
              WorkInfo(),
              ProjectInfo(),
              NotesInfo(),
              ContactInfo(),
            ],
          ),
        ),
      ),
    );
    // return Stack(
    //   children: [
    //     Align(
    //       alignment: Alignment.topLeft,
    //       child: Container(
    //         padding: const EdgeInsets.symmetric(horizontal: 56),
    //         width: MediaQuery.sizeOf(context).width * 0.4,
    //         height: MediaQuery.sizeOf(context).height,
    //         child: Center(
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               const SizedBox(height: 92),
    //               Text(
    //                 profile.name,
    //                 style: Theme.of(context).textTheme.headlineLarge?.copyWith(
    //                       fontWeight: FontWeight.w700,
    //                       color: Theme.of(context).colorScheme.tertiary,
    //                     ),
    //               ),
    //               const SizedBox(height: 8),
    //               if (profile.jobTitle.isNotEmpty) ...[
    //                 Text(
    //                   profile.jobTitle,
    //                   textAlign: TextAlign.start,
    //                   style: Theme.of(context).textTheme.headlineSmall?.copyWith(
    //                         fontWeight: FontWeight.normal,
    //                         color: Theme.of(context).colorScheme.tertiary,
    //                       ),
    //                 ),
    //                 const SizedBox(height: 24),
    //               ],
    //               Text(
    //                 profile.shortDescription,
    //                 textAlign: TextAlign.start,
    //                 style: Theme.of(context).textTheme.bodyLarge?.copyWith(
    //                       fontWeight: FontWeight.normal,
    //                       color: Theme.of(context).colorScheme.surface,
    //                     ),
    //               ),
    //               if (MediaQuery.sizeOf(context).height > maxHeightForLanguageBlock &&
    //                   profile.showLanguages) ...[
    //                 const SizedBox(height: 56),
    //                 LanguagesBlock(languages: profile.languages),
    //               ],
    //               const Spacer(),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //     Align(
    //       alignment: Alignment.topRight,
    //       child: Container(
    //         height: tabSize,
    //         margin: const EdgeInsets.only(right: 56),
    //         child: Row(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             _TabItem(title: 'About', tabKey: aboutKey),
    //             const SizedBox(width: 32),
    //             _TabItem(title: 'Work', tabKey: workKey),
    //             const SizedBox(width: 32),
    //             _TabItem(title: 'Projects', tabKey: projectsKey),
    //             const SizedBox(width: 32),
    //             _TabItem(title: 'Blog', tabKey: blogKey),
    //             const SizedBox(width: 48),
    //             const ThemeIcon(),
    //           ],
    //         ),
    //       ),
    //     ),
    //     Padding(
    //       padding: const EdgeInsets.only(top: tabSize),
    //       child: SingleChildScrollView(
    //         physics: const BouncingScrollPhysics(),
    //         child: Align(
    //           alignment: Alignment.topRight,
    //           child: Container(
    //             padding: const EdgeInsets.only(right: 56),
    //             width: MediaQuery.sizeOf(context).width * 0.55,
    //             child: Column(
    //               children: [
    //                 const SizedBox(height: 16),
    //                 Text(
    //                   key: aboutKey,
    //                   profile.fullDescription,
    //                   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
    //                         fontWeight: FontWeight.normal,
    //                         color: Theme.of(context).colorScheme.surface,
    //                       ),
    //                 ),
    //                 if (MediaQuery.sizeOf(context).height <= maxHeightForSocialButtons) ...[
    //                   const SizedBox(height: 36),
    //                   DownloadButton(title: 'Download full Resume', url: Const.config.CV_URL),
    //                   const SizedBox(height: 16),
    //                   SocialButtons(socialLinks: profile.socialLinks),
    //                 ],
    //                 if (MediaQuery.sizeOf(context).height <= maxHeightForLanguageBlock &&
    //                     profile.showLanguages) ...[
    //                   const SizedBox(height: 56),
    //                   LanguagesBlock(languages: profile.languages),
    //                 ],
    //                 const SizedBox(height: 80),
    //                 ListView.separated(
    //                   key: workKey,
    //                   physics: const NeverScrollableScrollPhysics(),
    //                   shrinkWrap: true,
    //                   itemCount: profile.work.length,
    //                   separatorBuilder: (context, index) => const SizedBox(height: 32),
    //                   itemBuilder: (context, index) => WorkItem(
    //                     workExperience: profile.work[index],
    //                   ),
    //                 ),
    //                 const SizedBox(height: 80),
    //                 ListView.separated(
    //                   key: projectsKey,
    //                   physics: const NeverScrollableScrollPhysics(),
    //                   shrinkWrap: true,
    //                   itemCount: profile.projects.length,
    //                   separatorBuilder: (context, index) => const SizedBox(height: 32),
    //                   itemBuilder: (context, index) => ProjectItem(
    //                     project: profile.projects[index],
    //                   ),
    //                 ),
    //                 const SizedBox(height: 80),
    //                 ListView.separated(
    //                   key: blogKey,
    //                   physics: const NeverScrollableScrollPhysics(),
    //                   shrinkWrap: true,
    //                   itemCount: profile.blogPosts.length,
    //                   separatorBuilder: (context, index) => const SizedBox(height: 32),
    //                   itemBuilder: (context, index) => BlogPostItem(
    //                     blogPost: profile.blogPosts[index],
    //                   ),
    //                 ),
    //                 const SizedBox(height: 80),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //     if (MediaQuery.sizeOf(context).height > maxHeightForSocialButtons)
    //       Positioned(
    //         bottom: 56,
    //         left: 56,
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             DownloadButton(title: 'Download full Resume', url: Const.config.CV_URL),
    //             const SizedBox(height: 16),
    //             SocialButtons(socialLinks: profile.socialLinks),
    //           ],
    //         ),
    //       )
    //   ],
    // );
  }
}

class _TabItem extends StatelessWidget {
  final String title;
  final GlobalKey tabKey;

  const _TabItem({required this.title, required this.tabKey});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () => scrollToWidget(tabKey.currentContext),
      child: Text(title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.tertiary,
              )),
    );
  }

  void scrollToWidget(BuildContext? context) {
    if (context == null) return;

    Scrollable.ensureVisible(context, duration: const Duration(seconds: 1));
  }
}
