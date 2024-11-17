import 'package:ebook_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../bloc/home_state.dart';

class IndicatorWidget extends StatelessWidget {
  final PageController controller;

  IndicatorWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          int pageCount = 0; // Default value if no data is loaded

          if (state is HomeLoaded && state.newestPodcasts.isNotEmpty) {
            pageCount = state.newestPodcasts.length;
          }

          // Only show SmoothPageIndicator if pageCount > 0
          return pageCount > 0
              ? Container(
            width: double.infinity,
            child: Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: pageCount,
                effect: const SwapEffect(
                  activeDotColor: Color(0xff2F2F2F),
                  dotColor: Color(0xffBFA054),
                  dotHeight: 10,
                  dotWidth: 10,
                  spacing: 10,
                ),
              ),
            ),
          )
              : const SizedBox(); // Empty widget if no pages are available
        },
      ),
    );
  }
}
