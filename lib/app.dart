import 'package:ebook_app/core/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ebook_app/core/localization/localization_strings.dart';
import 'core/routes/route_names.dart';


class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocalStrings(),
      locale: const Locale("en", "US"),
      debugShowCheckedModeBanner: false,
      title: 'Listen Me',
      initialRoute: RouteNames.splash,
      onGenerateRoute: AppRoute(context: context).onGenerateRoute,
    );
  }
}
