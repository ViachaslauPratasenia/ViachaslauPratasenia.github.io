import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_website/app.dart';
import 'package:personal_website/core/locator.dart';
import 'package:personal_website/firebase_options.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  // Fonts are bundled in assets/google_fonts — never fetch at runtime, so the
  // first frame renders with the real fonts (no flash of fallback type).
  GoogleFonts.config.allowRuntimeFetching = false;
  await setupLocator();
  setPathUrlStrategy();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const App());
}
