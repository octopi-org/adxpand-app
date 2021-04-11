import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:applify/login/login.dart';
import 'package:applify/my-visualisations.dart';
import 'package:applify/my-requests.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Container(
              alignment: Alignment.center,
              child: Text("I don't think so")
          ),
          /*
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.menu
                )
              )
            )
          ]
          */
        ),
        endDrawer: NavDrawer(),
        body: Text('this screen is where the top 3 metric visualisations will go')
    );
  }
}


class NavDrawer extends StatelessWidget {
  final String user = 'King Crab';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Welcome, $user',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/company-logo.png'))),
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.analytics),
            title: Text('Visualisation'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return MyVisualisationsPage();
                })
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.announcement),
            title: Text('Requests Status'),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return MyRequestsPage();
                  })
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            /*
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Settings();
                  })
              )
            },
            */
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Login();
                  })
              )
            },
          ),
        ],
      )
    );
  }
}



/*

class Menu extends StatefulWidget {
  Menu({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SlideTransition(
      position: _animation,
      child: Stack(
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
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return RecentChangesPage();
                                  })
                              );
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(size.width * 0.10)
                              ),
                              color: Colors.deepPurpleAccent,
                              elevation: 10,
                              child: FittedBox(
                                child: Image.asset('assets/recent-changes.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      SizedBox(
                          width: size.width * 0.85,
                          height: size.height * 0.35,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return MyVisualisationsPage();
                                  })
                              );
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(size.width * 0.10)
                              ),
                              color: Colors.deepPurpleAccent,
                              elevation: 10,
                              child: FittedBox(
                                child: Image.asset('assets/my-visualisations.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      SizedBox(
                          width: size.width * 0.85,
                          height: size.height * 0.35,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return RaiseRequestsPage();
                                  })
                              );
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(size.width * 0.10)
                              ),
                              color: Colors.deepPurpleAccent,
                              elevation: 10,
                              child: FittedBox(
                                child: Image.asset('assets/raise-requests.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      SizedBox(
                          width: size.width * 0.85,
                          height: size.height * 0.35,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return UpdateBusinessGoalsPage();
                                  })
                              );
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(size.width * 0.10)
                              ),
                              color: Colors.deepPurpleAccent,
                              elevation: 10,
                              child: FittedBox(
                                child: Image.asset('assets/update-business-goals.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      SizedBox(
                          width: size.width * 0.85,
                          height: size.height * 0.35,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return AuditRequestPage();
                                  })
                              );
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(size.width * 0.10)
                              ),
                              color: Colors.deepPurpleAccent,
                              elevation: 10,
                              child: FittedBox(
                                child: Image.asset('assets/audit-request.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      SizedBox(
                          width: size.width * 0.85,
                          height: size.height * 0.35,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return DownloadDetailedReportPage();
                                  })
                              );
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(size.width * 0.10)
                              ),
                              color: Colors.deepPurpleAccent,
                              elevation: 10,
                              child: FittedBox(
                                child: Image.asset('assets/download-detailed-report.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      SizedBox(
                          width: size.width * 0.85,
                          height: size.height * 0.35,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return AdChangeHistoryPage();
                                  })
                              );
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(size.width * 0.10)
                              ),
                              color: Colors.deepPurpleAccent,
                              elevation: 10,
                              child: FittedBox(
                                child: Image.asset('assets/ad-change-history.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                    ]
                ),
              ),
            ),
          ]
      )
    );
  }
}

*/