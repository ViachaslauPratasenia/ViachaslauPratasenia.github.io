import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_website/theme/minimal/minimal_theme.dart';
import 'package:personal_website/features/home/presentation/minimal/sections/minimal_experience.dart';
import 'package:personal_website/features/home/presentation/minimal/sections/minimal_projects.dart';
import 'package:personal_website/features/home/presentation/minimal/sections/minimal_writing.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../helpers/sample_profile.dart';

Widget _host(Widget child) => MaterialApp(
      theme: MinimalTheme.light,
      home: Scaffold(body: SingleChildScrollView(child: child)),
    );

void main() {
  setUp(() => VisibilityDetectorController.instance.updateInterval = Duration.zero);
  final p = sampleProfile();

  testWidgets('Experience shows job title, company and period', (tester) async {
    await tester.pumpWidget(_host(MinimalExperience(profile: p)));
    expect(find.textContaining('Mobile Team Lead'), findsWidgets);
    // MonoLabel uppercases the company name (mono label design).
    expect(find.textContaining('AVENTUS IT'), findsOneWidget);
    expect(find.textContaining('2022'), findsOneWidget);
  });

  testWidgets('Projects shows project title and tags', (tester) async {
    await tester.pumpWidget(_host(MinimalProjects(profile: p)));
    expect(find.text('Personal Website'), findsOneWidget);
    // "GitHub Pages" appears in both the description and the tags; assert on
    // the joined tags string which is unique to the tag row.
    expect(find.text('Flutter · Web · GitHub Pages'), findsOneWidget);
  });

  testWidgets('Writing shows post title and date', (tester) async {
    await tester.pumpWidget(_host(MinimalWriting(profile: p)));
    expect(find.textContaining('Environments in Flutter'), findsOneWidget);
    expect(find.text('Dec 12, 2023'), findsOneWidget);
  });
}
