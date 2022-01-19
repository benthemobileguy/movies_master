import 'package:flutter/material.dart';
import 'package:movie_app/presentation/pages/favourite/favourite_screen.dart';
import 'package:movie_app/presentation/pages/home/home_screen.dart';
import 'package:movie_app/presentation/pages/movie/movie_screen.dart';
import 'package:movie_app/presentation/pages/view-movie/view_movie_screen.dart';
import 'package:movie_app/presentation/resources/strings-manager.dart';

class Routes {
  static const String homeRoute = "/homeRoute";
  static const String singleMovieRoute = "/singleMovieRoute";
  static const String favMovieRoute = "/favMovieRoute";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => HomeView());
      case Routes.singleMovieRoute:
        return MaterialPageRoute(builder: (_) => ViewMovieView());
      case Routes.favMovieRoute:
        return MaterialPageRoute(builder: (_) => FavouriteView());
      default:
        return unDefinedRoute();
    }
  }
  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: Text(AppStrings.noRouteFound),
          ),
          body: Center(child: Text(AppStrings.noRouteFound)),
        ));
  }

}