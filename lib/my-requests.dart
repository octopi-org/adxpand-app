import 'package:flutter/material.dart';

class MyRequestsPage extends StatefulWidget {
  MyRequestsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyRequestsPageState createState() => _MyRequestsPageState();
}

class _MyRequestsPageState extends State<MyRequestsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: Container(
              alignment: Alignment.center,
              child: Text("MyRequestsPageWidget")
          )
      ),
      body: Text('placeholder'),
    );
  }
}