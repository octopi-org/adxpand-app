import 'package:flutter/material.dart';
import 'package:applify/Menu/Requests/results-page.dart';

class HistoryPage extends StatefulWidget {
  final String choice;
  final String title;

  HistoryPage(this.choice, {Key key, this.title}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  String searchReq;
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
                if (widget.choice == 'kwresearch') Container(
                    child: Text('Keyword Seed:', textAlign: TextAlign.left, style: TextStyle(fontSize: 22))
                ) else if (widget.choice == 'adperf') Container(
                    child: Text('Select Metrics:', textAlign: TextAlign.left, style: TextStyle(fontSize: 22))
                ) else Container(
                    child: Text('Select Change History:', textAlign: TextAlign.left, style: TextStyle(fontSize: 22))
                ),
                SizedBox(
                    height: size.height * 0.1
                ),
                if (widget.choice == 'kwresearch') Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    onChanged: (value) => searchReq = value.trim(),
                  ),
                ) else if (widget.choice == 'adperf') Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: DropdownButton(
                    value: searchReq,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    underline: Container(
                      height: 2,
                      color: Colors.white,
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        searchReq = newValue;
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
                ) else Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    onChanged: (value) => searchReq = value.trim(),
                  ),
                ),
                SizedBox(
                    height: size.height * 0.1
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
                    height: size.height * 0.1
                ),
                Container(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Result(searchReq, startSelectedDate, endSelectedDate, null)
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