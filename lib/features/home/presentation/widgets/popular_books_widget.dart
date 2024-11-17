import 'package:ebook_app/core/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ebook_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:ebook_app/features/home/presentation/bloc/home_state.dart';

class PopularBooksWidget extends StatelessWidget {
  PopularBooksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeLoaded && state.topPodcasts.isNotEmpty) {
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.topPodcasts.length,
              itemBuilder: (context, index) {
                final podcast = state.topPodcasts[index];
                return _popularBooksItem(context, podcast);
              },
            );
          } else if (state is HomeError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox(); // If no data, show nothing
        },
      ),
    );
  }

  Widget _popularBooksItem(BuildContext context, podcast) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteNames.bookInfo, arguments: podcast);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Container(
              height: 65,
              width: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(podcast.imageLink),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  podcast.name,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xff2F2F2F),
                    fontWeight: FontWeight.bold,
                    fontFamily: "PlayfairDisplay-VariableFont",
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  podcast.duration,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xff2F2F2F),
                    fontWeight: FontWeight.bold,
                    fontFamily: "PlayfairDisplay-VariableFont",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
