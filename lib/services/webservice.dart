import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_provider/models/movie.dart';
import 'package:html/parser.dart';

import 'package:html/dom.dart';
import 'package:http/http.dart';

class Webservice {
  Future<List<Movie>> getAllMovies() async {
    // var client = Client();
    List<Movie> movies = [];
    try {
      var response = await Dio().get('https://www.totalwine.com/wine/brand/bittermilk',
          options: Options(headers: {
            'User-Agent':
                'Mozilla/5.0 (iPhone; CPU iPhone OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A5376e Safari/8536.25'
          }));

      var document = parse(response.toString());

      var isRedirected = response.isRedirect.toString();
      var h1 = document.getElementsByTagName('h1').isNotEmpty
          ? document.getElementsByTagName('h1').first.text
          : "";
      Element title = document.getElementsByTagName('title').first;

      // });
      // final response = await http.get('https://miniature-glockenspiel.glitch.me/movies');
      // if(response.statusCode == 200) {

      //   Iterable json = jsonDecode(response.body);
      //   return json.map((movie) => Movie.fromJson(movie)).toList();
      movies.add(Movie(title: 'isRedirected', description: isRedirected));
      movies.add(Movie(title: 'h1', description: h1));
      movies.add(Movie(title: 'title', description: title.text));
    } catch (e) {
      movies.add(Movie(
          title: 'Wrong response',
          description: e.toString()));
    }
    // Future.delayed(Duration(seconds: 5), () {

    var completer = new Completer<List<Movie>>();

    // At some time you need to complete the future:
    completer.complete(movies);

    return completer.future;

    // } else {
    //   throw Exception("Error downloading movies..");
    // }
  }
}
