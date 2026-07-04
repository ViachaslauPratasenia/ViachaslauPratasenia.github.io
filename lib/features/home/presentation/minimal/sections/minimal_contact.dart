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
          index: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _heading(context),
              const SizedBox(height: 22),
              Text(profile.contactMe.text,
                  style: MinimalTypography.prose(colors.muted)),
              const SizedBox(height: 40),
              _email(context),
              const SizedBox(height: 40),
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

  /// Large display invitation. "say hello" stays an inline mailto link and
  /// a trailing "." renders in the accent color.
  Widget _heading(BuildContext context) {
    final colors = context.minimal;
    final width = MediaQuery.sizeOf(context).width;
    final size = 30 + (width.clamp(360, 1280) - 360) / 920 * 18; // ~30..48
    final base = MinimalTypography.sectionTitle(colors.fg, size: size);
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

  /// The email as a big mono link. A hairline sits under it permanently;
  /// on hover an accent line grows over it from the left.
  Widget _email(BuildContext context) {
    final colors = context.minimal;
    final width = MediaQuery.sizeOf(context).width;
    final size = width < 480 ? 15.0 : (width < 900 ? 18.0 : 22.0);

    return HoverBuilder(
      builder: (context, hovering) => GestureDetector(
        onTap: () => launchUrlString('mailto:${profile.email}'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              profile.email,
              style: MinimalTypography.mono(colors.fg)
                  .copyWith(fontSize: size, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Stack(
              children: [
                Container(height: 1, color: colors.hair),
                AnimatedFractionallySizedBox(
                  duration: const Duration(milliseconds: 320),
                  curve: Curves.easeOutCubic,
                  widthFactor: hovering ? 1.0 : 0.0,
                  alignment: Alignment.centerLeft,
                  child: Container(height: 1, color: colors.dot),
                ),
              ],
            ),
          ],
        ),
      ),
    );
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
          child: Text(link.name,
              style:
                  MinimalTypography.monoLink(colors.fg).copyWith(fontSize: 12)),
        ),
      ),
    );
  }

  Widget _footer(BuildContext context) {
    final colors = context.minimal;
    final narrow = MediaQuery.sizeOf(context).width < 600;
    return Container(
      width: double.infinity,
      decoration:
          BoxDecoration(border: Border(top: BorderSide(color: colors.hair))),
      child: Column(
        children: [
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1100),
              child: Padding(
                padding:
                    EdgeInsets.fromLTRB(narrow ? 24 : 32, 34, narrow ? 24 : 32, 20),
                // Full width so the narrow column stays left-aligned.
                child: SizedBox(
                  width: double.infinity,
                  child: _footerContent(context, narrow),
                ),
              ),
            ),
          ),
          _watermark(context),
        ],
      ),
    );
  }

  /// Giant translucent surname, cropped at the bottom — the editorial
  /// sign-off of the page.
  Widget _watermark(BuildContext context) {
    final colors = context.minimal;
    final surname = profile.name.split(' ').last.toUpperCase();
    return ClipRect(
      child: Align(
        alignment: Alignment.topCenter,
        heightFactor: 0.62,
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                surname,
                style: MinimalTypography.display(
                  colors.fg.withValues(alpha: 0.05),
                ).copyWith(letterSpacing: 4, height: 1.0),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _footerContent(BuildContext context, bool narrow) {
    final colors = context.minimal;
    final style = MinimalTypography.mono(colors.faint).copyWith(fontSize: 11);
    final copyright = Text('© 2026 Viachaslau Pratasenia', style: style);
    final role = Text('Flutter Developer / Mobile Team Lead', style: style);

    // Wide: copyright pinned left, role pinned right (CSS space-between).
    // Narrow: stacked, left-aligned.
    if (narrow) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [copyright, const SizedBox(height: 10), role],
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [copyright, role],
    );
  }
}
