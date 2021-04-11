import 'package:flutter/material.dart';

class RaiseRequestsPage extends StatefulWidget {
  RaiseRequestsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RaiseRequestsPageState createState() => _RaiseRequestsPageState();
}

class _RaiseRequestsPageState extends State<RaiseRequestsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: Container(
              alignment: Alignment.center,
              child: Text("RaiseRequestsPageWidget")
          )
      ),
      body: Text('placeholder'),
    );
  }
}