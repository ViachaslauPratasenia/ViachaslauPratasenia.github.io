import 'package:firebase_analytics_web/firebase_analytics_web.dart';
import 'package:flutter/material.dart';
import 'package:personal_website/const/assets/assets.gen.dart';
import 'package:personal_website/core/orientation_provider.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/features/home/presentation/components/orientation_item_container.dart';
import 'package:personal_website/features/home/presentation/components/skill_element.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjectItem extends StatelessWidget {
  final Project project;

  const ProjectItem({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final orientation = OrientationProvider.orientationOf(context);
    return OrientationItemContainer(
      onTap: onTap,
      child: Container(
        padding: orientation == Orientation.landscape
            ? const EdgeInsets.symmetric(horizontal: 32, vertical: 24)
            : const EdgeInsets.symmetric(vertical: 24),
        child: Row(
          children: [
            if (orientation == Orientation.landscape) ...[
              _Image(imagePath: project.image, width: MediaQuery.sizeOf(context).width * 0.12),
              const SizedBox(width: 32),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: onTap,
                    child: Row(
                      children: [
                        Text(
                          project.title,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                        ),
                        const SizedBox(width: 4),
                        Assets.images.icShare.image(
                          width: 12,
                          height: 12,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    project.description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.normal,
                          color: Theme.of(context).colorScheme.surface,
                        ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    direction: Axis.horizontal,
                    spacing: 12,
                    runSpacing: 8,
                    children: List.generate(
                      project.tags.length,
                      (index) => SkillElement(skillName: project.tags[index]),
                    ),
                  ),
                  if (orientation == Orientation.portrait) ...[
                    const SizedBox(height: 12),
                    _Image(
                      imagePath: project.image,
                      width: MediaQuery.sizeOf(context).width * 0.4,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onTap() {
    FirebaseAnalyticsWeb().logEvent(name: 'open_project', parameters: {
      'project_title': project.title,
      'project_link': project.link,
    });
    launchUrlString(project.link);
  }
}

class _Image extends StatelessWidget {
  final String imagePath;
  final double width;

  const _Image({required this.imagePath, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.tertiary,
          width: 0.5,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8), // Image border
        child: Image.network(
          imagePath,
          width: width,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
