import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_website/theme/minimal/minimal_theme.dart';
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

void main() {
  setUp(() => VisibilityDetectorController.instance.updateInterval = Duration.zero);
  final p = sampleProfile();

  testWidgets('Hero shows subtitle and headline', (tester) async {
    await tester.pumpWidget(_host(MinimalHero(profile: p)));
    expect(find.textContaining('Mobile Team Lead'), findsWidgets);
    expect(find.textContaining('build things with Flutter'), findsOneWidget);
  });

  testWidgets('About shows lede from aboutMe', (tester) async {
    await tester.pumpWidget(_host(MinimalAbout(profile: p)));
    expect(find.textContaining('highly skilled Flutter developer'), findsOneWidget);
  });

  testWidgets('Skills shows a recent technology and a service', (tester) async {
    await tester.pumpWidget(_host(MinimalSkills(profile: p)));
    expect(find.textContaining('Flutter'), findsWidgets);
    expect(find.textContaining('Mobile Apps'), findsWidgets);
  });

  testWidgets('Contact shows social link names', (tester) async {
    await tester.pumpWidget(_host(MinimalContact(profile: p)));
    expect(find.text('GitHub'), findsOneWidget);
    expect(find.text('LinkedIn'), findsOneWidget);
  });
}
