import 'package:flutter/material.dart';
import 'package:applify/Menu/Requests/results-page.dart';

class AdPerformance extends StatefulWidget {
  final String title;

  AdPerformance({Key key, this.title}) : super(key: key);

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
        resizeToAvoidBottomInset: false,
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
                      height: size.height * 0.08,
                      child: Center(
                          child: Text('Campaign', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white))
                      )
                  ),
                  Center(child: Container(
                    padding: EdgeInsets.only(right: 20, left: 20),
                    alignment: Alignment.centerRight,
                    width: size.width * 0.7,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                    child: DropdownButton<String>(
                      value: campaign,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      iconSize: 24,
                      elevation: 16,
                      isExpanded: true,
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
                          child: Text(value, overflow: TextOverflow.ellipsis),
                        );
                      }).toList(),
                    ),
                  )),
                  if (campaign != null) SizedBox(
                      height: size.height * 0.08,
                      child: Center(
                          child: Text('Ad Group', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white))
                      )
                  ),
                  if (campaign != null) Center(child: Container(
                    padding: EdgeInsets.only(right: 20, left: 20),
                    alignment: Alignment.centerRight,
                    width: size.width * 0.7,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                    child: DropdownButton<String>(
                      value: adgroup,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      iconSize: 24,
                      elevation: 16,
                      isExpanded: true,
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
                          child: Text(value, overflow: TextOverflow.ellipsis),
                        );
                      }).toList(),
                    ),
                  )),
                  if (adgroup != null) SizedBox(
                      height: size.height * 0.08,
                      child: Center(
                          child: Text('Ad', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white))
                      )
                  ),
                  if (adgroup != null) Center(child: Container(
                    padding: EdgeInsets.only(right: 20, left: 20),
                    alignment: Alignment.centerRight,
                    width: size.width * 0.7,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                    child: DropdownButton<String>(
                      value: ad,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      iconSize: 24,
                      elevation: 16,
                      isExpanded: true,
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
                          child: Text(value, overflow: TextOverflow.ellipsis),
                        );
                      }).toList(),
                    ),
                  )),
                  if (ad != null) SizedBox(
                      height: size.height * 0.08,
                      child: Center(
                          child: Text('Keyword(s)', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white))
                      )
                  ),
                  if (ad != null) Container(
                    padding: EdgeInsets.only(left: 20),
                    width: size.width * 0.9,
                    height: size.height * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Separate individual keywords with a comma and without spaces',
                        ),
                        keyboardType: TextInputType.text,
                        onChanged: (value) => search = value,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.08,
                  ),
                  if (search != null) Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.5,
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color.fromRGBO(254, 180, 48, 1),
                            ),
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
                                  padding: EdgeInsets.all(5.0),
                                  primary: Color.fromRGBO(254, 157, 89, 1),
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "LET'S GO",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                )
                            )
                        )
                      ]
                  )
                ]
            )
        )
    );
  }
}