import 'package:flutter/material.dart';
import 'package:movie_app/controllers/httpcontroller.dart';
import 'package:movie_app/models/movie.dart';

class MovieList extends StatefulWidget {
  MovieList({Key? key}) : super(key: key);
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  late List<Movie> moviesList;
  Icon visibleIcon = Icon(Icons.search);
  Widget searchBar = Text('Movies');
  int? movieCount;
  List<Movie>? movies;
  final String iconBase = 'https://image.tmdb.org/t/p/w92/';
  final String defaultImage =
      'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';

  @override
  void initState() {
    initialize();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    NetworkImage image;
    return Scaffold(
      appBar: AppBar(
        title: searchBar,
        actions: [
          IconButton(
              onPressed: () {
                initialize();
              },
              icon: visibleIcon)
        ],
      ),
      body: ListView.builder(
          itemCount: (this.movieCount == null) ? 0 : this.movieCount,
          itemBuilder: (context, position) {
            if (movies!.length != 0) {
              if (movies![position].posterPath.length != 0) {
                image = NetworkImage(iconBase + movies![position].posterPath);
              } else {
                image = NetworkImage(defaultImage);
              }
              return Card(
                color: Colors.white,
                elevation: 2.0,
                child: ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                    backgroundImage: image,
                  ),
                  title: Text(movies![position].title),
                  subtitle: Text('Released: ' +
                      movies![position].releaseDate +
                      ' - Vote:' +
                      movies![position].voteAverage.toString()),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Future initialize() async {
    movies = await HttpHelper.getUpcoming();
    setState(() {
      movieCount = movies!.length;
      movies = movies;
    });
  }
}
