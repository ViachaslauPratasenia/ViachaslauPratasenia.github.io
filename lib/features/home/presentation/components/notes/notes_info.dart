import 'package:flutter/material.dart';
import 'package:personal_website/core/orientation_provider.dart';
import 'package:personal_website/core/widgets/primary_button.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/features/home/presentation/components/base_block.dart';
import 'package:personal_website/features/home/presentation/components/notes/note_item.dart';
import 'package:personal_website/features/home/presentation/components/visibility_block.dart';
import 'package:personal_website/theme/app_colors.dart';
import 'package:personal_website/theme/theme_controller.dart';

class NotesInfo extends StatelessWidget {
  final DeveloperProfile developerProfile;

  const NotesInfo({super.key, required this.developerProfile});

  @override
  Widget build(BuildContext context) {
    final orientation = OrientationProvider.of(context).orientation;
    final titleStyle = orientation == Orientation.landscape
        ? context.textTheme.displaySmall
        : context.textTheme.titleLarge;

    return VisibilityBlock(
      blockKey: const Key('notes-info'),
      child: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = 2;
          double childAspectRatio = 1.5;

          if (developerProfile.blogPosts.length % 3 == 0) {
            crossAxisCount = 3;
            childAspectRatio = constraints.maxWidth < 1040 ? 0.7 : 0.85;
          }

          return BaseBlock(
            horizontalPadding: orientation == Orientation.landscape ? 32 : 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Other Noteworthy Projects',
                  textAlign: TextAlign.center,
                  style: titleStyle?.copyWith(color: AppColors.textPrimary),
                ),
                if (developerProfile.blogPosts.length > 6) ...[
                  const SizedBox(height: 4),
                  Text(
                    'view the archive',
                    style: context.textTheme.bodyLarge?.copyWith(color: AppColors.primary),
                  ),
                ],
                const SizedBox(height: 32),
                if (orientation == Orientation.landscape)
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: developerProfile.blogPosts.length,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: childAspectRatio,
                    ),
                    itemBuilder: (context, index) => NoteItem(
                      note: developerProfile.blogPosts[index],
                    ),
                  )
                else
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: developerProfile.blogPosts.length,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => const SizedBox(height: 24),
                    itemBuilder: (context, index) => NoteItem(
                      note: developerProfile.blogPosts[index],
                    ),
                  ),
                const SizedBox(height: 24),
                if (developerProfile.blogPosts.length > 6) ...[
                  const SizedBox(height: 4),
                  PrimaryButton(
                    analyticsName: 'notes_show_more',
                    title: 'Show more',
                    onPressed: () {},
                  ),
                ],
              ],
            ),
          );
        }
      ),
    );
  }
}
