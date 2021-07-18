import 'package:flutter/material.dart';
import 'package:applify/Menu/Requests/results-page.dart';
import 'package:flutter/services.dart';

class ExistingAdSettings extends StatefulWidget {
  final String choice;
  final String title;

  ExistingAdSettings(this.choice, {Key key, this.title}) : super(key: key);

  @override
  _ExistingAdSettingsState createState() => _ExistingAdSettingsState();
}

class _ExistingAdSettingsState extends State<ExistingAdSettings> {
  String campaign;
  String adgroup;
  String ad;
  String adelements;
  DateTime startSelectedDate = DateTime.now();
  DateTime endSelectedDate = DateTime.now();
  String budgetelements;
  String titleordescription;
  String adtitle;
  String addescription;

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
                  if (ad != null) DropdownButton<String>(
                    value: adelements,
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
                        adelements = newValue;
                      });
                    },
                    items: <String>['Keywords', 'Ad Schedule', 'Ad Budget', 'Ad Details']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: size.height * 0.08,
                  ),
                  if (adelements == 'Keywords') SizedBox(
                    width: size.width,
                    height: size.height * 0.15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        ElevatedButton(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "Add keywords",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              ),
                            ),
                            onPressed: () {print('Add keywords');}
                        ),
                        ElevatedButton(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "Add negative keywords",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              ),
                            ),
                            onPressed: () {print('Add negative keywords');}
                        ),
                        ElevatedButton(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "Delete keywords",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              ),
                            ),
                            onPressed: () {print('Delete keywords');}
                        ),
                        ElevatedButton(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "Delete negative keywords",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              ),
                            ),
                            onPressed: () {print('Delete negative keywords');}
                        ),
                      ]
                    )
                  )
                  else if (adelements == 'Ad Schedule') Container(
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
                  )
                  else if (adelements == 'Ad Budget') Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        TextField(
                          decoration: new InputDecoration(labelText: "Enter your number"),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            FilteringTextInputFormatter.allow(RegExp(r"^\d+\.?\d{0,2}"))
                          ],
                        ),
                        DropdownButton<String>(
                          value: budgetelements,
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
                              budgetelements = newValue;
                            });
                          },
                          items: <String>['Cost Per Click', 'Total Daily Cost']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ]
                    )
                  ) else if (adelements == 'Ad Details') DropdownButton<String>(
                      value: titleordescription,
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
                          titleordescription = newValue;
                        });
                      },
                      items: <String>['Title', 'Description']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                  ),
                  SizedBox(
                    height: size.height * 0.08,
                  ),
                  if (titleordescription == 'Title') TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Ad Title',
                      labelText: 'Up to 30 characters',
                    ),
                    onSaved: (String value) {
                      adtitle = value;
                    },
                    validator: (String value) {
                      return (value != null && value.length > 30) ? 'You are ${value.length - 30} words over the limit' : null;
                    },
                  ) else if (titleordescription == 'Description') TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Ad Description',
                      labelText: 'Up to 90 characters',
                    ),
                    onSaved: (String value) {
                      addescription = value;
                    },
                    validator: (String value) {
                      return (value != null && value.length > 90) ? 'You are ${value.length - 90} words over the limit' : null;
                    },
                  ),
                  if (titleordescription != null) SizedBox(
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