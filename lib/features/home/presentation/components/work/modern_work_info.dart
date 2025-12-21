import 'package:flutter/material.dart';
import 'package:personal_website/core/widgets/fade_in_slide_animation.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/features/home/presentation/components/base_block.dart';
import 'package:personal_website/features/home/presentation/components/section_header.dart';
import 'package:personal_website/features/home/presentation/components/visibility_block.dart';
import 'package:personal_website/features/home/presentation/components/work/modern_work_card.dart';

class ModernWorkInfo extends StatelessWidget {
  final DeveloperProfile developerProfile;

  const ModernWorkInfo({super.key, required this.developerProfile});

  @override
  Widget build(BuildContext context) {
    return VisibilityBlock(
      blockKey: const Key('work-info'),
      child: BaseBlock(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInSlideAnimation(
              delay: const Duration(milliseconds: 100),
              child: const SectionHeader(
                index: '02.',
                title: 'Work Experience',
              ),
            ),
            const SizedBox(height: 48),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: developerProfile.work.length,
              itemBuilder: (context, index) {
                return ModernWorkCard(
                  workExperience: developerProfile.work[index],
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

