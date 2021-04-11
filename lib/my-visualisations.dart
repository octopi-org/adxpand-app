import 'package:flutter/material.dart';

class MyVisualisationsPage extends StatefulWidget {
  MyVisualisationsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyVisualisationsPageState createState() => _MyVisualisationsPageState();
}

class _MyVisualisationsPageState extends State<MyVisualisationsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: Container(
              alignment: Alignment.center,
              child: Text("MyVisualisationsPageWidget")
          )
      ),
      body: Text('placeholder'),
    );
  }
}