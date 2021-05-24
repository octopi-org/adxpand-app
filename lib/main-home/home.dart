import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:applify/login/login.dart';
import 'package:drawerbehavior/drawerbehavior.dart';
import 'package:applify/Menu/my-visualisations.dart';
import 'package:applify/Menu/Requests/my-requests.dart';
import 'file:///C:/Users/samue/OneDrive/Documents/GitHub/applify/changes/lib/Version%200.2/my-dashboard.dart';
import 'package:applify/Menu/Settings/settings.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  int selectedMenuItemId;
  final menu = new Menu(
    items: [
      new MenuItem(
        id: 0,
        title: ' MY DASHBOARD',
        icon: Icons.dashboard,
      ),
      new MenuItem(
        id: 1,
        title: ' MY VISUALISATIONS',
        icon: Icons.analytics,
      ),
      new MenuItem(
        id: 2,
        title: ' REQUESTS STATUS',
        icon: Icons.announcement,
      ),
      new MenuItem(
        id: 3,
        title: ' SETTINGS',
        icon: Icons.settings,
      ),
      new MenuItem(
        id: 4,
        title: ' LOGOUT',
        icon: Icons.exit_to_app,
      ),
    ]
  );

  @override
  void initState() {
    selectedMenuItemId = menu.items[0].id;
    super.initState();
  }

  Widget headerView(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(16, 12, 16, 0),
          child: Row(
            children: <Widget>[
              new Container(
                  width: 48.0,
                  height: 48.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/update-business-goals.png")))),
              Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "King Crab",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(color: Colors.white),
                      ),
                      Text(
                        "kingofcrabs@nus.edu",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(color: Colors.white.withAlpha(200)),
                      )
                    ],
                  ))
            ],
          ),
        ),
        Divider(
          color: Colors.white.withAlpha(200),
          height: 16,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      appBar: AppBar(
        title: Text('This is an appbar'),
      ),
      drawers: [
        SideDrawer(
            headerView: headerView(context),
            degree: 45,
            direction: Direction.right,
            percentage: 0.6,
            menu: menu,
            color: Colors.blue[300],
            selectedItemId: selectedMenuItemId,
            onMenuItemSelected: (itemId) {
              setState(() {
                selectedMenuItemId = itemId;
              });
              if (itemId == 4) {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
              }
            },
            itemBuilder: (BuildContext context, MenuItem menuItem,
                bool isSelected) {
              return Container(
                color: isSelected
                    ? Theme
                    .of(context)
                    .accentColor
                    .withOpacity(0.7)
                    : Colors.transparent,
                padding: EdgeInsets.fromLTRB(24, 16, 24, 16),
                child: Row(
                  children: <Widget>[
                    Icon(
                      menuItem.icon,
                      color: Colors.white,
                    ),
                    Text(
                      menuItem.title,
                      style: Theme
                          .of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(
                          color: isSelected ? Colors.black87 : Colors.white70),
                    ),
                  ]
                )
              );
            }
        ),
      ],
      builder: (context, id) {
        if (id == 0) {
          return Text('temp');
        } else if (id == 1) {
          return MyVisualisationsPage();
        } else if (id == 2) {
          return MyRequestsPage();
        } else if (id == 3) {
          return AppSettings();
        }
      },
    );
  }


  /*
  @override
  Widget build(BuildContext context) {
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
        body: TopThreeVis(),
    );
  }
  */
}




/*
A vanilla drawer

class NavDrawer extends StatelessWidget {
  final String user = 'King Crab';
  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
        drawers: [
          SideDrawer(
            degree: 45,
            direction: Direction.right,
            percentage: 0.6,
            itemBuilder: (BuildContext context, MenuItem menuItem, bool isSelected) {
              return Container(
                color: isSelected
                  ? Theme.of(context).accentColor.withOpacity(0.7)
                  : Colors.transparent,
                padding: EdgeInsets.fromLTRB(24, 16, 24, 16),
                child: Text(
                  menuItem.title,
                  style: Theme.of(context).textTheme.subhead?.copyWith(
                    color: isSelected ? Colors.black87 : Colors.white70),
                ),
              );
            }
          )
        ],
    );


    /*
    Drawer(
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
    */
  }
}
*/






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