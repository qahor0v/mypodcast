import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:iconly/iconly.dart';

class BookmarkPage extends StatefulWidget {
  static const String id = "bookmark_page";

  const BookmarkPage({Key? key}) : super(key: key);

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFBF8F2),
      appBar: AppBar(
        // elevation: 0,
        backgroundColor: Color(0xffFBF8F2),
        actions: [
          IconButton(
            icon: const Icon(IconlyBroken.search, color: Color(0xff2F2F2F)),
            onPressed: () {
              print("Pressed");
            },
          ),
        ],
        title: const Text(
          "Bookmarks",
          style: TextStyle(
              fontSize: 20,
              color: Color(0xff2F2F2F),
              fontFamily: "PlayfairDisplay-VariableFont",
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return _markedBooksWidget();
          }),
    );
  }

  Widget _markedBooksWidget() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.5),
          //     spreadRadius: 2,
          //     blurRadius: 4,
          //     offset: Offset(0, 5), // changes position of shadow
          //   ),
          // ],
          borderRadius: BorderRadius.circular(8),
          color: Color(0xffF5EFE1),
          //color: Colors.black54,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: Get.height * 0.18,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 12,
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        //color: Colors.red,
                        image: DecorationImage(
                          image: AssetImage("assets/images/3.png"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Container(
                      //color: Colors.red,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "The Republic",
                            style: TextStyle(
                                color: Color(0xff2F2F2F),
                                fontSize: 19,
                                fontFamily: "PlayfairDisplay-VariableFont",
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "By Plato",
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            "2h 24 m",
                            style: TextStyle(
                                color: Color(0xff2F2F2F),
                                fontSize: 17,
                                fontFamily: "PlayfairDisplay-VariableFont",
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        //Get.to(BookInfoPage());
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 5, bottom: 5, left: 15, right: 15),
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Color(0xff2F2F2F),
                        ),
                        child: const Text(
                          "Listen",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
