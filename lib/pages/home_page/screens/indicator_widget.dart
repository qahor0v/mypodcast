import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IndicatorWidget extends StatelessWidget {
  PageController controller;

  IndicatorWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CollectionReference _newest_podcasts =
        FirebaseFirestore.instance.collection("newest_podcasts");
    return SliverToBoxAdapter(
        child: StreamBuilder(
      stream: _newest_podcasts.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        return Container(
          width: double.infinity,
          child: Center(
            child: SmoothPageIndicator(
              controller: controller,
              count:
                  streamSnapshot.hasData ? streamSnapshot.data!.docs.length : 3,
              effect: const SwapEffect(
                activeDotColor: Color(0xff2F2F2F),
                dotColor: Color(0xffBFA054),
                dotHeight: 10,
                dotWidth: 10,
                spacing: 10,
              ),
            ),
          ),
        );
      },
    ));
  }
}
