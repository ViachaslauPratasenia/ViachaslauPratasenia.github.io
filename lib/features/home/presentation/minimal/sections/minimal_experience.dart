import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/theme/minimal/minimal_colors.dart';
import 'package:personal_website/theme/minimal/minimal_typography.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/minimal_section.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/mono_label.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/hover_builder.dart';

class MinimalExperience extends StatelessWidget {
  final DeveloperProfile profile;

  const MinimalExperience({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final colors = context.minimal;
    final jobs = profile.work;
    return MinimalSection(
      label: 'Experience',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < jobs.length; i++)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                border: i == jobs.length - 1
                    ? null
                    : Border(bottom: BorderSide(color: colors.hair)),
              ),
              child: _job(context, jobs[i]),
            ),
        ],
      ),
    );
  }

  Widget _job(BuildContext context, WorkExperience job) {
    final colors = context.minimal;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Text(job.title, style: MinimalTypography.heading(colors.fg))),
            const SizedBox(width: 16),
            Text(job.workPeriod,
                style: MinimalTypography.mono(colors.faint).copyWith(fontSize: 11.5)),
          ],
        ),
        const SizedBox(height: 6),
        _company(context, job),
        const SizedBox(height: 12),
        Text(job.description, style: MinimalTypography.prose(colors.muted).copyWith(fontSize: 14.5)),
        if (job.links.isNotEmpty) ...[
          const SizedBox(height: 14),
          Wrap(
            spacing: 18,
            runSpacing: 8,
            children: [for (final l in job.links) _link(context, l)],
          ),
        ],
      ],
    );
  }

  /// Company name as a mono label. Clickable (opens [WorkExperience.companyLink])
  /// when a link is present; otherwise a plain label.
  Widget _company(BuildContext context, WorkExperience job) {
    final colors = context.minimal;
    if (job.companyLink.isEmpty) {
      return MonoLabel(job.companyName, color: colors.muted, size: 11);
    }
    return HoverBuilder(
      builder: (context, hovering) => GestureDetector(
        onTap: () => launchUrlString(job.companyLink),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: hovering ? colors.fg : colors.hair),
              ),
            ),
            padding: const EdgeInsets.only(bottom: 2),
            child: MonoLabel(
              job.companyName,
              color: hovering ? colors.fg : colors.muted,
              size: 11,
            ),
          ),
        ),
      ),
    );
  }

  Widget _link(BuildContext context, WorkLink link) {
    final colors = context.minimal;
    return HoverBuilder(
      builder: (context, hovering) => GestureDetector(
        onTap: () => launchUrlString(link.url),
        child: Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: hovering ? colors.fg : colors.hair)),
          ),
          padding: const EdgeInsets.only(bottom: 2),
          child: Text(link.name, style: MinimalTypography.mono(colors.fg).copyWith(fontSize: 11)),
        ),
      ),
    );
  }
}
