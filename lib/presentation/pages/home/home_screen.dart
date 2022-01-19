import 'package:flutter/material.dart';
import 'package:movie_app/presentation/pages/favourite/favourite_screen.dart';
import 'package:movie_app/presentation/pages/movie/movie_screen.dart';
import 'package:movie_app/presentation/pages/view-movie/view_movie_screen.dart';
import 'package:movie_app/presentation/resources/strings-manager.dart';
import 'package:movie_app/presentation/resources/values-manager.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  static const List<Tab> _tabs = [
    const Tab(icon: Icon(Icons.local_movies),
        child:  Text(
          AppStrings.movies,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: AppSize.s16,
            fontWeight: FontWeight.w500,
            fontFamily: 'Euclid',
            color: Colors.white,
          ),
        ),

    ),
    const Tab(icon: Icon(Icons.favorite),
      child:  Text(
        AppStrings.favourites,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: AppSize.s16,
          fontWeight: FontWeight.w500,
          fontFamily: 'Euclid',
          color: Colors.white,
        ),
      ),

    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: _tabs,
            )
          ),
          body: TabBarView(
            children: [
             MovieView(),
             FavouriteView(),
            ],
          ),
        ),
      ),
    );
  }

}
