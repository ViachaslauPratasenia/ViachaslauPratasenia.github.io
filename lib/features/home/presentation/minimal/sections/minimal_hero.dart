import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:personal_website/const/const.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/theme/minimal/minimal_colors.dart';
import 'package:personal_website/theme/minimal/minimal_typography.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/mono_label.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/hover_builder.dart';

/// Hero: av kicker, headline, meta row, CV link. Not wrapped in MinimalSection.
class MinimalHero extends StatelessWidget {
  final DeveloperProfile profile;
  final VoidCallback? onDownloadCv;

  const MinimalHero({super.key, required this.profile, this.onDownloadCv});

  /// Height reserved for the fixed nav overlay, so hero content sits below it.
  static const _navHeight = 72.0;

  @override
  Widget build(BuildContext context) {
    final colors = context.minimal;
    final size = MediaQuery.sizeOf(context);
    final narrow = size.width < 640;
    final h1Size = size.width.clamp(360, 1000) / 1000 * 22 + 38; // ~46..60

    // The hero always fills the full viewport height. Its content is centered
    // vertically, with top padding equal to the nav height so nothing slips
    // under the fixed nav overlay.
    return SizedBox(
      height: size.height,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 780),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                narrow ? 24 : 32, _navHeight, narrow ? 24 : 32, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(width: 28, height: 1, color: colors.fg),
                    const SizedBox(width: 12),
                    MonoLabel(profile.heroRole, color: colors.muted, size: 11),
                  ],
                ),
                const SizedBox(height: 40),
                Text(profile.subtitle,
                    style: MinimalTypography.h1(colors.fg, size: h1Size)),
                const SizedBox(height: 44),
                Wrap(
                  spacing: 40,
                  runSpacing: 12,
                  children: [
                    for (final m in profile.heroMeta) _meta(context, m.value, m.label),
                  ],
                ),
                const SizedBox(height: 34),
                _downloadCv(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// "Download CV ↓" — on hover the gap widens so the arrow eases sideways,
  /// and the whole control dims slightly.
  Widget _downloadCv(BuildContext context) {
    final colors = context.minimal;
    const dur = Duration(milliseconds: 280);
    const curve = Curves.easeOutCubic;
    return HoverBuilder(
      builder: (context, hovering) => GestureDetector(
        onTap: onDownloadCv ?? () => launchUrlString(Const.config.CV_URL),
        child: AnimatedOpacity(
          opacity: hovering ? 0.6 : 1.0,
          duration: dur,
          curve: curve,
          child: Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: colors.fg)),
            ),
            padding: const EdgeInsets.only(bottom: 5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                MonoLabel('Download CV', color: colors.fg, size: 12, weight: FontWeight.w500),
                // Gap widens on hover so the arrow eases sideways.
                AnimatedContainer(duration: dur, curve: curve, width: hovering ? 16 : 9),
                Text('↓', style: MinimalTypography.monoLink(colors.fg)),
              ],
            ),
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
          TextSpan(
              text: bold,
              style: TextStyle(color: colors.fg, fontWeight: FontWeight.w500)),
          if (rest.isNotEmpty) TextSpan(text: ' $rest'),
        ],
      ),
    );
  }
}
