import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook_app/services/hive_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../book_info_page/book_info_page.dart';

class BookmarkPage extends StatelessWidget {
  BookmarkPage({Key? key}) : super(key: key);
  final CollectionReference _newest_podcasts =
      FirebaseFirestore.instance.collection("newest_podcasts");

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
      body: StreamBuilder(
        stream: _newest_podcasts.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                if (HiveDatabase.getId(documentSnapshot.id) ==
                    documentSnapshot.id) {
                  return _markedBooks(
                    "${documentSnapshot["name"]}",
                    "${documentSnapshot["duration"]}",
                    "${documentSnapshot["imageLink"]}",
                    "${documentSnapshot["releaseDate"]}",
                    "${documentSnapshot["synopsis"]}",
                    "${documentSnapshot["details"]}",
                  );
                }
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _markedBooks(String name, String duration, String imageLink,
      String releaseDate, String synopsis, String details) {
    return GestureDetector(
      onTap: () {
        Get.to(
          BookInfoPage(
            name: name,
            duration: duration,
            imageLink: imageLink,
            releaseDate: releaseDate,
            synopsis: synopsis,
            details: details,
          ),
        );
      },
      child: Padding(
        padding:
            const EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
        child: ClipRRect(
          child: Container(
            child: Row(
              children: [
                Container(
                  height: 65,
                  width: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(imageLink), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xff2F2F2F),
                        fontWeight: FontWeight.bold,
                        fontFamily: "PlayfairDisplay-VariableFont",
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const Text("Derek Collins"),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: const [
                        Icon(
                          IconlyBroken.star,
                          size: 17,
                        ),
                        Icon(
                          IconlyBroken.star,
                          size: 17,
                        ),
                        Icon(
                          IconlyBroken.star,
                          size: 17,
                        ),
                        Icon(
                          IconlyBroken.star,
                          size: 17,
                        ),
                        Icon(
                          IconlyBroken.star,
                          size: 17,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
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