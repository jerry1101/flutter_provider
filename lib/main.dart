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
  final _urlController = TextEditingController();
  final _domainController = TextEditingController();
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
        margin: EdgeInsets.all(5),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 20),
              child: _buildUserAgentType(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: _buildDomain(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: _buildUrl(),
            ),
            _buildRaisedButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildRaisedButton(BuildContext context) {
    return Container(
      height: 50.0,
      child: RaisedButton(
        color: Colors.deepOrange[800],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.deepOrange[400])),
          // shape:
          //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
          textColor: Colors.white,
          padding: const EdgeInsets.all(0.0),
          child: Text('Analyze',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 36, color: Colors.white)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Page2(data: _urlController.text)),
            );
          }),
    );
  }

  Widget _buildUrl() {
    return TextField(
      controller: _urlController,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
          labelText: 'URL',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: 'Enter a Url'),
    );
  }

  Widget _buildDomain() {
    return TextField(
      controller: _domainController,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
          labelText: 'Domain',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: 'Enter a Domain'),
    );
  }

  Widget _buildUserAgentType() {
    return DropdownButton<String>(
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
    );
  }
}
