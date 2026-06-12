import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_website/theme/minimal/minimal_theme.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/features/home/presentation/minimal/sections/minimal_hero.dart';
import 'package:personal_website/features/home/presentation/minimal/sections/minimal_about.dart';
import 'package:personal_website/features/home/presentation/minimal/sections/minimal_skills.dart';
import 'package:personal_website/features/home/presentation/minimal/sections/minimal_contact.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../helpers/sample_profile.dart';

Widget _host(Widget child) => MaterialApp(
      theme: MinimalTheme.light,
      home: Scaffold(body: SingleChildScrollView(child: child)),
    );

bool _richTextContains(WidgetTester tester, String needle) {
  for (final w in tester.widgetList<RichText>(find.byType(RichText))) {
    final span = w.text;
    if (span is TextSpan && (span.toPlainText()).contains(needle)) return true;
  }
  return false;
}

void main() {
  setUp(() => VisibilityDetectorController.instance.updateInterval = Duration.zero);
  final p = sampleProfile();

  testWidgets('Hero shows subtitle and headline', (tester) async {
    await tester.pumpWidget(_host(MinimalHero(profile: p)));
    expect(find.textContaining('MOBILE TEAM LEAD'), findsWidgets);
    expect(find.textContaining('build things with Flutter'), findsOneWidget);
  });

  testWidgets('Hero fills the full viewport height', (tester) async {
    tester.view.physicalSize = const Size(1200, 1000);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(_host(MinimalHero(profile: p)));
    // The hero's own SizedBox should match the screen height (1000 logical px).
    final heroSize = tester.getSize(find.byType(MinimalHero));
    expect(heroSize.height, 1000);
  });

  testWidgets('About shows lede from aboutMe', (tester) async {
    await tester.pumpWidget(_host(MinimalAbout(profile: p)));
    expect(find.textContaining('highly skilled Flutter developer'), findsOneWidget);
  });

  testWidgets('Skills shows a recent technology and a service', (tester) async {
    await tester.pumpWidget(_host(MinimalSkills(profile: p)));
    expect(_richTextContains(tester, 'Flutter'), isTrue);
    expect(_richTextContains(tester, 'Mobile Apps'), isTrue);
  });

  testWidgets('Contact shows social link names', (tester) async {
    await tester.pumpWidget(_host(MinimalContact(profile: p)));
    expect(find.text('GitHub'), findsOneWidget);
    expect(find.text('LinkedIn'), findsOneWidget);
  });

  testWidgets('Contact renders a clickable "say hello" in the heading', (tester) async {
    await tester.pumpWidget(_host(MinimalContact(profile: p)));
    expect(_richTextContains(tester, 'say hello'), isTrue);
  });

  testWidgets('Contact renders a plain title verbatim when it has no "say hello"',
      (tester) async {
    final plain = DeveloperProfile(
      name: p.name,
      email: p.email,
      subtitle: p.subtitle,
      aboutMe: p.aboutMe,
      contactMe: TitleText(title: 'Reach me whenever you like.', text: 'Body.'),
      recentTechnologies: p.recentTechnologies,
      heroRole: p.heroRole,
      heroMeta: p.heroMeta,
      skills: p.skills,
      socialLinks: p.socialLinks,
      work: p.work,
      projects: p.projects,
      blogPosts: p.blogPosts,
    );
    await tester.pumpWidget(_host(MinimalContact(profile: plain)));
    expect(_richTextContains(tester, 'Reach me whenever you like.'), isTrue);
  });
}
