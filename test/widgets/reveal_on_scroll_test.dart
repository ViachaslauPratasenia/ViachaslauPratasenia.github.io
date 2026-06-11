import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/reveal_on_scroll.dart';
import 'package:visibility_detector/visibility_detector.dart';

void main() {
  setUp(() => VisibilityDetectorController.instance.updateInterval = Duration.zero);

  testWidgets('renders its child', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(body: RevealOnScroll(child: Text('hello'))),
    ));
    expect(find.text('hello'), findsOneWidget);
  });

  testWidgets('child is wrapped in an Opacity that animates to visible', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(body: RevealOnScroll(child: Text('hi'))),
    ));
    await tester.pump();
    await tester.pump(const Duration(seconds: 2));
    final animatedOpacity = tester.widget<AnimatedOpacity>(find.byType(AnimatedOpacity));
    expect(animatedOpacity.opacity, 1.0);
  });
}
