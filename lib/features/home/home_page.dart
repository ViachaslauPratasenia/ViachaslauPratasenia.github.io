import 'package:flutter/material.dart';
import 'package:personal_website/features/home/components/languages_block.dart';
import 'package:personal_website/features/home/components/social_buttons.dart';
import 'package:personal_website/features/home/components/work_item.dart';
import 'package:personal_website/theme/theme.dart';
import 'package:personal_website/theme/typografy.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 56),
              width: MediaQuery.sizeOf(context).width * 0.4,
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
                    const SizedBox(height: 56),
                    const LanguagesBlock(),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.only(right: 56),
                width: MediaQuery.sizeOf(context).width * 0.55,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    const SizedBox(height: 56),
                    Text(
                      'I am a highly skilled software engineer with 5 years of commercial experience in building top-notch applications for Android, iOS, MacOS, Windows and Web platforms using Flutter.\n\nI have a strong passion for creating robust and user-friendly applications that exceed client’s expectations. Throughout my career, I have gained expertise in various aspects of software development, including design, development, testing, and maintenance.\n\nMy deep understanding of programming languages, frameworks, and tools, coupled with my problem-solving skills, has enabled me to deliver complex projects within tight deadlines.',
                      style: AppTheme.typography.semiLarge.regular.textBase,
                    ),
                    const SizedBox(height: 80),
                    const WorkItem(
                      from: 'SEPT 2022',
                      to: 'PRESENT',
                      title: 'Flutter Developer - Aventus IT',
                      subtitle:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut rutrum risus, eu posuere neque. Duis urna erat, maximus sit amet ullamcorper sed, tempor id metus. Aenean a tellus at ex eleifend convallis nec et ligula. Etiam aliquet euismod fermentum. Fusce suscipit et felis a consequat. Integer sem lacus, ultrices sed ipsum sit amet, ultrices tristique velit.',
                      skills: ['Flutter', 'Dart', 'Kotlin', 'Swift', 'Java'],
                    ),
                    const SizedBox(height: 32),
                    const WorkItem(
                      from: 'SEPT 2021',
                      to: 'SEPT 2022',
                      title: 'Flutter Developer - Symfa',
                      subtitle:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut rutrum risus, eu posuere neque. Duis urna erat, maximus sit amet ullamcorper sed, tempor id metus. Aenean a tellus at ex eleifend convallis nec et ligula. Etiam aliquet euismod fermentum. Fusce suscipit et felis a consequat. Integer sem lacus, ultrices sed ipsum sit amet, ultrices tristique velit.',
                      skills: ['Flutter', 'Dart', 'React Native'],
                    ),
                    const SizedBox(height: 32),
                    const WorkItem(
                      from: 'APR 2019',
                      to: 'SEPT 2021',
                      title: 'Android/Flutter Developer - HEAPIX',
                      subtitle:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut rutrum risus, eu posuere neque. Duis urna erat, maximus sit amet ullamcorper sed, tempor id metus. Aenean a tellus at ex eleifend convallis nec et ligula. Etiam aliquet euismod fermentum. Fusce suscipit et felis a consequat. Integer sem lacus, ultrices sed ipsum sit amet, ultrices tristique velit.',
                      skills: ['Android', 'Java', 'Kotlin', 'Flutter', 'Dart'],
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ),
          const Positioned(
            bottom: 56,
            left: 56,
            child: SocialButtons(),
          )
        ],
      ),
    );
  }
}
