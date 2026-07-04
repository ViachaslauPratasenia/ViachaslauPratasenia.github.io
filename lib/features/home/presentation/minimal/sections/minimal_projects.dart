import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/theme/minimal/minimal_colors.dart';
import 'package:personal_website/theme/minimal/minimal_typography.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/minimal_section.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/hover_builder.dart';

class MinimalProjects extends StatelessWidget {
  final DeveloperProfile profile;

  const MinimalProjects({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final items = profile.projects;
    return MinimalSection(
      label: 'Projects',
      index: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < items.length; i++)
            _project(context, items[i], last: i == items.length - 1),
        ],
      ),
    );
  }

  /// Table row: big title with an accent ↗ on hover, mono meta right,
  /// content eases 6px right + subtle highlight.
  Widget _project(BuildContext context, Project project, {required bool last}) {
    final colors = context.minimal;
    return HoverBuilder(
      builder: (context, hovering) => GestureDetector(
        onTap: () => launchUrlString(project.link),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          padding: EdgeInsets.only(top: 26, bottom: 26, left: hovering ? 6 : 0),
          decoration: BoxDecoration(
            color: hovering
                ? colors.fg.withValues(alpha: 0.035)
                : Colors.transparent,
            border:
                last ? null : Border(bottom: BorderSide(color: colors.hair)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(project.title,
                              style: MinimalTypography.heading(
                                  hovering ? colors.dot : colors.fg,
                                  size: 19)),
                        ),
                        const SizedBox(width: 8),
                        Text('↗',
                            style: MinimalTypography.mono(
                                    hovering ? colors.dot : colors.faint)
                                .copyWith(fontSize: 13)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(project.linkName,
                      style: MinimalTypography.mono(colors.faint)
                          .copyWith(fontSize: 11)),
                ],
              ),
              const SizedBox(height: 8),
              Text(project.description,
                  style: MinimalTypography.prose(colors.muted)
                      .copyWith(fontSize: 14.5)),
              const SizedBox(height: 8),
              Text(project.tags.join(' · '),
                  style: MinimalTypography.mono(colors.faint)
                      .copyWith(fontSize: 11)),
            ],
          ),
        ),
      ),
    );
  }
}
