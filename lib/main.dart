import 'package:flutter_provider/pages/movieListPage.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/page2.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Movies", home: Portal()
        // ChangeNotifierProvider(
        //   builder: (_) => MovieListViewModel(),
        //   child: MovieListPage(),
        // )
        );
  }
}

class Portal extends StatefulWidget {
  const Portal({Key key}) : super(key: key);

  @override
  _PortalState createState() => _PortalState();
}

class _PortalState extends State<Portal> {
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: <Widget>[
          Material(
                      child: TextField(
                        controller: myController,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Enter a search term'),
            ),
          ),
          RaisedButton(
              child: Text('test'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Page2(data:myController.text)),
                );
              }),
        ],
      ),
    );
  }
}
