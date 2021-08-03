import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  final String title;
  final String kw_metric_or_chhist;
  final DateTime startSelectedDate;
  final DateTime endSelectedDate;
  final String comments;

  Result(this.kw_metric_or_chhist, this.startSelectedDate, this.endSelectedDate, this.comments, {Key key, this.title}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
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
        child: Text('Placing A Placeholder In Place To Hold A Place'),
      ),
    );
  }
}