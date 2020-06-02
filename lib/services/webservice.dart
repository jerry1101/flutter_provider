import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_provider/models/movie.dart';
import 'package:html/parser.dart';

import 'package:html/dom.dart';

class Webservice {
  Future<List<Movie>> getAllMovies() async {
    // var client = Client();
    List<Movie> movies = [];
    try {
      var response = await Dio().get('https://www.totalwine.com/careers',
          options: Options(headers: {
            'User-Agent':
                'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36'
            // 'Mozilla/5.0 (iPhone; CPU iPhone OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A5376e Safari/8536.25'
          }));

      var document = parse(response.toString());
      var resultUri = response.redirects.length > 0
          ? response.redirects[0].location
          : response.realUri.toString();
      var redirectCode = response.redirects.length > 0
          ? response.redirects[0].statusCode
          : 200;

      var h1 = document.getElementsByTagName('h1').isNotEmpty
          ? document.getElementsByTagName('h1').first.text
          : "";
      Element title = document.getElementsByTagName('title').first;

      movies.add(Movie(
          title: resultUri.toString(), description: redirectCode.toString()));
      movies.add(Movie(title: 'h1', description: h1.trim()));
      movies.add(Movie(title: 'title', description: title.text.trim()));
    } catch (e) {
      movies.add(Movie(title: 'Wrong response', description: e.toString()));
    }

    var completer = new Completer<List<Movie>>();

    completer.complete(movies);

    return completer.future;
  }
}
