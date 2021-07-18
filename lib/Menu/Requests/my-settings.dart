import 'package:flutter/material.dart';
import 'package:applify/Menu/Requests/results-page.dart';

class Settings extends StatefulWidget {
  final String choice;
  final String title;

  Settings(this.choice, {Key key, this.title}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String actionReq;
  String comments;

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
        body: InkWell(
            splashColor: Colors.purple,
            child: Container(
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
                          height: size.height * 0.2
                      ),
                      if (widget.choice == 'newcamp') Container(
                          child: Text('Input Campaign Goals:', textAlign: TextAlign.left, style: TextStyle(fontSize: 22))
                      ) else Container(
                          child: Text('Select Settings To Change:', textAlign: TextAlign.left, style: TextStyle(fontSize: 22))
                      ),
                      SizedBox(
                          height: size.height * 0.1
                      ),
                      if (widget.choice == 'newcamp') Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          onChanged: (value) => actionReq = value.trim(),
                        ),
                      ) else Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text('placeholder')
                      ),
                      SizedBox(
                          height: size.height * 0.1
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.text,
                            onChanged: (value) => comments = value.trim(),
                          )
                      ),
                      SizedBox(
                          height: size.height * 0.1
                      ),
                      Container(
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Result(actionReq, null, null, comments)
                                    )
                                );
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
        )
    );
  }
}