import 'package:flutter_provider/pages/movieListPage.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/page2.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Movies", color: Colors.purpleAccent, home: Portal()
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
  String dropdownValue = 'Mobile';
  final _userAgentVersions = <String>['Mobile', 'Desktop'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SEO Checker'),
        backgroundColor: Colors.deepPurple[800],
      ),
      body: Container(
        color: Colors.deepPurple,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: _buildUserAgentType(),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: _buildDomain(),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: _buildUrl(),
            ),
            Padding(
              padding: const EdgeInsets.all(100.0),
              child: _buildRaisedButton(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRaisedButton(BuildContext context) {
    return Container(
      alignment: Alignment(0, 0),
      child: RaisedButton(
          textColor: Colors.white,
          color: Colors.deepPurple,
          padding: const EdgeInsets.all(0.0),
          child: Container(
              height: 50,
              width: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(10.0),
              child: Text('Analyze',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 20))),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Page2(data: myController.text)),
            );
          }),
    );
  }

  Material _buildUrl() {
    return Material(
      borderOnForeground: true,
      color: Colors.purple[50],
      child: Container(
        height: 80,
        width: 400,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xFF0D47A1),
              Color(0xFF1976D2),
              Color(0xFF42A5F5),
            ],
          ),
        ),
        child: TextField(
          controller: myController,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              hintText: 'Enter a Url'),
        ),
      ),
    );
  }

  Material _buildDomain() {
    return Material(
      child: TextField(
        controller: myController,
        decoration: InputDecoration(
            border: InputBorder.none, hintText: 'Enter a Domain'),
      ),
    );
  }

  Material _buildUserAgentType() {
    return Material(
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: _userAgentVersions.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
