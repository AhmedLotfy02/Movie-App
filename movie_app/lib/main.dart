import 'package:flutter/material.dart';
import 'package:movie_app/screens/movies_listd.dart';
import 'controllers/httpcontroller.dart';
import 'models/movie.dart';

void main() => runApp(MyMovies());

class MyMovies extends StatelessWidget {
  const MyMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.orange.shade900),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MovieList();
  }
}

