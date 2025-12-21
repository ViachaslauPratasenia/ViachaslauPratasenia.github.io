import 'package:flutter/material.dart';
import 'package:personal_website/core/widgets/fade_in_slide_animation.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/features/home/presentation/components/base_block.dart';
import 'package:personal_website/features/home/presentation/components/projects/modern_project_card.dart';
import 'package:personal_website/features/home/presentation/components/section_header.dart';
import 'package:personal_website/features/home/presentation/components/visibility_block.dart';

class ModernProjectInfo extends StatelessWidget {
  final DeveloperProfile developerProfile;

  const ModernProjectInfo({super.key, required this.developerProfile});

  @override
  Widget build(BuildContext context) {
    return VisibilityBlock(
      blockKey: const Key('project-info'),
      child: BaseBlock(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInSlideAnimation(
              delay: const Duration(milliseconds: 100),
              child: const SectionHeader(
                index: '03.',
                title: "Some Things I've Built",
              ),
            ),
            const SizedBox(height: 48),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: developerProfile.projects.length,
              itemBuilder: (context, index) {
                return ModernProjectCard(
                  project: developerProfile.projects[index],
                  index: index,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

