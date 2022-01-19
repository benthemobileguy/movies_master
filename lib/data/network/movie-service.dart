import 'package:flutter/material.dart';
import 'package:movie_app/data/bloc/index.dart';
import 'package:movie_app/data/network/api-service.dart';
import 'package:provider/provider.dart';

class MovieService extends ApiService {
  BuildContext context;
  MainBloc bloc;
  MovieService({@required this.context}) : super(context: context);

  Future<Map<String, dynamic>> fetchMovieList() async {
    Map<String, dynamic> _response = await get('movies');
    return _response;
  }
}
