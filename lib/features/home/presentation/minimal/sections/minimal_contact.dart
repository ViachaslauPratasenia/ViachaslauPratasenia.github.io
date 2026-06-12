import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/theme/minimal/minimal_colors.dart';
import 'package:personal_website/theme/minimal/minimal_typography.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/minimal_section.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/hover_builder.dart';

class MinimalContact extends StatelessWidget {
  final DeveloperProfile profile;

  const MinimalContact({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final colors = context.minimal;
    return Column(
      children: [
        MinimalSection(
          label: 'Contact',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _heading(context),
              const SizedBox(height: 18),
              Text(profile.contactMe.text, style: MinimalTypography.prose(colors.muted)),
              const SizedBox(height: 30),
              Wrap(
                spacing: 26,
                runSpacing: 14,
                children: [
                  for (final link in profile.socialLinks) _social(context, link),
                ],
              ),
            ],
          ),
        ),
        _footer(context),
      ],
    );
  }

  Widget _heading(BuildContext context) {
    final colors = context.minimal;
    final base = MinimalTypography.heading(colors.fg, size: 32);
    final title = profile.contactMe.title;
    const link = 'say hello';

    final spans = <InlineSpan>[];
    final idx = title.indexOf(link);
    if (idx < 0) {
      // No link marker found — render the title verbatim.
      spans.add(TextSpan(text: title));
    } else {
      final before = title.substring(0, idx);
      var after = title.substring(idx + link.length);
      if (before.isNotEmpty) spans.add(TextSpan(text: before));
      // Inline clickable "say hello" — a WidgetSpan keeps this widget stateless.
      // The underline is always the accent (dot) color; on hover the text turns
      // accent too.
      spans.add(
        WidgetSpan(
          alignment: PlaceholderAlignment.baseline,
          baseline: TextBaseline.alphabetic,
          child: HoverBuilder(
            builder: (context, hovering) => GestureDetector(
              onTap: () => launchUrlString('mailto:${profile.email}'),
              child: Text(
                link,
                style: base.copyWith(
                  color: hovering ? colors.dot : colors.fg,
                  decoration: TextDecoration.underline,
                  decorationColor: colors.dot,
                ),
              ),
            ),
          ),
        ),
      );
      // Render a trailing "." in the accent/dot color.
      if (after.endsWith('.')) {
        final head = after.substring(0, after.length - 1);
        if (head.isNotEmpty) spans.add(TextSpan(text: head));
        spans.add(TextSpan(text: '.', style: base.copyWith(color: colors.dot)));
      } else if (after.isNotEmpty) {
        spans.add(TextSpan(text: after));
      }
    }

    return Text.rich(TextSpan(style: base, children: spans));
  }

  Widget _social(BuildContext context, SocialLink link) {
    final colors = context.minimal;
    return HoverBuilder(
      builder: (context, hovering) => GestureDetector(
        onTap: () => launchUrlString(link.url),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: hovering ? colors.fg : colors.hair),
            ),
          ),
          padding: const EdgeInsets.only(bottom: 2),
          child: Text(link.name, style: MinimalTypography.mono(colors.fg).copyWith(fontSize: 12)),
        ),
      ),
    );
  }

  Widget _footer(BuildContext context) {
    final colors = context.minimal;
    final narrow = MediaQuery.sizeOf(context).width < 600;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(border: Border(top: BorderSide(color: colors.hair))),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 780),
          child: Padding(
            padding: EdgeInsets.fromLTRB(narrow ? 24 : 32, 34, narrow ? 24 : 32, 60),
            child: Wrap(
              spacing: 16,
              runSpacing: 10,
              alignment: WrapAlignment.spaceBetween,
              children: [
                Text('© 2026 Viachaslau Pratasenia',
                    style: MinimalTypography.mono(colors.faint).copyWith(fontSize: 11)),
                Text('Flutter Developer / Mobile Team Lead',
                    style: MinimalTypography.mono(colors.faint).copyWith(fontSize: 11)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
