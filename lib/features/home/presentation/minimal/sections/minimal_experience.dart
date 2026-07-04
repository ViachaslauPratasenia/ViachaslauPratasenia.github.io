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
    final jobs = profile.work;
    return MinimalSection(
      label: 'Experience',
      index: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < jobs.length; i++)
            _row(context, jobs[i], last: i == jobs.length - 1),
        ],
      ),
    );
  }

  /// Registry row: mono period in a narrow left column, role + company +
  /// description right. Subtle background highlight on hover.
  Widget _row(BuildContext context, WorkExperience job, {required bool last}) {
    final colors = context.minimal;
    final wide = MediaQuery.sizeOf(context).width >= 700;

    return HoverBuilder(
      cursor: MouseCursor.defer,
      builder: (context, hovering) => AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        padding: const EdgeInsets.symmetric(vertical: 28),
        decoration: BoxDecoration(
          color: hovering
              ? colors.fg.withValues(alpha: 0.035)
              : Colors.transparent,
          border: last ? null : Border(bottom: BorderSide(color: colors.hair)),
        ),
        child: wide
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 130,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(job.workPeriod,
                          style: MinimalTypography.mono(colors.faint)
                              .copyWith(fontSize: 11.5)),
                    ),
                  ),
                  const SizedBox(width: 28),
                  Expanded(child: _details(context, job)),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(job.workPeriod,
                      style: MinimalTypography.mono(colors.faint)
                          .copyWith(fontSize: 11.5)),
                  const SizedBox(height: 10),
                  _details(context, job),
                ],
              ),
      ),
    );
  }

  Widget _details(BuildContext context, WorkExperience job) {
    final colors = context.minimal;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(job.title, style: MinimalTypography.heading(colors.fg)),
        const SizedBox(height: 6),
        _company(context, job),
        const SizedBox(height: 12),
        Text(job.description,
            style: MinimalTypography.prose(colors.muted)
                .copyWith(fontSize: 14.5)),
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
  /// when a link is present; otherwise a plain label. The ↗ eases right on hover.
  Widget _company(BuildContext context, WorkExperience job) {
    final colors = context.minimal;
    if (job.companyLink.isEmpty) {
      return MonoLabel(job.companyName, color: colors.muted, size: 11);
    }
    const dur = Duration(milliseconds: 200);
    return HoverBuilder(
      builder: (context, hovering) => GestureDetector(
        onTap: () => launchUrlString(job.companyLink),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom:
                        BorderSide(color: hovering ? colors.fg : colors.hair),
                  ),
                ),
                padding: const EdgeInsets.only(bottom: 2),
                child: MonoLabel(
                  job.companyName,
                  color: hovering ? colors.fg : colors.muted,
                  size: 11,
                  weight: FontWeight.w500,
                ),
              ),
              AnimatedContainer(
                  duration: dur,
                  curve: Curves.easeOut,
                  width: hovering ? 8 : 4),
              Text('↗',
                  style: MinimalTypography.mono(
                          hovering ? colors.dot : colors.faint)
                      .copyWith(fontSize: 11)),
            ],
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
            border: Border(
                bottom:
                    BorderSide(color: hovering ? colors.fg : colors.hair)),
          ),
          padding: const EdgeInsets.only(bottom: 2),
          child: Text(link.name,
              style: MinimalTypography.monoLink(colors.fg)
                  .copyWith(fontSize: 11)),
        ),
      ),
    );
  }
}
