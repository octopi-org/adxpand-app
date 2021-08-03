import 'package:flutter/material.dart';
import 'package:applify/Menu/Requests/results-page.dart';

class Audit extends StatefulWidget {
  final String title;

  Audit({Key key, this.title}) : super(key: key);

  @override
  _AuditState createState() => _AuditState();
}

class _AuditState extends State<Audit> {
  String campaign;
  String adgroup;
  String ad;
  DateTime startSelectedDate = DateTime.now();
  DateTime endSelectedDate = DateTime.now();

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
                      Color.fromRGBO(89, 129, 245, 1),
                    ]
                )
            ),
            child: Column(
                children: <Widget>[
                  SizedBox(
                      height: size.height * 0.08
                  ),
                  Center(child: Container(
                    padding: EdgeInsets.only(right: 20),
                    alignment: Alignment.centerRight,
                    width: size.width * 0.7,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                    child: DropdownButton<String>(
                      value: campaign,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 20),
                      onChanged: (String newValue) {
                        setState(() {
                          campaign = newValue;
                        });
                      },
                      items: <String>['Shanghai E-Commerce Platforms', 'B2B Construction Materials Local', 'Fitness and Dietary Industry', 'Fashion and Accessories Local']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  )),
                  SizedBox(
                      height: size.height * 0.08
                  ),
                  if (campaign != null) Center(child: Container(
                    padding: EdgeInsets.only(right: 20),
                    alignment: Alignment.centerRight,
                    width: size.width * 0.7,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                    child: DropdownButton<String>(
                      value: adgroup,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 20),
                      onChanged: (String newValue) {
                        setState(() {
                          adgroup = newValue;
                        });
                      },
                      items: <String>['2021 Summer', '2021 Spring', '2020 Winter', '2020 Fall']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  )),
                  SizedBox(
                      height: size.height * 0.08
                  ),
                  if (adgroup != null) Center(child: Container(
                    padding: EdgeInsets.only(right: 20),
                    alignment: Alignment.centerRight,
                    width: size.width * 0.7,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                    child: DropdownButton<String>(
                      value: ad,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 20),
                      onChanged: (String newValue) {
                        setState(() {
                          ad = newValue;
                        });
                      },
                      items: <String>['June Flash Sale', 'CNY Special Season Promo', 'Bubble Tea and Extra Deal', 'Lee Seong-jin Adverts']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  )),
                  SizedBox(
                      height: size.height * 0.08
                  ),
                  if (ad != null) Container(
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