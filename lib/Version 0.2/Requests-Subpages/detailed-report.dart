import 'package:flutter/material.dart';
import 'package:applify/Menu/Requests/results-page.dart';

class DetailedReport extends StatefulWidget {
  final String title;

  DetailedReport({Key key, this.title}) : super(key: key);

  @override
  _DetailedReportState createState() => _DetailedReportState();
}

class _DetailedReportState extends State<DetailedReport> {
  DateTime startSelectedDate = DateTime.now();
  DateTime endSelectedDate = DateTime.now();

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
                  Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            ElevatedButton(
                                onPressed: () => buildMaterialDatePicker(context, 'start'),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                                  padding: EdgeInsets.all(0.0),
                                ),
                                child: Ink(
                                    decoration: BoxDecoration(
                                      color: Colors.deepPurple,
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Select Start of Period",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white
                                        ),
                                      ),
                                    )
                                )
                            ),
                            ElevatedButton(
                                onPressed: () => buildMaterialDatePicker(context, 'end'),
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
                                        "Select End of Period",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white
                                        ),
                                      ),
                                    )
                                )
                            )
                          ]
                      )
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
                                    builder: (context) => Result('test', startSelectedDate, endSelectedDate, null)
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

  buildMaterialDatePicker(BuildContext context, startOrEnd) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2016),
      lastDate: DateTime(2022),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark(),
          child: child,
        );
      },
    );
    if (startOrEnd == 'start') {
      if (picked != null && picked != startSelectedDate)
        setState(() {
          startSelectedDate = picked;
        }
        );
    } else {
      if (picked != null && picked != endSelectedDate)
        setState(() {
          endSelectedDate = picked;
        }
        );
    }
  }
}