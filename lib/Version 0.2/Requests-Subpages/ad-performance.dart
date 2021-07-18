import 'package:flutter/material.dart';
import 'package:applify/Menu/Requests/results-page.dart';

class AdPerformance extends StatefulWidget {
  final String choice;
  final String title;

  AdPerformance(this.choice, {Key key, this.title}) : super(key: key);

  @override
  _AdPerformanceState createState() => _AdPerformanceState();
}

class _AdPerformanceState extends State<AdPerformance> {
  String campaign;
  String adgroup;
  String ad;
  String search;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            title: Container(
                alignment: Alignment.center,
                child: Text("Change")
            )
        ),
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment(0.0, -1.0),
                    end: Alignment(0.0, 0.6),
                    colors: <Color>[
                      Color.fromRGBO(106, 145, 254, 1),
                      Color.fromRGBO(75, 117, 235, 1),
                    ]
                )
            ),
            child: Column(
                children: <Widget>[
                  SizedBox(
                      height: size.height * 0.08
                  ),
                  DropdownButton<String>(
                    value: campaign,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        campaign = newValue;
                      });
                    },
                    items: <String>['One', 'Two', 'Free', 'Four']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                      height: size.height * 0.08
                  ),
                  if (campaign != null) DropdownButton<String>(
                    value: adgroup,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        adgroup = newValue;
                      });
                    },
                    items: <String>['One', 'Two', 'Free', 'Four']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                      height: size.height * 0.08
                  ),
                  if (adgroup != null) DropdownButton<String>(
                    value: ad,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        ad = newValue;
                      });
                    },
                    items: <String>['One', 'Two', 'Free', 'Four']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                      height: size.height * 0.08
                  ),
                  if (ad != null) TextField(
                    keyboardType: TextInputType.text,
                    onChanged: (value) => search = value,
                  ),
                  SizedBox(
                    height: size.height * 0.08,
                  ),
                  Container(
                      child: ElevatedButton(
                          onPressed: () {
                            /*Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Result(actionReq, null, null, comments)
                                    )
                                );*/
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                            padding: EdgeInsets.all(0.0),
                          ),
                          child: Ink(
                              decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "LET'S GO",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                              )
                          )
                      )
                  )
                ]
            )
        )
    );
  }
}