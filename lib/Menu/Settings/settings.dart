import 'package:flutter/material.dart';

class AppSettings extends StatefulWidget {
  final String title;

  AppSettings({Key key, this.title}) : super(key: key);

  @override
  _AppSettingsState createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Text('my settings yo');
  }
}