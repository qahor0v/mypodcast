import 'package:ebook_app/pages/lottie_page/lottie_page.dart';
import 'package:ebook_app/pages/nav_bar_widget/nav_bar_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  await Hive.openBox<String>("podcast_id");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocalStrings(),
      locale: const Locale("en","US"),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      title: 'Podcast App Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LottiePage(),
      routes: {
        NavBarWidget.id: (context) => const NavBarWidget(),
      },
    );
  }
}
