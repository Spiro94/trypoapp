import 'package:flutter/material.dart';
import 'package:trypoapp/core/domain/entities/movie.dart';
import 'package:trypoapp/core/domain/entities/tv_show.dart';
import 'package:trypoapp/features/search/presentation/pages/add_alert/add_alert.dart';
import 'package:trypoapp/features/search/presentation/pages/home_page/home_page.dart';
import 'package:trypoapp/features/search/presentation/pages/search_movies_page/search_movies_page.dart';
import 'package:trypoapp/features/search/presentation/pages/show_details_page/show_details_page.dart';

class TypoAppRouter {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.routeName:
        return MaterialPageRoute(builder: (_) => HomePage());
      case ShowDetailsPage.routeName:
        return MaterialPageRoute(builder: (_) => ShowDetailsPage());
      case SearchMoviesPage.routeName:
        var isMovie = settings.arguments as bool;
        return MaterialPageRoute(
            builder: (_) => SearchMoviesPage(
                  isMovie: isMovie,
                ));
      case AddAlert.routeName:
        var show = settings.arguments;

        if (show is Movie) {
          return MaterialPageRoute(
              builder: (_) => AddAlert(
                    movie: show,
                  ));
        } else {
          return MaterialPageRoute(
              builder: (_) => AddAlert(
                    tvShow: show as TvShow,
                  ));
        }

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
