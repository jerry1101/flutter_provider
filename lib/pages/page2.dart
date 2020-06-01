import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/movieListViewModel.dart';
import 'movieListPage.dart';
import 'dart:developer' as developer;

class Page2 extends StatelessWidget {
  String data;
  Page2({Key key, @required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    developer.log("--------------->"+data);
    return MaterialApp(title: "Movies",
        home: ChangeNotifierProvider(
          // builder: (_) => MovieListViewModel(),
          create: (BuildContext context) => MovieListViewModel(),
          child: MovieListPage(),
        )
        );
  }
}