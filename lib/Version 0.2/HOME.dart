import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:applify/Version 0.2/REQUESTS.dart';
import 'package:applify/Version 0.2/VISUALIZATIONS.dart';
import 'package:applify/Version 0.2/DASHBOARD.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  static List<Widget> _widgetOptions = <Widget>[
    rainbowdashboard(),
    MyVisualisationsPage(),
    Requests(),
    Text('settings'),
  ];

  @override
  void initState() {
    _index = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Color.fromRGBO(89, 129, 245, 1),
          items: <Widget>[
            Icon(Icons.dashboard, size: 30),
            Icon(Icons.stacked_bar_chart, size: 30),
            Icon(Icons.description, size: 30),
            Icon(Icons.settings_sharp, size: 30)
          ],
          onTap: (index) {setState(() {_index = index;});}
      ),
      body: _widgetOptions[_index]
    );
  }

}

// 4B75EB 6A91FE 507BEE 5981F5

// FEB430