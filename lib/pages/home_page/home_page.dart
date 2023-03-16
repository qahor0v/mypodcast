import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook_app/pages/home_page/screens/indicator_widget.dart';
import 'package:ebook_app/pages/home_page/screens/name_of_parts_widget.dart';
import 'package:ebook_app/pages/home_page/screens/newest_books_builder_widget.dart';
import 'package:ebook_app/pages/home_page/screens/popular_books_widget.dart';
import 'package:ebook_app/services/hive_database.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class HomePage extends StatelessWidget {
  final controller = PageController();
  final CollectionReference _newest_podcasts =
      FirebaseFirestore.instance.collection("newest_podcasts");

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffF5EFE1),
        actions: [
          IconButton(
            icon: const Icon(
              IconlyBroken.notification,
              color: Color(0xff2F2F2F),
            ),
            onPressed: () async {},
          ),
          IconButton(
            icon: const Icon(IconlyBroken.search, color: Color(0xff2F2F2F)),
            onPressed: () {
             // HiveDatabase.getAllId();
            },
          ),
        ],
        title: const Text(
          "Booksbury",
          style: TextStyle(
              fontSize: 20,
              color: Color(0xff2F2F2F),
              fontFamily: "PlayfairDisplay-VariableFont",
              fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: const Color(0xffF5EFE1),
      body: CustomScrollView(
        slivers: [
          // top books widget
          NewestBooksBuilderWidget(controller: controller),
          IndicatorWidget(controller: controller),
          NameOfPartsWidget(name: "Popular Books"),
          PopularBooksWidget(),
        ],
      ),
    );
  }
}
