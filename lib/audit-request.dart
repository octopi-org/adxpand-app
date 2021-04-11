import 'package:flutter/material.dart';

class AuditRequestPage extends StatefulWidget {
  AuditRequestPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AuditRequestPageState createState() => _AuditRequestPageState();
}

class _AuditRequestPageState extends State<AuditRequestPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: Container(
              alignment: Alignment.center,
              child: Text("AuditRequestPageWidget")
          )
      ),
      body: Text('placeholder'),
    );
  }
}