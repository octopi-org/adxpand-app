import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:applify/Menu/Requests/menu-item.dart';
import 'package:applify/Menu/Requests/menu-functions.dart';

class MyRequestsPage extends StatefulWidget {
  MyRequestsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyRequestsPageState createState() => _MyRequestsPageState();
}

class _MyRequestsPageState extends State<MyRequestsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
        children: <Widget>[
          new Container(
              decoration: new BoxDecoration(image: new DecorationImage(image: new AssetImage('assets/company-logo.png'), fit: BoxFit.fill))
          ),
          SingleChildScrollView(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: size.width * 0.90
                      ),
                      child: MenuSection(
                          'History',
                          Colors.black,
                          Colors.black,
                          historyMenuItem,
                          AssetImage('assets/update-business-goals.png')
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: size.width * 0.90
                      ),
                      child: MenuSection(
                          'Change',
                          Colors.white,
                          Colors.white,
                          changeMenuItem,
                          AssetImage('assets/recent-changes.png')
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: size.width * 0.90
                      ),
                      child: MenuSection(
                          'Custom',
                          Colors.white,
                          Colors.white,
                          customMenuItem,
                          AssetImage('assets/my-visualisations.png')
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                  ]
              ),
            ),
          ),
        ]
    );
  }
}

/*

class _firstMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        focusColor: Colors.white,
        value: _chosenValue,
        style: TextStyle(color: Colors.white),
        iconEnabledColor:Colors.black,
        items: <String>[
          'History',
          'Change',
          'Custom',
        ].map((String value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value, style: TextStyle(color: Colors.black)),
          );
        }).toList(),
        hint: Text(
          "Your request",
          style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        onChanged: (String value) {
          // do something
        },
    );
  }
}

*/

/*

return Stack(
        children: <Widget>[
          new Container(
              decoration: new BoxDecoration(image: new DecorationImage(image: new AssetImage('assets/company-logo.png'), fit: BoxFit.fill))
          ),
          SingleChildScrollView(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    SizedBox(
                      width: size.width * 0.85,
                      height: size.height * 0.35,
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 36.0, left: 6.0, right: 6.0, bottom: 6.0),
                          child: ExpansionTile(
                            title: Text('History'),
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) => HistoryChoice(),
                                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                        var begin = Offset(0.0, 1.0);
                                        var end = Offset.zero;
                                        var curve = Curves.ease;
                                        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                        return SlideTransition(
                                            position: animation.drive(tween),
                                            child: child
                                        );
                                      }
                                  ));
                                },
                                child: Text('KW Research'),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) => HistoryChoice(),
                                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                        var begin = Offset(0.0, 1.0);
                                        var end = Offset.zero;
                                        var curve = Curves.ease;
                                        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                        return SlideTransition(
                                            position: animation.drive(tween),
                                            child: child
                                        );
                                      }
                                  ));
                                },
                                child: Text('Ad Performance'),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) => HistoryChoice(),
                                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                        var begin = Offset(0.0, 1.0);
                                        var end = Offset.zero;
                                        var curve = Curves.ease;
                                        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                        return SlideTransition(
                                            position: animation.drive(tween),
                                            child: child
                                        );
                                      }
                                  ));
                                },
                                child: Text('Ad Copy Changes'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    SizedBox(
                      width: size.width * 0.85,
                      height: size.height * 0.35,
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 36.0, left: 6.0, right: 6.0, bottom: 6.0),
                          child: ExpansionTile(
                            title: Text('History'),
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) => ChangeChoice(),
                                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                        var begin = Offset(0.0, 1.0);
                                        var end = Offset.zero;
                                        var curve = Curves.ease;
                                        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                        return SlideTransition(
                                            position: animation.drive(tween),
                                            child: child
                                        );
                                      }
                                  ));
                                },
                                child: Text('New Campaign'),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) => ChangeChoice(),
                                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                        var begin = Offset(0.0, 1.0);
                                        var end = Offset.zero;
                                        var curve = Curves.ease;
                                        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                        return SlideTransition(
                                            position: animation.drive(tween),
                                            child: child
                                        );
                                      }
                                  ));
                                },
                                child: Text('Existing Ad Settings'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    SizedBox(
                      width: size.width * 0.85,
                      height: size.height * 0.35,
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 36.0, left: 6.0, right: 6.0, bottom: 6.0),
                          child: ExpansionTile(
                            title: Text('History'),
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) => CustomChoice(),
                                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                        var begin = Offset(0.0, 1.0);
                                        var end = Offset.zero;
                                        var curve = Curves.ease;
                                        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                        return SlideTransition(
                                            position: animation.drive(tween),
                                            child: child
                                        );
                                      }
                                  ));
                                },
                                child: Text('Audit'),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) => CustomChoice(),
                                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                        var begin = Offset(0.0, 1.0);
                                        var end = Offset.zero;
                                        var curve = Curves.ease;
                                        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                        return SlideTransition(
                                            position: animation.drive(tween),
                                            child: child
                                        );
                                      }
                                  ));
                                },
                                child: Text('Detailed Report'),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) => CustomChoice(),
                                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                        var begin = Offset(0.0, 1.0);
                                        var end = Offset.zero;
                                        var curve = Curves.ease;
                                        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                        return SlideTransition(
                                            position: animation.drive(tween),
                                            child: child
                                        );
                                      }
                                  ));
                                },
                                child: Text('Others'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                  ]
              ),
            ),
          ),
        ]
    );

*/