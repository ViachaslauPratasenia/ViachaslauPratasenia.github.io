import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_website/theme/minimal/minimal_theme.dart';
import 'package:personal_website/features/change_theme/domain/use_case/theme_cubit.dart';
import 'package:personal_website/features/home/domain/use_case/profile_cubit.dart';
import 'package:personal_website/features/home/domain/use_case/profile_state.dart';
import 'package:personal_website/features/home/presentation/minimal/minimal_home_page.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/minimal_loader.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'helpers/sample_profile.dart';

class _FakeProfileCubit extends Cubit<ProfileState> implements ProfileCubit {
  _FakeProfileCubit(super.state);

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  setUp(() => VisibilityDetectorController.instance.updateInterval = Duration.zero);

  Widget host(ProfileState state, ThemeCubit themeCubit) => MaterialApp(
        theme: MinimalTheme.light,
        darkTheme: MinimalTheme.dark,
        home: MultiBlocProvider(
          providers: [
            BlocProvider<ProfileCubit>.value(value: _FakeProfileCubit(state)),
            BlocProvider<ThemeCubit>.value(value: themeCubit),
          ],
          child: const MinimalHomePage(),
        ),
      );

  // ProfileState has a PRIVATE constructor — build states via initial()/copyWith().
  final loadingState = ProfileState.initial(); // isLoading: true
  ProfileState loadedState() =>
      ProfileState.initial().copyWith(isLoading: false, developerProfile: sampleProfile());

  testWidgets('shows loading indicator while loading', (tester) async {
    await tester.pumpWidget(host(loadingState, ThemeCubit()));
    expect(find.byType(MinimalLoader), findsOneWidget);
  });

  testWidgets('shows error fallback when profile is null and not loading', (tester) async {
    final nullState = ProfileState.initial().copyWith(isLoading: false);
    await tester.pumpWidget(host(nullState, ThemeCubit()));
    expect(find.text('Something went wrong.'), findsOneWidget);
  });

  testWidgets('renders sections when profile loaded', (tester) async {
    tester.view.physicalSize = const Size(1200, 2400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(host(loadedState(), ThemeCubit()));
    await tester.pump();
    // The hero headline is rendered one Text per wrapped line, so cross-line
    // phrases are checked against all visible text joined together.
    final allText = tester
        .widgetList<RichText>(find.byType(RichText))
        .map((w) => w.text.toPlainText())
        .join(' ');
    expect(allText, contains('build things with Flutter'));
    expect(find.text('ABOUT'), findsWidgets);
  });

  testWidgets('theme toggle flips ThemeCubit mode', (tester) async {
    tester.view.physicalSize = const Size(1200, 2400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    final themeCubit = ThemeCubit();
    themeCubit.changeTheme(ThemeMode.light);
    await tester.pumpWidget(host(loadedState(), themeCubit));
    await tester.pump();
    await tester.tap(find.byKey(const Key('theme-toggle')));
    await tester.pump();
    expect(themeCubit.state, ThemeMode.dark);
  });
}
