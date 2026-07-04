import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:personal_website/app.dart';
import 'package:personal_website/core/locator.dart';
import 'package:personal_website/firebase_options.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  await setupLocator();
  setPathUrlStrategy();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const App());
}
