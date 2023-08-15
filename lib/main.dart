import 'package:flutter/material.dart';
import 'package:personal_website/app.dart';
import 'package:personal_website/core/locator.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  await setupLocator();
  setPathUrlStrategy();
  runApp(const App());
}
