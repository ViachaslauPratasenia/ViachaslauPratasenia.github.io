import 'package:flutter/material.dart';
import 'package:personal_website/const/assets/assets.gen.dart';
import 'package:personal_website/core/widgets/link_item.dart';
import 'package:personal_website/features/home/presentation/components/base_block.dart';
import 'package:personal_website/features/home/presentation/components/section_header.dart';
import 'package:personal_website/theme/app_colors.dart';
import 'package:personal_website/theme/theme_controller.dart';

class ProjectInfo extends StatelessWidget {
  const ProjectInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseBlock(
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: constraints.maxWidth * 0.6,
              child: const SectionHeader(index: '03.', title: 'Some Things I’ve Built'),
            ),
            const SizedBox(height: 32),
            ListView.separated(
              shrinkWrap: true,
              itemCount: 3,
              separatorBuilder: (context, index) => const SizedBox(height: 32),
              itemBuilder: (context, index) => _ProjectItem(
                reversed: index.isOdd,
                maxWidth: constraints.maxWidth,
              ),
            ),
          ],
        );
      }),
    );
  }
}

class _ProjectItem extends StatelessWidget {
  final double maxWidth;
  final bool reversed;

  const _ProjectItem({required this.reversed, required this.maxWidth});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: reversed ? Alignment.centerRight : Alignment.centerLeft,
      children: [
        Assets.images.personalWebsiteImage.image(
          width: maxWidth * 0.6,
          fit: BoxFit.cover,
        ),
        Positioned(
          child: Row(
            children: [
              if (!reversed) Container(width: maxWidth * 0.3),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: reversed ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Featured Project',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppColors.primary),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Personal Website',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: AppColors.textPrimary),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.backgroundSecondary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                      child: Text(
                        'This website, crafted with Flutter Web and hosted on GitHub Pages, offers a seamless user experience across devices. Delve into its responsive design and explore the source code on GitHub to uncover the innovation behind its creation.',
                        textAlign: reversed ? TextAlign.start : TextAlign.end,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.textSecondary),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 24,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(width: 16),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) => Text(
                          'Flutter',
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const LinkItem(
                      title: 'Source Code',
                      url: '',
                    ),
                  ],
                ),
              ),
              if (reversed) Container(width: maxWidth * 0.3),
            ],
          ),
        ),
      ],
    );
  }
}
