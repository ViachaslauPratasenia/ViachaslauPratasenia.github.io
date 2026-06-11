import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_website/theme/minimal/minimal_theme.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/mono_label.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/minimal_section.dart';
import 'package:visibility_detector/visibility_detector.dart';

void main() {
  setUp(() => VisibilityDetectorController.instance.updateInterval = Duration.zero);

  testWidgets('MonoLabel uppercases its text', (tester) async {
    await tester.pumpWidget(MaterialApp(
      theme: MinimalTheme.light,
      home: const Scaffold(body: MonoLabel('about')),
    ));
    expect(find.text('ABOUT'), findsOneWidget);
  });

  testWidgets('MinimalSection shows its label and child', (tester) async {
    await tester.pumpWidget(MaterialApp(
      theme: MinimalTheme.light,
      home: const Scaffold(
        body: SingleChildScrollView(
          child: MinimalSection(label: 'Work', child: Text('content')),
        ),
      ),
    ));
    expect(find.text('WORK'), findsOneWidget);
    expect(find.text('content'), findsOneWidget);
  });
}
