import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:badges/badges.dart' as badges;

import '../../../controllers/notification_visibility/visibility_controller.dart';

class NotificationsBadgeWidget extends StatelessWidget {
  NotificationsBadgeWidget({Key? key}) : super(key: key);
  final CollectionReference _newest_podcasts =
      FirebaseFirestore.instance.collection("newest_podcasts");

  @override
  Widget build(BuildContext context) {
    VisibleController vc = Get.put(VisibleController());

    return StreamBuilder(
      stream: _newest_podcasts.snapshots(),
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
                      showBadge: true,
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
