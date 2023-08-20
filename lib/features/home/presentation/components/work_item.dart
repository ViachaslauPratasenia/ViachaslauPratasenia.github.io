import 'package:flutter/material.dart';
import 'package:personal_website/const/assets/assets.gen.dart';
import 'package:personal_website/core/orientation_provider.dart';
import 'package:personal_website/features/home/data/developer_profile.dart';
import 'package:personal_website/features/home/presentation/components/link_item.dart';
import 'package:personal_website/features/home/presentation/components/skill_element.dart';
import 'package:personal_website/theme/theme.dart';
import 'package:personal_website/theme/typografy.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WorkItem extends StatefulWidget {
  final WorkExperience workExperience;

  const WorkItem({super.key, required this.workExperience});

  @override
  State<WorkItem> createState() => _WorkItemState();
}

class _WorkItemState extends State<WorkItem> {
  Color containerColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    final orientation = OrientationProvider.of(context).orientation;
    return WorkContainer(
      onTap: () => launchUrlString(widget.workExperience.companyLink),
      child: Container(
        padding: orientation == Orientation.landscape
            ? const EdgeInsets.symmetric(horizontal: 32, vertical: 24)
            : const EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            if (orientation == Orientation.landscape) ...[
              WorkPeriod(
                from: widget.workExperience.from,
                to: widget.workExperience.to,
              ),
              const SizedBox(width: 32),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (orientation == Orientation.portrait) ...[
                    Text(
                      '${widget.workExperience.from} - ${widget.workExperience.to}',
                      style: AppTheme.typography.standard.semibold.textBase,
                    ),
                    const SizedBox(height: 8),
                  ],
                  GestureDetector(
                    onTap: () => launchUrlString(widget.workExperience.companyLink),
                    child: Row(
                      children: [
                        Text(
                          widget.workExperience.title,
                          style: AppTheme.typography.semiLarge.bold.accent,
                        ),
                        const SizedBox(width: 4),
                        Assets.images.icShare.image(
                          width: 12,
                          height: 12,
                          color: AppTheme.colors.accent,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.workExperience.description,
                    style: AppTheme.typography.standard.regular.textBase,
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    direction: Axis.horizontal,
                    spacing: 8,
                    runSpacing: 12,
                    children: List.generate(
                      widget.workExperience.links.length,
                      (index) => LinkItem(link: widget.workExperience.links[index]),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    direction: Axis.horizontal,
                    spacing: 12,
                    runSpacing: 8,
                    children: List.generate(
                      widget.workExperience.skills.length,
                      (index) => SkillElement(skillName: widget.workExperience.skills[index]),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WorkPeriod extends StatelessWidget {
  final String from;
  final String to;

  const WorkPeriod({super.key, required this.from, required this.to});

  @override
  Widget build(BuildContext context) {
    final textStyle = AppTheme.typography.small.medium.textBase;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(from, style: textStyle),
        const SizedBox(height: 8),
        Text('|', style: textStyle),
        const SizedBox(height: 8),
        Text(to, style: textStyle),
      ],
    );
  }
}

class WorkContainer extends StatelessWidget {
  final Widget child;
  final void Function() onTap;

  const WorkContainer({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    if (OrientationProvider.of(context).orientation == Orientation.landscape) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        hoverColor: AppTheme.colors.accent.withOpacity(0.05),
        highlightColor: AppTheme.colors.accent.withOpacity(0.1),
        child: child,
      );
    }

    return child;
  }
}
