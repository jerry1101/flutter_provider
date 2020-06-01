

import 'package:flutter/material.dart';
import 'package:flutter_provider/models/movie.dart';
import 'package:flutter_provider/services/webservice.dart';

class MovieListViewModel extends ChangeNotifier {

  List<MovieViewModel> movies; 

  Future<void> fetchAllMovies() async {

    final movies = await Webservice().getAllMovies();
    this.movies = movies.map((movie) => MovieViewModel(movie: movie)).toList();
    notifyListeners(); 
  }

}

class MovieViewModel {

  final Movie movie; 

  MovieViewModel({this.movie});

  String get title {
    return this.movie.title; 
  }

}

