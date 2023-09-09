import 'package:flutter/material.dart';
import 'package:personal_website/features/home/data/developer_profile.dart';
import 'package:personal_website/features/home/presentation/components/languages_block.dart';
import 'package:personal_website/features/home/presentation/components/social_buttons.dart';
import 'package:personal_website/features/home/presentation/components/work_item.dart';
import 'package:personal_website/theme/theme.dart';
import 'package:personal_website/theme/typografy.dart';

class HomePageBodyLandscape extends StatelessWidget {
  final DeveloperProfile profile;

  const HomePageBodyLandscape({super.key, required this.profile});

  static const maxHeightForLanguageBlock = 700;
  static const maxHeightForSocialButtons = 465;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 56),
            width: MediaQuery.sizeOf(context).width * 0.4,
            height: MediaQuery.sizeOf(context).height,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 56),
                  Text(
                    profile.name,
                    style: AppTheme.typography.extraMega.bold.accent,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    profile.jobTitle,
                    textAlign: TextAlign.start,
                    style: AppTheme.typography.huge.regular.accent,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    profile.shortDescription,
                    textAlign: TextAlign.start,
                    style: AppTheme.typography.semiLarge.regular.textBase,
                  ),
                  const SizedBox(height: 56),
                  if (MediaQuery.sizeOf(context).height > maxHeightForLanguageBlock)
                    LanguagesBlock(languages: profile.languages),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: const EdgeInsets.only(right: 56),
              width: MediaQuery.sizeOf(context).width * 0.55,
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  const SizedBox(height: 56),
                  Text(
                    profile.fullDescription,
                    style: AppTheme.typography.semiLarge.regular.textBase,
                  ),
                  if(MediaQuery.sizeOf(context).height <= maxHeightForSocialButtons) ...[
                    const SizedBox(height: 36),
                    SocialButtons(socialLinks: profile.socialLinks),
                  ],
                  if (MediaQuery.sizeOf(context).height <= maxHeightForLanguageBlock) ...[
                    const SizedBox(height: 56),
                    LanguagesBlock(languages: profile.languages),
                  ],
                  const SizedBox(height: 80),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: profile.work.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 32),
                    itemBuilder: (context, index) => WorkItem(
                      workExperience: profile.work[index],
                    ),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ),
        if (MediaQuery.sizeOf(context).height > maxHeightForSocialButtons)
          Positioned(
            bottom: 56,
            left: 56,
            child: SocialButtons(socialLinks: profile.socialLinks),
          )
      ],
    );
  }
}
