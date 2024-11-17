import 'package:flutter/material.dart';
import 'app.dart';
import 'core/di_injection/service_locator.dart';
import 'core/startup/initialize.dart';

void main() async {
  setupLocator();
  await initializeIt();
  runApp(
    MyApp(),
  );
}
