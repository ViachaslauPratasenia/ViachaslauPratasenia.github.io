import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_website/features/home/home_page.dart';
import 'package:personal_website/theme/theme.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final GlobalKey<NavigatorState> _mainPageNavigatorKey = GlobalKey();

  late final _router = GoRouter(
    navigatorKey: GlobalKey(),
    initialLocation: HomePage.routeName,
    routes: [
      GoRoute(
        path: HomePage.routeName,
        builder: (context, state) => HomePage(),
      ),
      // GoRoute(
      //   path: CheckoutPage.routeName,
      //   builder: (context, state) => CheckoutPage.fromPath(state.location),
      // ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp.router(
        title: 'Viachaslau Pratasenia',
        routerConfig: _router,
        theme: AppTheme.defaultThemeData,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
