import 'dart:ui';
import 'package:ebook_app/pages/home_page/screens/indicator_widget.dart';
import 'package:ebook_app/pages/home_page/screens/name_of_parts_widget.dart';
import 'package:ebook_app/pages/home_page/screens/newest_books_builder_widget.dart';
import 'package:ebook_app/pages/home_page/screens/notifications_badge_widget.dart';
import 'package:ebook_app/pages/home_page/screens/notifications_widget.dart';
import 'package:ebook_app/pages/home_page/screens/popular_books_widget.dart';
import 'package:ebook_app/services/hivedb_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class HomePage extends GetView {

  @override
  final controller = PageController();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffF5EFE1),
        actions: [
          NotificationsBadgeWidget(),
          IconButton(
            icon: const Icon(IconlyBroken.search, color: Color(0xff2F2F2F)),
            onPressed: () {
              print(HiveDBNotifications.getAllId());
            },
          ),
        ],
        title: const Text(
          "Leonardo English",
          style: TextStyle(
              fontSize: 20,
              color: Color(0xff2F2F2F),
              fontFamily: "PlayfairDisplay-VariableFont",
              fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: const Color(0xffF5EFE1),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              NewestBooksBuilderWidget(controller: controller),
              IndicatorWidget(controller: controller),
              NameOfPartsWidget(name: "Popular Books"),
              PopularBooksWidget(),
            ],
          ),
          NotificationsWidget(),
        ],
      ),
    );
  }
}
