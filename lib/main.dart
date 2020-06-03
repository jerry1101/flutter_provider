import 'package:flutter_provider/pages/movieListPage.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/request_criteria.dart';
import 'pages/page2.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Movies",
        color: Colors.purpleAccent,
        home: Portal(),
        theme: ThemeData(
          // Define the default brightness and colors.
          brightness: Brightness.light,
          primaryColor: Colors.deepPurple[800],
          accentColor: Colors.blueGrey,
          buttonColor: Colors.deepPurple[300],

          // Define the default font family.
          fontFamily: 'Georgia',

          // Define the default TextTheme. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(
                color: Colors.white,
                fontSize: 36.0,
                fontStyle: FontStyle.normal),
            bodyText2: TextStyle(fontSize: 20.0, fontFamily: 'Hind'),
          ),
        ) // ChangeNotifierProvider(
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
          backgroundColor: Theme.of(context).primaryColor),
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
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: _buildRaisedButton(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRaisedButton(BuildContext context) {
    return Container(
      height: 50.0,
      child: RaisedButton(
          color: Theme.of(context).buttonColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Theme.of(context).accentColor)),
          // shape:
          //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
          textColor: Colors.white,
          padding: const EdgeInsets.all(0.0),
          child: Text('Analyze',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Page2(
                      requestInput: HttpRequestInput(
                          userAgentVersion: dropdownValue,
                          domain: _domainController.text,
                          uri: _urlController.text))),
            );
          }),
    );
  }

  Widget _buildUrl() {
    return TextField(
      controller: _urlController,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
          hintStyle: Theme.of(context).textTheme.bodyText2,
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
          hintStyle: Theme.of(context).textTheme.bodyText2,
          labelText: 'Domain',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: 'Enter a Domain'),
    );
  }

  Widget _buildUserAgentType() {
    return Container(
      width: 30,
      height: 60,
      padding: EdgeInsets.only(left: 250, right: 50),
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: Theme.of(context).textTheme.bodyText2,
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
            child: Text(
              value,
              textAlign: TextAlign.center,
            ),
          );
        }).toList(),
      ),
    );
  }
}
