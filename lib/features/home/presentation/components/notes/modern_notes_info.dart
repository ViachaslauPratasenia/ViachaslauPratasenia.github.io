import 'package:flutter/material.dart';
import 'package:personal_website/core/widgets/fade_in_slide_animation.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/features/home/presentation/components/base_block.dart';
import 'package:personal_website/features/home/presentation/components/notes/modern_note_card.dart';
import 'package:personal_website/features/home/presentation/components/section_header.dart';
import 'package:personal_website/features/home/presentation/components/visibility_block.dart';

class ModernNotesInfo extends StatelessWidget {
  final DeveloperProfile developerProfile;

  const ModernNotesInfo({super.key, required this.developerProfile});

  @override
  Widget build(BuildContext context) {
    return VisibilityBlock(
      blockKey: const Key('notes-info'),
      child: BaseBlock(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInSlideAnimation(
              delay: const Duration(milliseconds: 100),
              child: const SectionHeader(
                index: '04.',
                title: 'Articles & Insights',
              ),
            ),
            const SizedBox(height: 48),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: developerProfile.blogPosts.length,
              itemBuilder: (context, index) {
                return ModernNoteCard(
                  note: developerProfile.blogPosts[index],
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

