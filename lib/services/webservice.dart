import 'dart:async';
import 'dart:convert';

import 'package:flutter_provider/models/movie.dart';
import 'package:http/http.dart' as http;


class Webservice {
  Future<List<Movie>> getAllMovies() async {
    // final response = await http.get('https://miniature-glockenspiel.glitch.me/movies');
    // if(response.statusCode == 200) {

    //   Iterable json = jsonDecode(response.body);
    //   return json.map((movie) => Movie.fromJson(movie)).toList();
    List<Movie> movies = [];
    movies.add(Movie(title: 'h1', description: 'new wine'));
    movies.add(Movie(title: 'title', description: 'new wine for sale'));
    var completer = new Completer<List<Movie>>();

    // At some time you need to complete the future:
    completer.complete(movies);

    return completer.future;

    // } else {
    //   throw Exception("Error downloading movies..");
    // }
  }
}
