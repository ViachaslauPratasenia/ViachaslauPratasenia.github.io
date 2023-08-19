import 'package:flutter/material.dart';
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
  Color titleColor = AppTheme.colors.accent;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (value) => setState(() {
        containerColor = AppTheme.colors.accent.withOpacity(0.1);
        titleColor = AppTheme.colors.secondary;
      }),
      onExit: (value) => setState(() {
        containerColor = Colors.transparent;
        titleColor = AppTheme.colors.accent;
      }),
      child: GestureDetector(
          onTap: () => launchUrlString(widget.workExperience.companyLink),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              WorkPeriod(
                from: widget.workExperience.from,
                to: widget.workExperience.to,
              ),
              const SizedBox(width: 32),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.workExperience.title,
                      style: AppTheme.typography.semiLarge.bold.copyWith(
                        color: titleColor,
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
                      spacing: 16,
                      runSpacing: 12,
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
