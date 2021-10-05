import 'dart:convert';
import 'dart:html';

import 'package:http/http.dart' as http;
import 'package:movie_app/models/movie.dart';

class HttpHelper {
  static Future<List<Movie>> getUpcoming() async {
  var result = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/upcoming?api_key=9373c1671ed2570e670d66aa91d0c5a6'));
               
                  final jsonRepsonse = jsonDecode(result.body);
               return   List<Movie>.from( jsonRepsonse['results'].map((e)=>Movie.fromJson(e)));
  }
}
