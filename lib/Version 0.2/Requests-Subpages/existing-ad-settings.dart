import 'package:flutter/material.dart';
import 'package:applify/Menu/Requests/results-page.dart';
import 'package:flutter/services.dart';

class ExistingAdSettings extends StatefulWidget {
  final String title;

  ExistingAdSettings({Key key, this.title}) : super(key: key);

  @override
  _ExistingAdSettingsState createState() => _ExistingAdSettingsState();
}

class _ExistingAdSettingsState extends State<ExistingAdSettings> {
  String campaign;
  String adgroup;
  String ad;
  String adelements;
  DateTime startSelectedDate;
  DateTime endSelectedDate;
  String budgetelements;
  String titleordescription;
  String adtitle;
  String addescription;

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
            height: size.height,
            width: size.width,
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
            child: SingleChildScrollView(
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
                            child: Text('Select detail to change', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white))
                        )
                    ),
                    if (ad != null) Center(child: Container(
                      padding: EdgeInsets.only(right: 20, left: 20),
                      alignment: Alignment.centerRight,
                      width: size.width * 0.7,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                      child: DropdownButton<String>(
                        value: adelements,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        iconSize: 24,
                        elevation: 16,
                        isExpanded: true,
                        style: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 20),
                        onChanged: (String newValue) {
                          setState(() {
                            adelements = newValue;
                          });
                        },
                        items: <String>['Keywords', 'Ad Schedule', 'Ad Budget', 'Ad Details']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, overflow: TextOverflow.ellipsis),
                          );
                        }).toList(),
                      ),
                    )),
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
                                Center(child: Container(
                                  padding: EdgeInsets.only(right: 20, left: 20),
                                  alignment: Alignment.centerRight,
                                  width: size.width * 0.7,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                                  child: DropdownButton<String>(
                                    value: budgetelements,
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    iconSize: 24,
                                    elevation: 16,
                                    isExpanded: true,
                                    style: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 20),
                                    onChanged: (String newValue) {
                                      setState(() {
                                        budgetelements = newValue;
                                      });
                                    },
                                    items: <String>['Cost Per Click', 'Total Daily Cost']
                                        .map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value, overflow: TextOverflow.ellipsis),
                                      );
                                    }).toList(),
                                  ),
                                )),
                              ]
                          )
                      ) else if (adelements == 'Ad Details') Center(child: Container(
                        padding: EdgeInsets.only(right: 20, left: 20),
                        alignment: Alignment.centerRight,
                        width: size.width * 0.7,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                        child: DropdownButton<String>(
                          value: titleordescription,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          iconSize: 24,
                          elevation: 16,
                          isExpanded: true,
                          style: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 20),
                          onChanged: (String newValue) {
                            setState(() {
                              titleordescription = newValue;
                            });
                          },
                          items: <String>['Title', 'Description']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value, overflow: TextOverflow.ellipsis),
                            );
                          }).toList(),
                        ),
                      )),
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
                    if (((startSelectedDate != null) && (endSelectedDate != null)) || (budgetelements != null) || (adtitle != null) || (addescription!= null)) SizedBox(
                      height: size.height * 0.08,
                    ),
                    if (((startSelectedDate != null) && (endSelectedDate != null)) || (budgetelements != null) || (adtitle != null) || (addescription!= null)) Row(
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