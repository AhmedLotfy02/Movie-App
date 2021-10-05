import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  MovieDetail(this.movie, {Key? key}) : super(key: key);
  final String imageBase = 'https://image.tmdb.org/t/p/w500/';
  final String defaultImage =
      'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    String path;
    if (movie.posterPath != null) {
      path = imageBase + movie.posterPath;
    } else {
      path = defaultImage;
    }
    return Scaffold(
appBar: AppBar(
  title: Text(this.movie.title),

),
body: SingleChildScrollView(child: Center(child: Column(
  children: [
    Container(
      padding: EdgeInsets.all(16),
      height: height/1.5,
      child: Image.network(path),
    ),
    Container(
      padding:EdgeInsets.only(left:20 , right: 20),
      child: Text(movie.overview),
    )
  ],
),),),

    );
  }
}
