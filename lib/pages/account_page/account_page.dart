import 'dart:core';
import 'package:ebook_app/pages/crud/add_podcast_page.dart';
import 'package:ebook_app/pages/crud/get_podcast_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconly/iconly.dart';
import '../../controllers/pdf_opener/pdf_opener.dart';

class AccountPage extends StatefulWidget {
  static const String id = "account_page";

  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFBF8F2),
      appBar: AppBar(
        //elevation: 0,
        backgroundColor: Color(0xffFBF8F2),
        actions: [
          IconButton(
            icon: const Icon(IconlyBroken.logout, color: Color(0xff2F2F2F)),
            onPressed: () {
              print("Pressed");
            },
          ),
        ],
        title: const Text(
          "Account",
          style: TextStyle(
              fontSize: 20,
              color: Color(0xff2F2F2F),
              fontFamily: "PlayfairDisplay-VariableFont",
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: Get.height * 0.08,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffF5EFE1),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: const Icon(
                          Icons.language,
                          size: 25,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () async {
                          Get.to(AddPodcastPage());
                        },
                        child: const Text(
                          "Language",
                          style:
                              TextStyle(color: Color(0xff2F2F2F), fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(GetPodcastPage());
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: Get.height * 0.08,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffF5EFE1),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: const Icon(
                            Icons.mode_night_outlined,
                            size: 25,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: const Text(
                            "Mode",
                            style: TextStyle(
                                color: Color(0xff2F2F2F), fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: Get.height * 0.08,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffF5EFE1),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: const Icon(
                          Icons.history,
                          size: 25,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: const Text(
                          "History",
                          style:
                              TextStyle(color: Color(0xff2F2F2F), fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
