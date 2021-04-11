import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        /*
        onPanUpdate: (details) {
          if (details.delta.dx > 0) {

          }
        },
        */
        child: Text('i will never forgive the japanese'),
      ),
    );
  }
}