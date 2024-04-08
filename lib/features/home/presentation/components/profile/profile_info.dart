import 'package:flutter/material.dart';
import 'package:personal_website/const/assets/assets.gen.dart';
import 'package:personal_website/core/data/models/profile/profile.dart';
import 'package:personal_website/core/data/models/work/work.dart';
import 'package:personal_website/core/orientation_provider.dart';
import 'package:personal_website/features/home/presentation/components/base_block.dart';
import 'package:personal_website/features/home/presentation/components/profile/tech_item.dart';
import 'package:personal_website/features/home/presentation/components/section_header.dart';
import 'package:personal_website/features/home/presentation/components/visibility_block.dart';
import 'package:personal_website/theme/app_colors.dart';
import 'package:personal_website/theme/theme_controller.dart';

class ProfileInfo extends StatelessWidget {
  final Profile profile;
  final Work work;

  const ProfileInfo({super.key, required this.profile, required this.work});

  @override
  Widget build(BuildContext context) {
    final orientation = OrientationProvider.of(context).orientation;

    final fullDescription = profile.fullDescription.replaceAll('\\n', '\n');

    return VisibilityBlock(
      blockKey: const Key('profile-info'),
      child: BaseBlock(
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: LayoutBuilder(builder: (context, constraints) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionHeader(index: '01.', title: 'About me'),
                    const SizedBox(height: 16),
                    Text(
                      fullDescription,
                      style: context.textTheme.bodyLarge?.copyWith(color: AppColors.textTertiary),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: orientation == Orientation.landscape
                          ? constraints.maxWidth * 0.8
                          : constraints.maxWidth,
                      child: _TechItems(items: work.latestTechnologies),
                    ),
                    if (orientation == Orientation.portrait) ...[
                      const SizedBox(height: 32),
                      Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 350),
                          child: Assets.images.profilePhoto.image(
                            width: constraints.maxWidth * 0.75,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ],
                );
              }),
            ),
            if (orientation == Orientation.landscape) ...[
              const SizedBox(width: 16),
              Expanded(
                flex: 4,
                child: LayoutBuilder(builder: (context, constraints) {
                  return Center(
                    child: SizedBox(
                      height: constraints.maxWidth * 0.75,
                      width: constraints.maxWidth * 0.75,
                      child: Assets.images.profilePhoto.image(fit: BoxFit.cover),
                    ),
                  );
                }),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _TechItems extends StatelessWidget {
  final List<String> items;

  const _TechItems({required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 10,
      ),
      itemBuilder: (context, index) => TechItem(title: items[index]),
    );
  }
}
