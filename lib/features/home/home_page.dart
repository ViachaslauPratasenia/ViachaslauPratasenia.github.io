import 'package:flutter/material.dart';
import 'package:personal_website/features/home/social_buttons.dart';
import 'package:personal_website/theme/theme.dart';
import 'package:personal_website/theme/typografy.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: Row(
        children: [
          SizedBox(width: MediaQuery.sizeOf(context).width * 0.05),
          Expanded(
            flex: 5,
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 56),
                    Text(
                      'Viachaslau Pratasenia',
                      style: AppTheme.typography.extraMega.bold.accent,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Flutter developer at Aventus IT',
                      textAlign: TextAlign.start,
                      style: AppTheme.typography.huge.regular.accent,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Crafting sleek, intuitive Flutter applications for Android, iOS, desktop, and web to enhance user experience.',
                      textAlign: TextAlign.start,
                      style: AppTheme.typography.semiLarge.regular.textBase,
                    ),
                    const Spacer(),
                    const SocialButtons(),
                    const SizedBox(height: 56),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: MediaQuery.sizeOf(context).width * 0.06),
          Expanded(
            flex: 6,
            child: SizedBox(
              width: double.infinity,
              child: ListView(
                children: [
                  const SizedBox(height: 56),
                  Text(
                    'I am a highly skilled software engineer with 5 years of commercial experience in building top-notch applications for Android, iOS, MacOS, Windows and Web platforms using Flutter.\n\nI have a strong passion for creating robust and user-friendly applications that exceed client’s expectations. Throughout my career, I have gained expertise in various aspects of software development, including design, development, testing, and maintenance.\n\nMy deep understanding of programming languages, frameworks, and tools, coupled with my problem-solving skills, has enabled me to deliver complex projects within tight deadlines.',
                    style: AppTheme.typography.semiLarge.regular.textBase,
                  )
                ],
              ),
            ),
          ),
          SizedBox(width: MediaQuery.sizeOf(context).width * 0.05),
        ],
      ),
    );
  }
}
