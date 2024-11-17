import 'dart:ui';

import 'package:ebook_app/core/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:iconly/iconly.dart';
import '../../../book_info/data/repositories/book_info_repository_impl.dart';
import '../../../book_info/domain/use_cases/fetch_vocabulary.dart';
import '../../../book_info/presentation/bloc/book_info_bloc.dart';
import '../../../book_info/presentation/bloc/book_info_event.dart';
import '../../../book_info/presentation/pages/book_info_page.dart';
import '../../domain/entities/podcast.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';

class NewestBooksBuilderWidget extends StatelessWidget {
  final PageController controller;

  const NewestBooksBuilderWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xffF5EFE1),
      expandedHeight: 300,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.all(15.0),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is HomeLoaded &&
                  state.newestPodcasts.isNotEmpty) {
                return PageView.builder(
                  itemCount: state.newestPodcasts.length,
                  controller: controller,
                  itemBuilder: (context, index) {
                    final podcast = state.newestPodcasts[index];
                    return _newestBooksItem(context, podcast);
                  },
                );
              } else if (state is HomeError) {
                return Center(child: Text(state.message));
              }
              return const SizedBox(); // Display nothing if no data
            },
          ),
        ),
      ),
    );
  }

  Widget _newestBooksItem(BuildContext context, Podcast podcast) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteNames.bookInfo, arguments: podcast);
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black54,
              image: DecorationImage(
                image: NetworkImage(podcast.imageLink),
                fit: BoxFit.cover,
              ),
            ),
          ),
          _overlayContent(podcast),
        ],
      ),
    );
  }

  Widget _overlayContent(Podcast podcast) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        //color: Colors.black54,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                padding: EdgeInsets.only(right: 8, left: 8),
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            podcast.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Color(0xffFBF8F2),
                                fontSize: 15,
                                fontFamily: "PlayfairDisplay-VariableFont",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    IconlyBold.play,
                                    color: Color(0xffFBF8F2),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    podcast.duration,
                                    style: const TextStyle(
                                      color: Color(0xffFBF8F2),
                                    ),
                                  ),
                                ],
                              ),
                              const Row(
                                children: [
                                  Icon(
                                    IconlyBroken.arrow_right_circle,
                                    color: Color(0xffFBF8F2),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Andrew Dalby",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Color(0xffFBF8F2),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
