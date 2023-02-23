import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class IndicatorWidget extends StatelessWidget {
  PageController controller;
  IndicatorWidget({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        child: Center(
          child: SmoothPageIndicator(
            controller: controller,
            count: 3,
            effect: const SwapEffect(
              activeDotColor: Color(0xff2F2F2F),
              dotColor: Color(0xffBFA054),
              dotHeight: 10,
              dotWidth: 10,
              spacing: 10,
            ),
          ),
        ),
      ),
    );
  }
}
