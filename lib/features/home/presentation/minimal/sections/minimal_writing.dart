import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/theme/minimal/minimal_colors.dart';
import 'package:personal_website/theme/minimal/minimal_typography.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/minimal_section.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/hover_builder.dart';

class MinimalWriting extends StatelessWidget {
  final DeveloperProfile profile;

  const MinimalWriting({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final posts = profile.blogPosts;
    return MinimalSection(
      label: 'Writing',
      index: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < posts.length; i++)
            _post(context, posts[i], last: i == posts.length - 1),
        ],
      ),
    );
  }

  Widget _post(BuildContext context, BlogPost post, {required bool last}) {
    final colors = context.minimal;
    return HoverBuilder(
      builder: (context, hovering) => GestureDetector(
        onTap: () => launchUrlString(post.link),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          padding: EdgeInsets.only(top: 18, bottom: 18, left: hovering ? 6 : 0),
          decoration: BoxDecoration(
            color: hovering
                ? colors.fg.withValues(alpha: 0.035)
                : Colors.transparent,
            border:
                last ? null : Border(bottom: BorderSide(color: colors.hair)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Flexible(
                      child: Text(post.title,
                          style: MinimalTypography.heading(
                              hovering ? colors.dot : colors.fg,
                              size: 16)),
                    ),
                    const SizedBox(width: 8),
                    Text('↗',
                        style: MinimalTypography.mono(
                                hovering ? colors.dot : colors.faint)
                            .copyWith(fontSize: 12)),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Text(post.date,
                  style: MinimalTypography.mono(colors.faint)
                      .copyWith(fontSize: 11)),
            ],
          ),
        ),
      ),
    );
  }
}
