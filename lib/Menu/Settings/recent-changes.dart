import 'package:flutter/material.dart';

class RecentChangesPage extends StatefulWidget {
  RecentChangesPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RecentChangesPageState createState() => _RecentChangesPageState();
}

class _RecentChangesPageState extends State<RecentChangesPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: Container(
              alignment: Alignment.center,
              child: Text("RecentChangesPageWidget")
          )
      ),
      body: Text('placeholder'),
    );
  }
}