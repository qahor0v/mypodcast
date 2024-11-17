import 'package:ebook_app/features/all_books/presentation/widgets/politics_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../widgets/science_screen.dart';
import '../widgets/technology_screen.dart';

class BooksPage extends StatefulWidget {
  static const String id = "books_page";

  const BooksPage({Key? key}) : super(key: key);

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: const Color(0xffFBF8F2),
          actions: [
            IconButton(
              icon: const Icon(
                IconlyBroken.notification,
                color: Color(0xff2F2F2F),
              ),
              onPressed: () {
                Get.snackbar(
                  "Not available yet".tr,
                  "",
                  icon: const Icon(IconlyBroken.danger, color: Colors.black),
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
            ),
            IconButton(
              icon: const Icon(IconlyBroken.search, color: Color(0xff2F2F2F)),
              onPressed: () {
                Get.snackbar(
                  "Not available yet".tr,
                  "",
                  icon: const Icon(IconlyBroken.danger, color: Colors.black),
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
            ),
          ],
          title: Text(
            "All Podcasts".tr,
            style: const TextStyle(
                fontSize: 20,
                color: Color(0xff2F2F2F),
                fontFamily: "PlayfairDisplay-VariableFont",
                fontWeight: FontWeight.bold),
          ),
          //centerTitle: true,
          bottom: TabBar(
            labelStyle: const TextStyle(color: Colors.black, fontSize: 16),
            //For Selected tab
            //unselectedLabelStyle: TextStyle(color: Colors.grey),
            isScrollable: true,
            indicatorColor: Color(0xff2F2F2F),
            tabs: [
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 10),
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 5, bottom: 5),
                decoration: BoxDecoration(
                  border:
                      Border.all(width: 1.5, color: const Color(0xffBFA054)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Row(
                    children: [
                      // Icon(IconlyBroken.bookmark),
                      Text(
                        "Science".tr,
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 10),
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 5, bottom: 5),
                decoration: BoxDecoration(
                  border:
                      Border.all(width: 1.5, color: const Color(0xffBFA054)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Row(
                    children: [
                      // Icon(IconlyBroken.bookmark),
                      Text(
                        "Technology".tr,
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 10),
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 5, bottom: 5),
                decoration: BoxDecoration(
                  border:
                      Border.all(width: 1.5, color: const Color(0xffBFA054)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Row(
                    children: [
                      Text(
                        "Politics".tr,
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ScienceScreen(),
            TechnologyScreen(),
            PoliticsScreen(),
          ],
        ),
      ),
    );
  }
}
