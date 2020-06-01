
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_provider/viewmodels/movieListViewModel.dart';

class MovieList extends StatelessWidget {
  List<MovieViewModel> movies;

  MovieList({this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.movies.length,
      itemBuilder: (BuildContext context, int index) {
        final movie = this.movies[index];

        return Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.amber,
                border: Border.all(width: 5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: Text(movie.title),
                leading: FlutterLogo(),
              ),
            ),
            ListTile(
              title: Text(movie.movie.description),
            ),
          ],
        );
      },
    );
  }
}
