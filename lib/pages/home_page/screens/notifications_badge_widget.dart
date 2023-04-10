import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:badges/badges.dart' as badges;
import '../../../controllers/notification_visibility/visibility_controller.dart';
import '../../../services/hivedb_notifications.dart';

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
