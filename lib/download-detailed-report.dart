import 'package:flutter/material.dart';

class DownloadDetailedReportPage extends StatefulWidget {
  DownloadDetailedReportPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DownloadDetailedReportPageState createState() => _DownloadDetailedReportPageState();
}

class _DownloadDetailedReportPageState extends State<DownloadDetailedReportPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: Container(
              alignment: Alignment.center,
              child: Text("DownloadDetailedReportPageWidget")
          )
      ),
      body: Text('placeholder'),
    );
  }
}