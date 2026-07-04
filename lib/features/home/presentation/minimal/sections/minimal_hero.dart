import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:personal_website/const/const.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/theme/minimal/minimal_colors.dart';
import 'package:personal_website/theme/minimal/minimal_typography.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/mono_label.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/hover_builder.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/line_reveal_text.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/dot_grid_painter.dart';

/// Hero: dot-grid backdrop, kicker with live status, huge display headline
/// revealed line by line, and a full-width meta strip pinned to the bottom
/// of the viewport. Not wrapped in MinimalSection.
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
    // Display headline scales ~44..88 across 360..1280 viewport widths,
    // capped by viewport height so short windows never overflow.
    final byWidth = 44 + (size.width.clamp(360, 1280) - 360) / 920 * 44;
    final displaySize = math.min(byWidth, size.height * 0.085).clamp(30.0, 88.0);

    return SizedBox(
      height: size.height,
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: DotGridPainter(color: colors.fg.withValues(alpha: 0.06)),
            ),
          ),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1100),
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    narrow ? 24 : 32, _navHeight, narrow ? 24 : 32, 96),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _kicker(context),
                    const SizedBox(height: 36),
                    LineRevealText(
                      profile.subtitle,
                      style: MinimalTypography.display(colors.fg,
                          size: displaySize),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _metaStrip(context, narrow),
          ),
        ],
      ),
    );
  }

  /// Role kicker with a live "inbox open" status.
  Widget _kicker(BuildContext context) {
    final colors = context.minimal;
    return Wrap(
      spacing: 28,
      runSpacing: 12,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 28, height: 1, color: colors.fg),
            const SizedBox(width: 12),
            MonoLabel(profile.heroRole, color: colors.muted, size: 11),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _PulsingDot(color: colors.dot),
            const SizedBox(width: 8),
            MonoLabel('Inbox open', color: colors.muted, size: 11),
          ],
        ),
      ],
    );
  }

  /// Full-width strip pinned to the viewport bottom: meta values left,
  /// Download CV right, hairline above.
  Widget _metaStrip(BuildContext context, bool narrow) {
    final colors = context.minimal;
    final meta = Wrap(
      spacing: 36,
      runSpacing: 10,
      children: [
        for (final m in profile.heroMeta) _meta(context, m.value, m.label),
      ],
    );

    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: colors.hair)),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: narrow ? 24 : 32, vertical: 22),
            child: narrow
                // Full width so the column stays left-aligned inside Center.
                ? SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        meta,
                        const SizedBox(height: 18),
                        _downloadCv(context),
                      ],
                    ),
                  )
                : Row(
                    children: [
                      Expanded(child: meta),
                      const SizedBox(width: 24),
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
                MonoLabel('Download CV',
                    color: colors.fg, size: 12, weight: FontWeight.w500),
                // Gap widens on hover so the arrow eases sideways.
                AnimatedContainer(
                    duration: dur, curve: curve, width: hovering ? 16 : 9),
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

/// Small accent dot that gently pulses — signals "live" availability.
class _PulsingDot extends StatefulWidget {
  final Color color;

  const _PulsingDot({required this.color});

  @override
  State<_PulsingDot> createState() => _PulsingDotState();
}

class _PulsingDotState extends State<_PulsingDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1200),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween(begin: 0.35, end: 1.0).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeInOut)),
      child: Container(
        width: 7,
        height: 7,
        decoration:
            BoxDecoration(color: widget.color, shape: BoxShape.circle),
      ),
    );
  }
}
