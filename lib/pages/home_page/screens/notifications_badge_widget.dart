import 'package:cloud_firestore/cloud_firestore.dart';
<<<<<<< HEAD
import 'package:ebook_app/services/hivedb_notifications.dart';
=======
>>>>>>> github1/master
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:badges/badges.dart' as badges;
import '../../../controllers/notification_visibility/visibility_controller.dart';
import '../../../services/hivedb_notifications.dart';

<<<<<<< HEAD
class NotificationsBadgeWidget extends StatefulWidget {
  static const String id = "safgadf";

  NotificationsBadgeWidget({Key? key}) : super(key: key);

  @override
  State<NotificationsBadgeWidget> createState() => _NotificationsBadgeWidgetState();
}

class _NotificationsBadgeWidgetState extends State<NotificationsBadgeWidget> {
  /// variables
  final CollectionReference newest_podcasts =
      FirebaseFirestore.instance.collection("newest_podcasts");
  var me = HiveDBNotifications.saveFirst();
=======
class NotificationsBadge2 extends StatefulWidget {
  static const String id = "safgadf";

  NotificationsBadge2({Key? key}) : super(key: key);

  @override
  State<NotificationsBadge2> createState() => _NotificationsBadge2State();
}

class _NotificationsBadge2State extends State<NotificationsBadge2> {
  /// variables
  final CollectionReference newest_podcasts =
      FirebaseFirestore.instance.collection("newest_podcasts");
  var me = HiveDBNotifications.saveOne();
>>>>>>> github1/master
  Iterable<String> ids = HiveDBNotifications.getAllId();

  VisibleController vc = Get.put(VisibleController());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: newest_podcasts
          .where(FieldPath.documentId, whereNotIn: ids)
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        if (streamSnapshot.hasData) {
<<<<<<< HEAD

          for (int i = 0; i < streamSnapshot.data!.docs.length; i++) {
            final DocumentSnapshot documentSnapshot =
                streamSnapshot.data!.docs[i];
            HiveDBNotifications.saveId(documentSnapshot.id);
          }

=======
>>>>>>> github1/master
          return Obx(
            () => IconButton(
              icon: vc.isVisible.value
                  ? const Icon(
                      IconlyBroken.close_square,
                      color: Colors.red,
                    )
                  : badges.Badge(
                      badgeContent: Text(
                        streamSnapshot.data!.docs.length.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                      showBadge: streamSnapshot.data!.docs.length.isEqual(0)
                          ? false
                          : true,
                      child: const Icon(
                        IconlyBroken.notification,
                        color: Color(0xff2F2F2F),
                      ),
                    ),
              onPressed: () {
                vc.changeVisibility();
<<<<<<< HEAD
                for (int i = 0; i < streamSnapshot.data!.docs.length; i++) {
                  HiveDBNotifications.saveId(streamSnapshot.data!.docs[i].id);
                }
=======
>>>>>>> github1/master
              },
            ),
          );
        }
        return const Center(
          child: SizedBox.shrink(),
        );
      },
    );
  }
}
