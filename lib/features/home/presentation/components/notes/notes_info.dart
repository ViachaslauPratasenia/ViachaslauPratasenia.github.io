import 'package:flutter/material.dart';
import 'package:personal_website/core/orientation_provider.dart';
import 'package:personal_website/core/widgets/primary_button.dart';
import 'package:personal_website/features/home/presentation/components/base_block.dart';
import 'package:personal_website/features/home/presentation/components/notes/note_item.dart';
import 'package:personal_website/theme/app_colors.dart';
import 'package:personal_website/theme/theme_controller.dart';

class NotesInfo extends StatelessWidget {
  const NotesInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = OrientationProvider.of(context).orientation;
    final titleStyle = orientation == Orientation.landscape
        ? context.textTheme.displaySmall
        : context.textTheme.titleLarge;

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
          const SizedBox(height: 4),
          Text(
            'view the archive',
            style: context.textTheme.bodyLarge?.copyWith(color: AppColors.primary),
          ),
          const SizedBox(height: 32),
          if (orientation == Orientation.landscape)
            GridView.builder(
              shrinkWrap: true,
              itemCount: 6,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.9,
              ),
              itemBuilder: (context, index) => const NoteItem(),
            )
          else
            ListView.separated(
              shrinkWrap: true,
              itemCount: 6,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(height: 24),
              itemBuilder: (context, index) => const NoteItem(),
            ),
          const SizedBox(height: 24),
          PrimaryButton(
            title: 'Show more',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
