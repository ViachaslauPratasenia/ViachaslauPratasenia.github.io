import 'package:flutter/material.dart';
import 'package:personal_website/features/home/components/skill_element.dart';
import 'package:personal_website/theme/theme.dart';
import 'package:personal_website/theme/typografy.dart';

class WorkItem extends StatefulWidget {
  final String from;
  final String to;
  final String title;
  final String subtitle;
  final List<String> skills;

  const WorkItem({
    super.key,
    required this.from,
    required this.to,
    required this.title,
    required this.subtitle,
    this.skills = const [],
  });

  @override
  State<WorkItem> createState() => _WorkItemState();
}

class _WorkItemState extends State<WorkItem> {
  Color containerColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (value) => setState(() => containerColor = AppTheme.colors.accent.withOpacity(0.1)),
      onExit: (value) => setState(() => containerColor = Colors.transparent),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            WorkPeriod(from: widget.from, to: widget.to),
            const SizedBox(width: 32),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.title,
                    style: AppTheme.typography.semiLarge.bold.accent,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.subtitle,
                    style: AppTheme.typography.standard.regular.textBase,
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    direction: Axis.horizontal,
                    spacing: 16,
                    runSpacing: 12,
                    children: List.generate(
                      widget.skills.length,
                      (index) => SkillElement(skillName: widget.skills[index]),
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
