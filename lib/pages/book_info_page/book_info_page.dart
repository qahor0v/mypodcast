import 'dart:ui';
import 'package:ebook_app/constanta.dart';
import 'package:ebook_app/pages/book_info_page/screens/details_screen.dart';
import 'package:ebook_app/pages/book_info_page/screens/synopsis_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../../controllers/pdf_opener/pdf_opener.dart';
import '../../services/hive_database.dart';
import '../audio_with_pdf_page/audio_with_pdf_viewer_page.dart';
import '../pdf_viewer_page/pdf_viewer_page.dart';

class BookInfoPage extends StatelessWidget {
  var complated = true.obs;
  String? name;
  String? duration;
  String? imageLink;
  String? pdfLink;
  String? audioLink;
  String? releaseDate;
  String? synopsis;
  String? details;
  String? podcastId;
  String? text;

  BookInfoPage({
    Key? key,
    required this.name,
    required this.duration,
    required this.imageLink,
    required this.pdfLink,
    required this.audioLink,
    required this.releaseDate,
    required this.synopsis,
    required this.details,
    required this.podcastId,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List listWord = TextString().words.split(";");

    return Scaffold(
      backgroundColor: const Color(0xffFBF8F2),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffFBF8F2),
        leading: IconButton(
          icon: const Icon(
            IconlyBroken.arrow_left,
            color: Color(0xff2F2F2F),
          ),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(IconlyBroken.bookmark, color: Color(0xff2F2F2F)),
            onPressed: () async {
              HiveDatabase.saveId(podcastId!);
              print("SAVED: ${await HiveDatabase.getId(podcastId!)}");
              Get.snackbar(
                "Added to bookmarks".tr,
                "You can listen this podcast in bookmark page".tr,
                icon: const Icon(IconlyBroken.bookmark, color: Colors.black),
                snackPosition: SnackPosition.BOTTOM,
              );
            },
          ),
        ],
        title: Text(
          "Podcast Info".tr,
          style: const TextStyle(
              fontSize: 20,
              color: Color(0xff2F2F2F),
              fontFamily: "PlayfairDisplay-VariableFont",
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: Get.width,
                height: Get.height * 0.28,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(imageLink!),
                      fit: BoxFit.cover,
                    )),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                name!,
                style: const TextStyle(
                    fontSize: 22,
                    color: Color(0xff2F2F2F),
                    fontFamily: "PlayfairDisplay-VariableFont",
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "By Michael Crudden",
                    style: TextStyle(
                      fontSize: 17,
                      color: Color(0xff2F2F2F),
                    ),
                  ),
                  Text(
                    duration!,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Color(0xff2F2F2F),
                        fontFamily: "PlayfairDisplay-VariableFont",
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: 70,
                    width: Get.width * 0.27,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 1.5, color: const Color(0xffBFA054)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Released",
                          style: TextStyle(color: Colors.black54, fontSize: 16),
                        ),
                        Text(
                          releaseDate!,
                          style: const TextStyle(
                              color: Color(0xff2F2F2F),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: 70,
                    width: Get.width * 0.27,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 1.5, color: const Color(0xffBFA054)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          "Part",
                          style: TextStyle(color: Colors.black54, fontSize: 16),
                        ),
                        Text(
                          "16",
                          style: TextStyle(
                              color: Color(0xff2F2F2F),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: 70,
                    width: Get.width * 0.27,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 1.5, color: const Color(0xffBFA054)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          "Pages",
                          style: TextStyle(color: Colors.black54, fontSize: 16),
                        ),
                        Text(
                          "340",
                          style: TextStyle(
                              color: Color(0xff2F2F2F),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: listWord.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      width: Get.width * 0.27,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 1.5, color: const Color(0xffBFA054)),
                      ),
                      child:  Text(
                        "${listWord[index]}",
                        maxLines: 2,
                      ).paddingOnly(

                        left: 10,
                      ),
                    ).paddingOnly(bottom: 10);
                  },
                ).paddingOnly(bottom: 50),
              )
            ],
          ).paddingOnly(right: 15, left: 15, top: 10, bottom: 10),
          Obx(
            () => Container(
              child: complated.value
                  ? const SizedBox.shrink()
                  : const Center(
                      child: CircularProgressIndicator(
                      color: Color(0xffBFA054),
                    )),
            ),
          ),
        ],
      ),
      floatingActionButton: _bookInfoNavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // Widget _bookInfos() {
  //   return DefaultTabController(
  //     length: 2,
  //     initialIndex: 0,
  //     child: SliverToBoxAdapter(
  //       child: Padding(
  //         padding:
  //             const EdgeInsets.only(right: 15, left: 15, top: 10, bottom: 10),
  //         child: ClipRRect(
  //           //borderRadius: BorderRadius.circular(15),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Container(
  //                 width: Get.width,
  //                 height: Get.height * 0.28,
  //                 decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(10),
  //                     image: DecorationImage(
  //                       image: NetworkImage(imageLink!),
  //                       fit: BoxFit.cover,
  //                     )),
  //               ),
  //               const SizedBox(
  //                 height: 25,
  //               ),
  //               Text(
  //                 name!,
  //                 style: const TextStyle(
  //                     fontSize: 22,
  //                     color: Color(0xff2F2F2F),
  //                     fontFamily: "PlayfairDisplay-VariableFont",
  //                     fontWeight: FontWeight.bold),
  //               ),
  //               const SizedBox(
  //                 height: 5,
  //               ),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   const Text(
  //                     "By Michael Crudden",
  //                     style: TextStyle(
  //                       fontSize: 17,
  //                       color: Color(0xff2F2F2F),
  //                     ),
  //                   ),
  //                   Text(
  //                     duration!,
  //                     style: const TextStyle(
  //                         fontSize: 18,
  //                         color: Color(0xff2F2F2F),
  //                         fontFamily: "PlayfairDisplay-VariableFont",
  //                         fontWeight: FontWeight.bold),
  //                   ),
  //                 ],
  //               ),
  //               const SizedBox(
  //                 height: 30,
  //               ),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Container(
  //                     padding: const EdgeInsets.all(8),
  //                     height: 70,
  //                     width: Get.width * 0.27,
  //                     decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(10),
  //                       border: Border.all(
  //                           width: 1.5, color: const Color(0xffBFA054)),
  //                     ),
  //                     child: Column(
  //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                       children: [
  //                         const Text(
  //                           "Released",
  //                           style:
  //                               TextStyle(color: Colors.black54, fontSize: 16),
  //                         ),
  //                         Text(
  //                           releaseDate!,
  //                           style: const TextStyle(
  //                               color: Color(0xff2F2F2F),
  //                               fontSize: 18,
  //                               fontWeight: FontWeight.bold),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   Container(
  //                     padding: const EdgeInsets.all(8),
  //                     height: 70,
  //                     width: Get.width * 0.27,
  //                     decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(10),
  //                       border: Border.all(
  //                           width: 1.5, color: const Color(0xffBFA054)),
  //                     ),
  //                     child: Column(
  //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                       children: const [
  //                         Text(
  //                           "Part",
  //                           style:
  //                               TextStyle(color: Colors.black54, fontSize: 16),
  //                         ),
  //                         Text(
  //                           "16",
  //                           style: TextStyle(
  //                               color: Color(0xff2F2F2F),
  //                               fontSize: 18,
  //                               fontWeight: FontWeight.bold),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   Container(
  //                     padding: const EdgeInsets.all(8),
  //                     height: 70,
  //                     width: Get.width * 0.27,
  //                     decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(10),
  //                       border: Border.all(
  //                           width: 1.5, color: const Color(0xffBFA054)),
  //                     ),
  //                     child: Column(
  //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                       children: const [
  //                         Text(
  //                           "Pages",
  //                           style:
  //                               TextStyle(color: Colors.black54, fontSize: 16),
  //                         ),
  //                         Text(
  //                           "340",
  //                           style: TextStyle(
  //                               color: Color(0xff2F2F2F),
  //                               fontSize: 18,
  //                               fontWeight: FontWeight.bold),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               const SizedBox(
  //                 height: 30,
  //               ),
  //               SizedBox(
  //                 height: 650,
  //                 child: TabBarView(
  //                   children: [
  //                     SynopsisScreen(synopsisText: synopsis),
  //                     DetailsScreen(detailsText: details),
  //                   ],
  //                 ),
  //               ),
  //               const SizedBox(
  //                 height: 60,
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  /// nav bar for this page => for "Start  Reading" and "Play Audio" buttons
  Widget _bookInfoNavBar() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(5), topRight: Radius.circular(5)),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaY: 10,
          sigmaX: 10,
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15, bottom: 10),
          child: Container(
            height: Get.height * 0.07,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xffffffff).withOpacity(0.3),
                  const Color(0xffffffff).withOpacity(0.3),
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      complated.value = false;
                      PDFOpener.url = pdfLink;
                      Get.to(
                        PDFViewerPage(
                          file: await PDFOpener.openMe(),
                        ),
                      );
                      complated.value = true;
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffBFA054),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.book),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Start Reading".tr,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      Get.to(
                        AudioWithPdfPage(
                          title: name ?? "",
                          txtUrl:
                              'https://firebasestorage.googleapis.com/v0/b/fluttuzlogin.appspot.com/o/test_files%2Fleonardo.txt?alt=media&token=7a9e9efe-7ae7-429f-8649-818c91e76a32',
                          audioLink: await audioLink.toString(),
                        ),
                      );
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xff2F2F2F),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            IconlyBroken.play,
                            color: Color(0xffFBF8F2),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Play Audio".tr,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xffFBF8F2),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
