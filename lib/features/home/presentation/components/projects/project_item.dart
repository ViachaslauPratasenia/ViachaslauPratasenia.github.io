import 'package:flutter/material.dart';
import 'package:personal_website/core/orientation_provider.dart';
import 'package:personal_website/core/widgets/link_item.dart';
import 'package:personal_website/core/widgets/measure_size_widget.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/theme/app_colors.dart';
import 'package:personal_website/theme/theme_controller.dart';

class ProjectItem extends StatelessWidget {
  final bool reversed;
  final double maxWidth;
  final Project project;

  const ProjectItem({
    super.key,
    required this.project,
    required this.maxWidth,
    this.reversed = false,
  });

  @override
  Widget build(BuildContext context) {
    final orientation = OrientationProvider.of(context).orientation;

    return orientation == Orientation.landscape
        ? _ProjectItemLandscape(
            project: project,
            reversed: reversed,
            maxWidth: maxWidth,
          )
        : _ProjectItemPortrait(project: project);
  }
}

class _ProjectItemPortrait extends StatefulWidget {
  final Project project;

  const _ProjectItemPortrait({required this.project});

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
          Image.network(
            widget.project.image,
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
                    widget.project.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.textPrimary,
                        ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    widget.project.description,
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
                      widget.project.tags.length,
                      (index) => Text(
                        widget.project.tags[index],
                        style:
                            context.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  LinkItem(
                    title: widget.project.linkName,
                    url: widget.project.link,
                    analyticsName: 'open_project',
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
  final Project project;

  final double maxWidth;
  final bool reversed;

  const _ProjectItemLandscape({
    required this.reversed,
    required this.maxWidth,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: reversed ? Alignment.centerRight : Alignment.centerLeft,
      children: [
        Image.network(
          project.image,
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
                      project.title,
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
                        project.description,
                        textAlign: reversed ? TextAlign.start : TextAlign.end,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.textSecondary),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      direction: Axis.horizontal,
                      runSpacing: 8,
                      spacing: 16,
                      children: List.generate(
                        project.tags.length,
                        (index) => Text(
                          project.tags[index],
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    LinkItem(
                      title: project.linkName,
                      url: project.link,
                      analyticsName: 'open_project',
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
