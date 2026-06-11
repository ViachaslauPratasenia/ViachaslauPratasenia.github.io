import 'package:flutter/material.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/theme/minimal/minimal_colors.dart';
import 'package:personal_website/theme/minimal/minimal_typography.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/mono_label.dart';

/// Hero: av kicker, headline, meta row, CV link. Not wrapped in MinimalSection.
class MinimalHero extends StatelessWidget {
  final DeveloperProfile profile;
  final VoidCallback? onDownloadCv;

  const MinimalHero({super.key, required this.profile, this.onDownloadCv});

  /// Short hero headline from the design mockup. Hardcoded for now (the profile
  /// model has no dedicated short-headline field; `subtitle` is the kicker and
  /// `fullDescription`/`aboutMe` belong to the About section).
  static const _headline =
      'I build things with Flutter and lead teams to create amazing products.';

  @override
  Widget build(BuildContext context) {
    final colors = context.minimal;
    final width = MediaQuery.sizeOf(context).width;
    final narrow = width < 640;
    final h1Size = width.clamp(360, 1000) / 1000 * 22 + 38; // ~46..60

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 780),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              narrow ? 24 : 32, narrow ? 120 : 200, narrow ? 24 : 32, narrow ? 64 : 130),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(width: 28, height: 1, color: colors.fg),
                  const SizedBox(width: 12),
                  MonoLabel(profile.subtitle, color: colors.muted, size: 11),
                ],
              ),
              const SizedBox(height: 40),
              Text(_headline, style: MinimalTypography.h1(colors.fg, size: h1Size)),
              const SizedBox(height: 44),
              Wrap(
                spacing: 40,
                runSpacing: 12,
                children: [
                  _meta(context, '7+', 'years'),
                  _meta(context, 'Flutter', '/ Dart'),
                  _meta(context, 'iOS · Android · Web · Desktop', ''),
                ],
              ),
              const SizedBox(height: 34),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: onDownloadCv,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: colors.fg)),
                    ),
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MonoLabel('Download CV', color: colors.fg, size: 12),
                        const SizedBox(width: 9),
                        Text('↓', style: MinimalTypography.mono(colors.fg)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _meta(BuildContext context, String bold, String rest) {
    final colors = context.minimal;
    return RichText(
      text: TextSpan(
        style: MinimalTypography.mono(colors.muted).copyWith(fontSize: 12),
        children: [
          TextSpan(text: bold, style: TextStyle(color: colors.fg, fontWeight: FontWeight.w500)),
          if (rest.isNotEmpty) TextSpan(text: ' $rest'),
        ],
      ),
    );
  }
}
