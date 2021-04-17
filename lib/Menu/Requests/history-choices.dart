import 'package:flutter/material.dart';

class KWResearch extends StatefulWidget {
  KWResearch({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _KWResearchState createState() => _KWResearchState();
}

class _KWResearchState extends State<KWResearch> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: Container(
              alignment: Alignment.center,
              child: Text("KWResearch")
          )
      ),
      body: Text('placeholder'),
    );
  }
}