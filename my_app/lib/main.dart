import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

// stless + tab
// this class helps with hot reload
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("my first flutter app"),
        centerTitle: true,
        backgroundColor: Colors.red[400],
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            child: Image.asset('assets/zoltan-tasi-HQPJEEjHqSE-unsplash.jpg'),
            flex: 3,
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(30.0),
              color: Colors.pink[200],
              child: Text("1"),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(30.0),
              color: Colors.amber[200],
              child: Text("2"),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(30.0),
              color: Colors.green[200],
              child: Text("3"),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text("click"),
        backgroundColor: Colors.red[400],
      ),
    );
  }
}


