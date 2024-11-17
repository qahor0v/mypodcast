import 'package:ebook_app/core/di_injection/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ebook_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:ebook_app/features/home/presentation/bloc/home_event.dart';
import 'package:ebook_app/features/home/presentation/widgets/indicator_widget.dart';
import 'package:ebook_app/features/home/presentation/widgets/name_of_parts_widget.dart';
import 'package:ebook_app/features/home/presentation/widgets/newest_books_builder_widget.dart';
import 'package:ebook_app/features/home/presentation/widgets/popular_books_widget.dart';

import '../../domain/usecases/fetch_newest_podcasts.dart';
import '../../domain/usecases/fetch_top_podcasts.dart';

class HomePage extends StatelessWidget {
  final controller = PageController();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<HomeBloc>()..add(FetchPodcasts()),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xffF5EFE1),
          automaticallyImplyLeading: false,
          title: const Text(
            "Listen Me",
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff2F2F2F),
              fontFamily: "PlayfairDisplay-VariableFont",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: const Color(0xffF5EFE1),
        body: CustomScrollView(
          slivers: [
            NewestBooksBuilderWidget(controller: controller),
            IndicatorWidget(controller: controller),
            NameOfPartsWidget(name: "Popular Podcasts"),
            PopularBooksWidget(),
          ],
        ),
      ),
    );
  }
}
