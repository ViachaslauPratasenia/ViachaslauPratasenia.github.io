import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_website/core/locator.dart';
import 'package:personal_website/features/home/domain/use_case/profile_cubit.dart';
import 'package:personal_website/features/home/presentation/home_page.dart';

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
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarBrightness: Brightness.light,
                statusBarIconBrightness: Brightness.light,
              ),
            ),
            dialogBackgroundColor: Colors.white,
            canvasColor: Colors.white,
            textTheme: TextTheme(
              headlineLarge: GoogleFonts.exo2(fontSize: 40, height: 1.3),
              headlineMedium: GoogleFonts.exo2(fontSize: 34, height: 1.4118),
              headlineSmall: GoogleFonts.exo2(fontSize: 24, height: 1.2308),
              bodyLarge: GoogleFonts.exo2(fontSize: 18, height: 1.6),
              bodyMedium: GoogleFonts.exo2(fontSize: 16, height: 1.1),
              bodySmall: GoogleFonts.exo2(fontSize: 14, height: 1.4),
            ),
            colorScheme: ColorScheme.dark(
              background: const Color(0xff10172A),
              primary: const Color(0xff457B9D),
              secondary: const Color(0xffA8DADC),
              tertiary: const Color(0xffF1FAEE),
              surface: const Color(0xffF1FAEE).withOpacity(0.65),
              error: const Color(0xffE63946),
            ),
          ),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
