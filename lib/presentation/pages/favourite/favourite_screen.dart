import 'package:flutter/material.dart';
import 'package:movie_app/data/bloc/index.dart';
import 'package:movie_app/data/models/movie.dart';
import 'package:movie_app/presentation/pages/movie/widgets/movie-list.dart';
import 'package:movie_app/presentation/pages/movie/widgets/shimmer-list.dart';
import 'package:provider/provider.dart';

class FavouriteView extends StatefulWidget {
  const FavouriteView({Key key}) : super(key: key);

  @override
  _FavouriteViewState createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {
  MainBloc mainBloc;
  List<Movies> favouritesList = [];

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    mainBloc = Provider.of<MainBloc>(context);
    //map favourites list from main list
    favouritesList = mainBloc.movies.where((element)
    => element.isFavorited == true).toList();

    print(mainBloc.movies.length);
    print(favouritesList.length);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: favouritesList.length,
          itemBuilder: (BuildContext context, int index) {
            return MovieList(
              iconPressed: null,
              isFavorited:mainBloc.movies[index].isFavorited,
              image: mainBloc.movies[index].thumbnail,
              title: mainBloc.movies[index].name,
              subtitle: mainBloc.movies[index].description,
              showDivider: true,
            );
          }),
    );
  }
}
