import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stack_card/flutter_stack_card.dart';
import 'package:applify/Version 0.2/requests-data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class rainbowdashboard extends StatefulWidget {
  rainbowdashboard({Key key, this.title}) : super(key: key);

  final String title;

  @override
  rainbowdashboardState createState() => rainbowdashboardState();
}

class rainbowdashboardState extends State<rainbowdashboard> {
  String username;

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width/2,
      height: size.height/2,
      child: Column(
        children: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {_fetchName();},
            child: const Text('Get'),
          ),
          Text("cheebai ${username}")
          /*FutureBuilder(
              future: _fetchName(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
                  return Text( snapshot.data,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width/8,
                      )); } else if (snapshot.connectionState == ConnectionState.waiting) {{ return CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                );}} else {
                  return Text( "Dylan",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width/10,
                      )
                  );
                }
              }
          )
          */
        ]
      )
    );
  }

  Future _fetchName() async{
    String link = "https://betatest-api.herokuapp.com/appgetview";
    print("name future link: " + link);
    //final response = await http.get(link, headers: {"x-api-key": WasteLessData.userKey});
    final response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      //return json.decode(response.body)["username"].toString();
      print(response.statusCode);
      setState(() => username = response.statusCode.toString());
    } else {
      throw Exception('Failed to load data');
    }
  }
}