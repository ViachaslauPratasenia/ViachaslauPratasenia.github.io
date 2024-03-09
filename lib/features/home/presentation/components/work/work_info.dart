import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:personal_website/core/widgets/link_item.dart';
import 'package:personal_website/core/widgets/measure_size_widget.dart';
import 'package:personal_website/core/widgets/painters/dashed_circle_painter.dart';
import 'package:personal_website/core/widgets/painters/vertical_dashed_line_painter.dart';
import 'package:personal_website/features/home/presentation/components/base_block.dart';
import 'package:personal_website/features/home/presentation/components/section_header.dart';
import 'package:personal_website/theme/app_colors.dart';
import 'package:personal_website/theme/theme_controller.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WorkInfo extends StatelessWidget {
  const WorkInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseBlock(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: constraints.maxWidth * 0.6,
                child: const SectionHeader(index: '02.', title: 'Work Experience'),
              ),
              const SizedBox(height: 32),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) => _WorkItem(addBottomPadding: index != 3 - 1),
              ),
            ],
          );
        }
      ),
    );
  }
}

class _WorkItem extends StatefulWidget {
  final bool addBottomPadding;

  const _WorkItem({required this.addBottomPadding});

  @override
  State<_WorkItem> createState() => _WorkItemState();
}

class _WorkItemState extends State<_WorkItem> {
  Size _contentSize = Size.zero;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            CustomPaint(
              painter: VerticalDashedLinePainter(color: AppColors.primary),
              size: Size(1, _contentSize.height),
            ),
            const _WorkCircle(size: 37, color: AppColors.primary),
          ],
        ),
        const SizedBox(width: 24),
        Expanded(
          child: MeasureSizeWidget(
            onChange: (size) {
              setState(() {
                _contentSize = size;
              });
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Flutter Developer ',
                        style: context.textTheme.headlineMedium
                            ?.copyWith(color: AppColors.textPrimary),
                      ),
                      // add clickable text span
                      TextSpan(
                        text: '@ Aventus IT / 7VPN',
                        style: context.textTheme.headlineMedium?.copyWith(color: AppColors.primary),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // open url
                            launchUrlString('https://7vpn.com');
                          },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'May 2021 - Present',
                  style: context.textTheme.titleMedium?.copyWith(color: AppColors.textSecondary),
                ),
                const SizedBox(height: 16),
                Text(
                  'As a Developer at 7VPN, I play a key role in a three-person development team. My responsibilities encompass a variety of platforms including iOS, macOS, Windows, and Web.\n\nIn addition to mobile and desktop development, I also create the personal account website. My technical contributions include integrating deep links, working with notifications, deploying social login features, news, creating build environments, and other features.\n\nTools: XCode, Android Studio, Figma, Firebase, Google Cloud Platforms.',
                  style: context.textTheme.bodyLarge?.copyWith(color: AppColors.textTertiary),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 32,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => const SizedBox(width: 24),
                    itemBuilder: (BuildContext context, int index) => const LinkItem(
                      title: 'Flutter',
                      url: 'https://flutter.dev',
                    ),
                  ),
                ),
                if (widget.addBottomPadding) const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _WorkCircle extends StatelessWidget {
  final double size;
  final Color color;

  const _WorkCircle({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: size + 12,
          width: size + 12,
          decoration: const BoxDecoration(
            color: AppColors.background,
            shape: BoxShape.circle,
          ),
        ),
        CustomPaint(
          painter: DashedCirclePainter(color: AppColors.primary),
          size: Size(size, size),
        ),
        Center(
          child: Container(
            height: size - 12,
            width: size - 12,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
