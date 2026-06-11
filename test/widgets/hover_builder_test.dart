import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/hover_builder.dart';

void main() {
  testWidgets('exposes hovering=false initially, true on hover', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: HoverBuilder(
          builder: (context, hovering) => Text(hovering ? 'IN' : 'OUT'),
        ),
      ),
    ));
    expect(find.text('OUT'), findsOneWidget);

    final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
    await gesture.addPointer(location: Offset.zero);
    addTearDown(gesture.removePointer);
    await gesture.moveTo(tester.getCenter(find.byType(HoverBuilder)));
    await tester.pump();
    expect(find.text('IN'), findsOneWidget);
  });
}
