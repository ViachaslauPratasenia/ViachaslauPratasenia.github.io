import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_website/theme/minimal/minimal_theme.dart';
import 'package:personal_website/features/home/presentation/minimal/nav/minimal_nav_bar.dart';

void main() {
  testWidgets('shows brand and triggers theme toggle', (tester) async {
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    var toggled = false;
    await tester.pumpWidget(MaterialApp(
      theme: MinimalTheme.light,
      home: Scaffold(
        body: MinimalNavBar(
          isDark: false,
          onToggleTheme: () => toggled = true,
          onItemTap: (_) {},
          activeIndex: ValueNotifier(-1),
          progress: ValueNotifier(0),
        ),
      ),
    ));
    expect(find.textContaining('Viachaslau', findRichText: true),
        findsOneWidget);

    await tester.tap(find.byKey(const Key('theme-toggle')));
    expect(toggled, isTrue);
  });

  testWidgets('tapping a nav item reports its index', (tester) async {
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    int? tapped;
    await tester.pumpWidget(MaterialApp(
      theme: MinimalTheme.light,
      home: Scaffold(
        body: MinimalNavBar(
          isDark: false,
          onToggleTheme: () {},
          onItemTap: (i) => tapped = i,
          activeIndex: ValueNotifier(-1),
          progress: ValueNotifier(0),
        ),
      ),
    ));
    await tester.tap(find.text('WORK'));
    expect(tapped, 1);
  });
}
