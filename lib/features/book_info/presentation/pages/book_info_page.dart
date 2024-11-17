import 'dart:ui';
import 'package:ebook_app/core/di_injection/service_locator.dart';
import 'package:ebook_app/core/routes/route_names.dart';
import 'package:ebook_app/features/book_info/domain/entities/vocabulary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:super_rich_text/super_rich_text.dart';
import '../bloc/book_info_bloc.dart';
import '../bloc/book_info_event.dart';
import '../bloc/book_info_state.dart';
import '../../../home/domain/entities/podcast.dart';
import '../../../../core/service/pdf_opener.dart';
import '../../../../core/database/hive_database.dart';
import '../../../pdf_viewer/presentation/pages/pdf_viewer_page.dart';

class BookInfoPage extends StatelessWidget {
  final Podcast podcast;

  const BookInfoPage({Key? key, required this.podcast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<BookInfoBloc>()
        ..add(FetchVocabularyEvent(podcast.vocabularyLink)),
      child: Scaffold(
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
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(IconlyBroken.bookmark, color: Color(0xff2F2F2F)),
              onPressed: () async {
                HiveDatabase.saveId(podcast.podcastId);
                Get.snackbar(
                  "Added to bookmarks".tr,
                  "You can listen to this podcast in the bookmark page".tr,
                  icon: const Icon(IconlyBroken.bookmark, color: Colors.black),
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
            ),
          ],
          title: Text(
            "Book Info".tr,
            style: const TextStyle(
              fontSize: 20,
              color: Color(0xff2F2F2F),
              fontFamily: "PlayfairDisplay-VariableFont",
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Book Cover Image
                Container(
                  width: Get.width,
                  height: Get.height * 0.28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(podcast.imageLink),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                // Book Title
                Text(
                  podcast.name,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Color(0xff2F2F2F),
                    fontFamily: "PlayfairDisplay-VariableFont",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "By Michael Crudden",
                      // Replace with author field if available
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(0xff2F2F2F),
                      ),
                    ),
                    Text(
                      podcast.duration,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color(0xff2F2F2F),
                        fontFamily: "PlayfairDisplay-VariableFont",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Vocabulary Section Header
                Center(
                  child: Text(
                    "Vocabulary".tr,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "PlayfairDisplay-VariableFont",
                      color: Color(0xffBFA054),
                    ),
                  ),
                ),

                // Vocabulary List Section
                Expanded(
                  child: BlocBuilder<BookInfoBloc, BookInfoState>(
                    builder: (context, state) {
                      if (state is BookInfoLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is BookInfoError) {
                        return Center(
                          child: Text(
                            state.message,
                            style: const TextStyle(color: Colors.red),
                            textAlign: TextAlign.center,
                          ),
                        );
                      } else if (state is BookInfoLoaded) {
                        return ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: state.vocabulary.length,
                          itemBuilder: (context, index) {
                            final Vocabulary vocab = state.vocabulary[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 8.0,
                              ),
                              child: SuperRichText(
                                useGlobalMarkers: false,
                                text: vocab.word,
                                maxLines: 2,
                                othersMarkers: [
                                  MarkerText(
                                    marker: "//",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffBFA054),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ),
              ],
            ).paddingOnly(right: 15, left: 15, top: 10, bottom: 10),
          ],
        ),
        floatingActionButton: _bookInfoNavBar(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  /// Navigation bar for "Start Reading" and "Play Audio" buttons
  Widget _bookInfoNavBar(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(5),
        topRight: Radius.circular(5),
      ),
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
                      PDFOpener.url = podcast.pdfLink;
                      Get.to(
                        PDFViewerPage(
                          file: await PDFOpener.openMe(),
                        ),
                      );
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
                          const SizedBox(width: 5),
                          Text(
                            "Start Reading".tr,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Get.to(
                      //   AudioWithPdfPage(
                      //     podcast: podcast,
                      //     name: podcast.name,
                      //     txtUrl: podcast.textLink,
                      //     audioLink: podcast.audioLink,
                      //   ),
                      // );
                      Navigator.pushNamed(context, RouteNames.podcastPlayer, arguments: podcast);
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
                          const SizedBox(width: 5),
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
