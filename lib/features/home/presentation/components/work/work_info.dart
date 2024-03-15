import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:personal_website/core/orientation_provider.dart';
import 'package:personal_website/core/widgets/link_item.dart';
import 'package:personal_website/core/widgets/measure_size_widget.dart';
import 'package:personal_website/core/widgets/painters/dashed_circle_painter.dart';
import 'package:personal_website/core/widgets/painters/vertical_dashed_line_painter.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/features/home/presentation/components/base_block.dart';
import 'package:personal_website/features/home/presentation/components/section_header.dart';
import 'package:personal_website/features/home/presentation/components/visibility_block.dart';
import 'package:personal_website/theme/app_colors.dart';
import 'package:personal_website/theme/theme_controller.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WorkInfo extends StatelessWidget {
  final DeveloperProfile developerProfile;

  const WorkInfo({super.key, required this.developerProfile});

  @override
  Widget build(BuildContext context) {
    final orientation = OrientationProvider.of(context).orientation;

    return VisibilityBlock(
      blockKey: const Key('work-info'),
      child: BaseBlock(
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: orientation == Orientation.landscape
                    ? constraints.maxWidth * 0.6
                    : constraints.maxWidth,
                child: const SectionHeader(index: '02.', title: 'Work Experience'),
              ),
              const SizedBox(height: 32),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: developerProfile.work.length,
                itemBuilder: (context, index) => _WorkItem(
                  addBottomPadding: index != developerProfile.work.length - 1,
                  workExperience: developerProfile.work[index],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class _WorkItem extends StatefulWidget {
  final bool addBottomPadding;
  final WorkExperience workExperience;

  const _WorkItem({required this.addBottomPadding, required this.workExperience});

  @override
  State<_WorkItem> createState() => _WorkItemState();
}

class _WorkItemState extends State<_WorkItem> {
  Size _contentSize = Size.zero;

  @override
  Widget build(BuildContext context) {
    final orientation = OrientationProvider.of(context).orientation;
    final circleSize = orientation == Orientation.landscape ? 43.0 : 33.0;

    final titleStyle = orientation == Orientation.landscape
        ? context.textTheme.headlineMedium
        : context.textTheme.titleLarge;

    final periodStyle = orientation == Orientation.landscape
        ? context.textTheme.titleMedium
        : context.textTheme.titleSmall;

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
            _WorkCircle(size: circleSize, color: AppColors.primary),
          ],
        ),
        const SizedBox(width: 24),
        Expanded(
          child: MeasureSizeWidget(
            onChange: (size) => setState(() => _contentSize = size),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${widget.workExperience.title} ',
                        style: titleStyle?.copyWith(color: AppColors.textPrimary),
                      ),
                      TextSpan(
                        text: '@ ${widget.workExperience.companyName}',
                        style: titleStyle?.copyWith(color: AppColors.primary),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => launchUrlString(widget.workExperience.companyLink),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  widget.workExperience.workPeriod,
                  style: periodStyle?.copyWith(color: AppColors.textSecondary),
                ),
                const SizedBox(height: 16),
                Text(
                  widget.workExperience.description,
                  style: context.textTheme.bodyLarge?.copyWith(color: AppColors.textTertiary),
                ),
                const SizedBox(height: 8),
                Wrap(
                  direction: Axis.horizontal,
                  runSpacing: 8,
                  spacing: 16,
                  children: List.generate(
                    widget.workExperience.links.length,
                    (index) => LinkItem(
                      title: widget.workExperience.links[index].name,
                      url: widget.workExperience.links[index].url,
                      analyticsName: 'open_work_link',
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
