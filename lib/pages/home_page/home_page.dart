import 'dart:ui';

import 'package:ebook_app/pages/home_page/screens/indicator_widget.dart';
import 'package:ebook_app/controllers/notification_visibility/visibility_controller.dart';
import 'package:ebook_app/pages/home_page/screens/name_of_parts_widget.dart';
import 'package:ebook_app/pages/home_page/screens/newest_books_builder_widget.dart';
import 'package:ebook_app/pages/home_page/screens/notifications_widget.dart';
import 'package:ebook_app/pages/home_page/screens/popular_books_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:badges/badges.dart' as badges;


class HomePage extends GetView {
  @override
  final controller = PageController();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VisibleController vc = Get.put(VisibleController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffF5EFE1),
        actions: [
          Obx(
            () => IconButton(
              icon: vc.isVisible.value
                  ? const Icon(
                      IconlyBroken.close_square,
                      color: Colors.red,
                    )
                  : const badges.Badge(
                      badgeContent: Text('3',style: TextStyle(color: Colors.white),),
                      showBadge: true,
                      child: Icon(
                        IconlyBroken.notification,
                        color: Color(0xff2F2F2F),
                      ),
                    ),
              onPressed: () {
                vc.changeVisibility();
              },
            ),
          ),
          IconButton(
            icon: const Icon(IconlyBroken.search, color: Color(0xff2F2F2F)),
            onPressed: () {
              // HiveDatabase.getAllId();
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
              //NewestBooksBuilderWidget2(controller: controller),
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
