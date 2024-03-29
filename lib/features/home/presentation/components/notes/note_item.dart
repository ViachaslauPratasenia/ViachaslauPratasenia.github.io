import 'package:firebase_analytics_web/firebase_analytics_web.dart';
import 'package:flutter/material.dart';
import 'package:personal_website/const/assets/assets.gen.dart';
import 'package:personal_website/core/orientation_provider.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/theme/app_colors.dart';
import 'package:personal_website/theme/theme_controller.dart';
import 'package:url_launcher/url_launcher_string.dart';

class NoteItem extends StatefulWidget {
  final BlogPost note;

  const NoteItem({super.key, required this.note});

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  Color primaryColor = AppColors.textPrimary;
  Offset offset = const Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    final orientation = OrientationProvider.of(context).orientation;

    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onHover: (hover) {
        setState(() {
          primaryColor = hover ? AppColors.primary : AppColors.textPrimary;
          offset = hover ? const Offset(0, -4) : const Offset(0, 0);
        });
      },
      onTap: () {
        FirebaseAnalyticsWeb().logEvent(name: 'open_blog_post', parameters: {
          'blog_post_title': widget.note.title,
          'blog_post_link': widget.note.link,
        });
        launchUrlString(widget.note.link);
      },
      child: _TranslateOnHover(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.backgroundSecondary,
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.folder_outlined, size: 40, color: AppColors.primary),
                  Assets.svg.icExternalLink.svg(
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(AppColors.textSecondary, BlendMode.srcIn),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                widget.note.title,
                style: context.textTheme.titleLarge?.copyWith(color: primaryColor),
              ),
              const SizedBox(height: 12),
              Text(
                widget.note.description,
                style: context.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
              if (orientation == Orientation.landscape)
                const Spacer()
              else
                const SizedBox(height: 32),
              Wrap(
                direction: Axis.horizontal,
                runSpacing: 8,
                spacing: 16,
                children: List.generate(
                  widget.note.tags.length,
                  (index) => Text(
                    widget.note.tags[index],
                    style: context.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TranslateOnHover extends StatefulWidget {
  final Widget child;

  const _TranslateOnHover({required this.child});

  @override
  State<_TranslateOnHover> createState() => _TranslateOnHoverState();
}

class _TranslateOnHoverState extends State<_TranslateOnHover> {
  double dy = 0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 200),
        tween: Tween<double>(begin: 0, end: dy),
        builder: (BuildContext context, double value, _) {
          return Transform.translate(offset: Offset(0, value), child: widget.child);
        },
      ),
    );
  }

  void _mouseEnter(bool hover) {
    setState(() => dy = hover ? -6 : 0);
  }
}
