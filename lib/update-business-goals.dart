import 'package:flutter/material.dart';

class UpdateBusinessGoalsPage extends StatefulWidget {
  UpdateBusinessGoalsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _UpdateBusinessGoalsPageState createState() => _UpdateBusinessGoalsPageState();
}

class _UpdateBusinessGoalsPageState extends State<UpdateBusinessGoalsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: Container(
              alignment: Alignment.center,
              child: Text("UpdateBusinessGoalsPageWidget")
          )
      ),
      body: Text('placeholder'),
    );
  }
}