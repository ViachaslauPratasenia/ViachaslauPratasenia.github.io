import 'package:flutter/material.dart';
import 'package:personal_website/core/data/models/project/project.dart';
import 'package:personal_website/core/orientation_provider.dart';
import 'package:personal_website/features/home/presentation/components/base_block.dart';
import 'package:personal_website/features/home/presentation/components/projects/project_item_widget.dart';
import 'package:personal_website/features/home/presentation/components/section_header.dart';
import 'package:personal_website/features/home/presentation/components/visibility_block.dart';

class ProjectInfo extends StatelessWidget {
  final Projects projects;

  const ProjectInfo({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    final orientation = OrientationProvider.of(context).orientation;
    return VisibilityBlock(
      blockKey: const Key('project-info'),
      child: BaseBlock(
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: orientation == Orientation.landscape
                    ? constraints.maxWidth * 0.6
                    : constraints.maxWidth,
                child: const SectionHeader(index: '03.', title: 'Some Things I’ve Built'),
              ),
              const SizedBox(height: 32),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: projects.items.length,
                separatorBuilder: (context, index) => SizedBox(
                  height: orientation == Orientation.landscape ? 64 : 32,
                ),
                itemBuilder: (context, index) => ProjectItemWidget(
                  project: projects.items[index],
                  reversed: index.isOdd,
                  maxWidth: constraints.maxWidth,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
