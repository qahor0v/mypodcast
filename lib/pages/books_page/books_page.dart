import 'package:ebook_app/pages/books_page/screens/politics_screen.dart';
import 'package:ebook_app/pages/books_page/screens/science_screen.dart';
import 'package:ebook_app/pages/books_page/screens/technology_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

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
          elevation: 0,
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
            "Explore Market",
            style: TextStyle(
                fontSize: 20,
                color: Color(0xff2F2F2F),
                fontFamily: "PlayfairDisplay-VariableFont",
                fontWeight: FontWeight.bold),
          ),
          //centerTitle: true,
          bottom: TabBar(
            labelStyle: TextStyle(color: Colors.black, fontSize: 16),
            //For Selected tab
            //unselectedLabelStyle: TextStyle(color: Colors.grey),
            isScrollable: true,
            indicatorColor: Color(0xff2F2F2F),
            tabs: [
              Container(
                margin: EdgeInsets.only(top: 5, bottom: 10),
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: Color(0xffBFA054)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Row(
                    children: const [
                      // Icon(IconlyBroken.bookmark),
                      Text(
                        "Science",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, bottom: 10),
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: Color(0xffBFA054)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Row(
                    children: const [
                      // Icon(IconlyBroken.bookmark),
                      Text(
                        "Technology",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, bottom: 10),
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: Color(0xffBFA054)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Row(
                    children: const [
                      // Icon(IconlyBroken.bookmark),
                      Text(
                        "Politics",
                        style: TextStyle(color: Colors.black54),
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
