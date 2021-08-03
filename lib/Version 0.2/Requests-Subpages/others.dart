import 'package:flutter/material.dart';
import 'package:applify/Menu/Requests/results-page.dart';

class Others extends StatefulWidget {
  final String title;

  Others({Key key, this.title}) : super(key: key);

  @override
  _OthersState createState() => _OthersState();
}

class _OthersState extends State<Others> {
  String subject;
  String text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            title: Container(
                alignment: Alignment.center,
                child: Text("History")
            )
        ),
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Color.fromRGBO(106, 145, 254, 1),
                      Color.fromRGBO(75, 117, 235, 1),
                    ]
                )
            ),
            child: Column(
                children: <Widget>[
                  SizedBox(
                      height: size.height * 0.2
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Subject',
                      labelText: 'Up to 100 characters',
                    ),
                    onSaved: (String value) {
                      subject = value;
                    },
                    validator: (String value) {
                      return (value != null && value.length > 100) ? 'You are ${value.length - 100} words over the limit' : null;
                    },
                  ),
                  SizedBox(
                      height: size.height * 0.2
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Subject',
                      labelText: 'Up to 3000 characters',
                    ),
                    onSaved: (String value) {
                      text = value;
                    },
                    validator: (String value) {
                      return (value != null && value.length > 3000) ? 'You are ${value.length - 3000} words over the limit' : null;
                    },
                  ),
                  SizedBox(
                      height: size.height * 0.2
                  ),
                  Container(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Result('test', null, null, null)
                                )
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                            padding: EdgeInsets.all(0.0),
                          ),
                          child: Ink(
                              decoration: BoxDecoration(
                                color: Colors.deepPurple ,
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