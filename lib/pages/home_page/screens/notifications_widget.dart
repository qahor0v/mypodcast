import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook_app/controllers/notification_visibility/visibility_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/hivedb_notifications.dart';
import '../../book_info_page/book_info_page.dart';

class NotificationsWidget extends GetView {
  final CollectionReference _newest_podcasts =
      FirebaseFirestore.instance.collection("newest_podcasts");

  Iterable<String> ids = HiveDBNotifications.getAllId();

  NotificationsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VisibleController vv = Get.put(VisibleController());
    HiveDBNotifications.saveFirst();
    return Obx(
      () => Visibility(
        visible: vv.isVisible.value,
        maintainSize: true,
        maintainAnimation: true,
        maintainState: true,
        child: Padding(
          padding: const EdgeInsets.only(right: 15, left: 30),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaY: 10,
                sigmaX: 10,
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xffffffff).withOpacity(0.3),
                      const Color(0xffffffff).withOpacity(0.3),
                    ],
                  ),
                  border: Border.all(color: const Color(0xffBFA054), width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "New podcasts has been added for you!",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    StreamBuilder(
                      stream: _newest_podcasts
                          .where(FieldPath.documentId, whereNotIn: ids)
                          .snapshots(),
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                        if (streamSnapshot.hasData) {
                          for (int i = 0;
                              i < streamSnapshot.data!.docs.length;
                              i++) {
                            final DocumentSnapshot documentSnapshot =
                                streamSnapshot.data!.docs[i];
                            HiveDBNotifications.saveId(documentSnapshot.id);
                          }
                          return ListView.builder(
                            //physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: streamSnapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              final DocumentSnapshot documentSnapshot =
                                  streamSnapshot.data!.docs[index];
                              return _notificationsWidget(
                                "${documentSnapshot["name"]}",
                                "${documentSnapshot["duration"]}",
                                "${documentSnapshot["imageLink"]}",
                                "${documentSnapshot["pdfLink"]}",
                                "${documentSnapshot["audioLink"]}",
                                "${documentSnapshot["releaseDate"]}",
                                "${documentSnapshot["synopsis"]}",
                                "${documentSnapshot["details"]}",
                                documentSnapshot.id,
                              );
                            },
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xffBFA054),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _notificationsWidget(
      String name,
      String duration,
      String imageLink,
      String pdfLink,
      String audioLink,
      String releaseDate,
      String synopsis,
      String details,
      String podcastId) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Get.to(
          BookInfoPage(
            name: name,
            duration: duration,
            imageLink: imageLink,
            pdfLink: pdfLink,
            audioLink: audioLink,
            releaseDate: releaseDate,
            synopsis: synopsis,
            details: details,
            podcastId: podcastId,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
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
                      Text(
                        duration,
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
                      const Text(
                        "Andrew Dalby",
                      ),
                    ],
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
