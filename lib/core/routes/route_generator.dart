import 'package:ebook_app/core/routes/route_names.dart';
import 'package:ebook_app/features/book_info/presentation/pages/book_info_page.dart';
import 'package:ebook_app/features/home/presentation/pages/home_page.dart';
import 'package:ebook_app/features/nav_bar_widget.dart';
import 'package:ebook_app/features/podcast_player/presentation/screen/podcast_player_screen.dart';
import 'package:ebook_app/features/splash/presesntation/pages/splash_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../features/home/domain/entities/podcast.dart';

class AppRoute {
  BuildContext context;

  AppRoute({required this.context});

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
        break;
      case RouteNames.navBar:
        return MaterialPageRoute(builder: (_) => const NavBarWidget());
        break;
      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => HomePage());
        break;
      case RouteNames.bookInfo:
        final podcast = routeSettings.arguments as Podcast;
        return MaterialPageRoute(
            builder: (_) => BookInfoPage(podcast: podcast));
        break;
        case RouteNames.podcastPlayer:
        final podcast = routeSettings.arguments as Podcast;
        return MaterialPageRoute(
            builder: (_) => PodcastPlayerScreen(podcast: podcast));
        break;

      default:
        return _errorRoute();
    }
  }

  Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Page not found')),
      ),
    );
  }
}
