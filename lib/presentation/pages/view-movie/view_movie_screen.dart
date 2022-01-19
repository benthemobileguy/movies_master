import 'package:flutter/material.dart';
import 'package:movie_app/presentation/resources/color-manager.dart';
import 'package:movie_app/presentation/resources/main-button.dart';
import 'package:movie_app/presentation/resources/values-manager.dart';

class ViewMovieView extends StatefulWidget {
  const ViewMovieView({Key key}) : super(key: key);

  @override
  _ViewMovieViewState createState() => _ViewMovieViewState();
}

class _ViewMovieViewState extends State<ViewMovieView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

        ],
      ),
    );
  }
}
