import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/line_reveal_text.dart';

void main() {
  testWidgets('renders every wrapped line fully visible after the animation',
      (tester) async {
    const text = 'I build apps with Flutter, and I lead the team that ships them.';
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: SizedBox(
          width: 400,
          child: LineRevealText(
            text,
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
    ));
    await tester.pumpAndSettle();

    final texts = tester
        .widgetList<Text>(find.byType(Text))
        .map((t) => t.data ?? '')
        .toList();
    expect(texts.length, greaterThan(1),
        reason: 'expected the headline to wrap into multiple lines, got $texts');
    expect(texts.join(' '), text);

    // Every line must be fully revealed: opacity 1, no translation.
    for (final o in tester.widgetList<Opacity>(find.byType(Opacity))) {
      expect(o.opacity, 1.0);
    }
    for (final f in tester
        .widgetList<FractionalTranslation>(find.byType(FractionalTranslation))) {
      expect(f.translation, Offset.zero);
    }
  });
}
