import 'package:flutter/material.dart';
import 'package:movie_app/data/bloc/index.dart';
import 'package:movie_app/presentation/pages/movie/widgets/movie-list.dart';
import 'package:movie_app/presentation/pages/movie/widgets/shimmer-list.dart';
import 'package:movie_app/presentation/resources/routes-manager.dart';
import 'package:provider/provider.dart';

class MovieView extends StatefulWidget
{
  const MovieView({Key key}) : super(key: key);

  @override
  _MovieViewState createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView>
    with AutomaticKeepAliveClientMixin{
  MainBloc mainBloc;
  bool isLoaded = false;
  bool isInitialised = false;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    mainBloc = Provider.of<MainBloc>(context);
    if(!isInitialised){
      fetchMovies();
      isInitialised = true;
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !isLoaded?Padding(
        padding: const EdgeInsets.all(6.0),
        child: ShimmerListView(),
      ):
      ListView.builder(
          itemCount: mainBloc.movies.length,
          itemBuilder: (BuildContext context, int index) {
        return MovieList(
          iconPressed: (){
            setState(() {
              mainBloc.movies[index].isFavorited =
                  !mainBloc.movies[index].isFavorited;
            });
          },
          onPressed: (){
            // Navigator.pushNamed(
            //     context, Routes.favMovieRoute);
          },
          isFavorited: mainBloc.movies[index].isFavorited,
       image: mainBloc.movies[index].thumbnail,
          title: mainBloc.movies[index].name,
          subtitle: mainBloc.movies[index].description,
          showDivider: true,
        );
      }),
    );
  }

  fetchMovies() async{
   await mainBloc.fetchMovies(context);
    setState(() {
      isLoaded = true;
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
