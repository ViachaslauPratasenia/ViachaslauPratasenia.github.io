import 'package:flutter/material.dart';
import 'package:personal_website/const/assets/assets.gen.dart';
import 'package:personal_website/core/orientation_provider.dart';
import 'package:personal_website/core/widgets/link_item.dart';
import 'package:personal_website/core/widgets/measure_size_widget.dart';
import 'package:personal_website/theme/app_colors.dart';
import 'package:personal_website/theme/theme_controller.dart';

class ProjectItem extends StatelessWidget {
  final bool reversed;
  final double maxWidth;

  const ProjectItem({super.key, this.reversed = false, required this.maxWidth});

  @override
  Widget build(BuildContext context) {
    final orientation = OrientationProvider.of(context).orientation;

    return orientation == Orientation.landscape
        ? _ProjectItemLandscape(
            reversed: reversed,
            maxWidth: maxWidth,
          )
        : const _ProjectItemPortrait();
  }
}

class _ProjectItemPortrait extends StatefulWidget {
  const _ProjectItemPortrait({super.key});

  @override
  State<_ProjectItemPortrait> createState() => _ProjectItemPortraitState();
}

class _ProjectItemPortraitState extends State<_ProjectItemPortrait> {
  Size _contentSize = Size.zero;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        children: [
          Assets.images.personalWebsiteImage.image(
            width: double.infinity,
            height: _contentSize.height,
            fit: BoxFit.cover,
            color: AppColors.backgroundSecondary.withOpacity(0.85),
            colorBlendMode: BlendMode.srcOver,
          ),
          MeasureSizeWidget(
            onChange: (size) => setState(() => _contentSize = size),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Featured Project',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.primary,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Personal Website',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.textPrimary,
                        ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'This website, crafted with Flutter Web and hosted on GitHub Pages, offers a seamless user experience across devices. Delve into its responsive design and explore the source code on GitHub to uncover the innovation behind its creation.',
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    direction: Axis.horizontal,
                    runSpacing: 8,
                    spacing: 16,
                    children: List.generate(
                      10,
                      (index) => Text(
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
          ),
        ],
      ),
    );
  }
}

class _ProjectItemLandscape extends StatelessWidget {
  final double maxWidth;
  final bool reversed;

  const _ProjectItemLandscape({required this.reversed, required this.maxWidth});

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
