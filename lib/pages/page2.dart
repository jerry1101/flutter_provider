import 'package:flutter/material.dart';
import 'package:flutter_provider/models/request_criteria.dart';
import 'package:provider/provider.dart';

import '../viewmodels/movieListViewModel.dart';
import 'movieListPage.dart';
import 'dart:developer' as developer;

class Page2 extends StatelessWidget {
  final HttpRequestInput requestInput;
  Page2({Key key, @required this.requestInput}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    developer.log("------>" + requestInput.domain);
    return Scaffold(
        // appBar: AppBar(),
        // title: "Movies",
        body: ChangeNotifierProvider(
          create: (BuildContext context) => MovieListViewModel(),
          child: MovieListPage(
            requestInput: requestInput,
          ),
        ));
  }
}
