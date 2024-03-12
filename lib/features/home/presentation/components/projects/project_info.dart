import 'package:flutter/material.dart';
import 'package:personal_website/core/orientation_provider.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/features/home/presentation/components/base_block.dart';
import 'package:personal_website/features/home/presentation/components/projects/project_item.dart';
import 'package:personal_website/features/home/presentation/components/section_header.dart';

class ProjectInfo extends StatelessWidget {
  final DeveloperProfile developerProfile;

  const ProjectInfo({super.key, required this.developerProfile});

  @override
  Widget build(BuildContext context) {
    final orientation = OrientationProvider.of(context).orientation;
    return BaseBlock(
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
              itemCount: developerProfile.projects.length,
              separatorBuilder: (context, index) => SizedBox(
                height: orientation == Orientation.landscape ? 64 : 32,
              ),
              itemBuilder: (context, index) => ProjectItem(
                project: developerProfile.projects[index],
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
