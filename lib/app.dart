import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_website/core/locator.dart';
import 'package:personal_website/features/home/domain/use_case/profile_cubit.dart';
import 'package:personal_website/features/home/presentation/home_page.dart';
import 'package:personal_website/theme_controller.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final _router = GoRouter(
    navigatorKey: GlobalKey(),
    initialLocation: HomePage.routeName,
    routes: [
      GoRoute(
        path: HomePage.routeName,
        builder: (context, state) => const HomePage(),
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
        ],
        child: MaterialApp.router(
          title: 'Viachaslau Pratasenia',
          routerConfig: _router,
          theme: ThemeController.darkTheme,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
