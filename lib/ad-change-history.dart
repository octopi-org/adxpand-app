import 'package:flutter/material.dart';

class AdChangeHistoryPage extends StatefulWidget {
  AdChangeHistoryPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AdChangeHistoryPageState createState() => _AdChangeHistoryPageState();
}

class _AdChangeHistoryPageState extends State<AdChangeHistoryPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: Text("AdChangeHistoryPageWidget")
        )
      ),
      body: Text('placeholder'),
    );
  }
}