import 'package:flutter/material.dart';
import 'package:movie_app/data/models/movie.dart';
import 'package:movie_app/data/network/movie-service.dart';

class MainBloc with ChangeNotifier{
  List<Movies> _movies = [];

  List<Movies> get movies {
    return _movies;
  }
  set movies( List<Movies> _data) {
    this._movies = _data;
    notifyListeners();
  }
  ///fetch movies
  Future<List<Movies>> fetchMovies (BuildContext context) async {
    MovieService movieService = new MovieService(
        context: context);
    Map<String, dynamic> res = await movieService.fetchMovieList();
    print(res);
    this._movies= Movies.fromJsonList(res["data"]["movies"]);
    print(_movies.length);
    notifyListeners();
    return movies;
  }
}
