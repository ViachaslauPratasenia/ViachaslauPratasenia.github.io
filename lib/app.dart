import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_website/core/locator.dart';
import 'package:personal_website/features/change_theme/domain/use_case/theme_cubit.dart';
import 'package:personal_website/features/home/domain/use_case/profile_cubit.dart';
import 'package:personal_website/features/home/presentation/minimal/minimal_home_page.dart';
import 'package:personal_website/theme/minimal/minimal_theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final _router = GoRouter(
    navigatorKey: GlobalKey(),
    initialLocation: MinimalHomePage.routeName,
    routes: [
      GoRoute(
        path: MinimalHomePage.routeName,
        builder: (context, state) => const MinimalHomePage(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider<ProfileCubit>(create: (context) => locator.get()),
          BlocProvider<ThemeCubit>(create: (context) => locator.get()),
        ],
        child: BlocBuilder<ThemeCubit, ThemeMode>(builder: (context, themeMode) {
          return MaterialApp.router(
            title: 'Viachaslau Pratasenia',
            routerConfig: _router,
            theme: MinimalTheme.light,
            darkTheme: MinimalTheme.dark,
            themeMode: themeMode,
            debugShowCheckedModeBanner: false,
          );
        }),
      ),
    );
  }
}
