import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stack_card/flutter_stack_card.dart';
import 'package:applify/Version 0.2/requests-data.dart';

class Requests extends StatefulWidget {
  Requests({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RequestsState createState() => _RequestsState();
}

class _RequestsState extends State<Requests> with TickerProviderStateMixin {
  int _index;
  List<bool> _visibility;
  AnimationController _controllerOne;
  AnimationController _controllerTwo;
  Animation _animationOne;
  Animation _animationTwo;
  DragUpdateDetails updateDrag;

  @override
  void initState() {
    _index = 0;
    _visibility = [true, false, false];
    super.initState();
    _controllerOne = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _controllerTwo = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _animationOne = Tween<Offset>(begin: Offset.zero, end: Offset(0, -0.5)).animate(_controllerOne);
    _animationTwo = Tween<Offset>(begin: Offset.zero, end: Offset(0, -0.5)).animate(_controllerTwo);
  }

  @override
  void dispose() {
    super.dispose();
    _controllerOne.dispose();
    _controllerTwo.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height*0.9,
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
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[

              // Welcome back
              Container(
                padding: EdgeInsets.fromLTRB(24, 40, 15,0),
                width: size.width * 0.93,
                child: Text("Welcome back,", textAlign: TextAlign.left, style: TextStyle(fontSize: MediaQuery.of(context).size.width/30, color: Colors.white)),
              ),

              // Username
              Container(
                padding: EdgeInsets.fromLTRB(24, 0, 15,0),
                width: size.width * 0.93,
                alignment: Alignment.centerLeft,
                child: FittedBox(
                  fit:BoxFit.scaleDown,
                  child: Text('Lanterna', textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width/14, fontWeight: FontWeight.bold)),
                ),
              ),

              // Some bar
              SizedBox(
                height: size.height/9
              ),

              // Cards
              GestureDetector(
                onVerticalDragUpdate: (details) {
                  updateDrag = details;
                },
                onVerticalDragEnd: (details) {
                  if (updateDrag.delta.dy < 0 && _index < 2) {
                    setState(() {
                      _index += 1;
                      _visibility = [false, false, false];
                      _visibility[_index] = true;
                    });
                    if (_index == 1) {
                      _controllerOne.forward();
                    } else if (_index == 2) {
                      _controllerTwo.forward();
                    }
                    print(_visibility);
                  } else if (updateDrag.delta.dy > 0 && _index > 0) {
                    setState(() {
                      _index = _index - 1;
                      _visibility = [false, false, false];
                      _visibility[_index] = true;
                    });
                    if (_index == 1) {
                      _controllerTwo.reverse();
                    } else if (_index == 0) {
                      _controllerOne.reverse();
                    }
                    print(_visibility);
                  } else {
                    print(_visibility);
                  }
                },
                child: Stack(
                  children: <Widget>[

                    // History Card
                    SlideTransition(
                      position: _animationOne,
                      child: AnimatedOpacity(
                        opacity: _visibility[0] ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 200),
                        child: Container(
                          padding: EdgeInsets.all(25.0),
                          height: size.height*0.32,
                          width: size.width*0.93,
                          child: _mainCardBuilder(cardList[0])
                        )
                      )
                    ),

                    // Change Card
                    SlideTransition(
                        position: _animationTwo,
                        child: AnimatedOpacity(
                            opacity: _visibility[1] ? 1.0 : 0.0,
                            duration: Duration(milliseconds: 200),
                            child: Container(
                                padding: EdgeInsets.all(25.0),
                                height: size.height*0.32,
                                width: size.width*0.93,
                                child: _mainCardBuilder(cardList[1])
                            )
                        )
                    ),

                    // Custom Card
                    AnimatedOpacity(
                      opacity: _visibility[2] ? 1.0 : 0.0,
                      duration: Duration(milliseconds: 200),
                        child: Container(
                          padding: EdgeInsets.all(25.0),
                          height: size.height*0.32,
                          width: size.width*0.93,
                          child: _mainCardBuilder(cardList[2])
                        )
                    ),

                  ]
                )
              ),

              /*
              Container(
                padding: EdgeInsets.all(25.0),
                height: size.height*0.32,
                width: size.width*0.93,
                child: StackCard.builder(
                    displayIndicator: true,
                    displayIndicatorBuilder: IdicatorBuilder(displayIndicatorActiveColor: Colors.deepPurpleAccent),
                    itemBuilder: (context, index) {
                      CardData card = cardList[index];
                      return _mainCardBuilder(card);
                    },
                    itemCount: cardList.length,
                    onSwap: (index) {setState() {_index = index;}}
                )
              ),
              */

              // Sub-cards
              Container(
                padding: EdgeInsets.only(left: 5),
                height: size.height*0.25,
                width: size.width*0.93,
                child: _SubMenu()
              ),

            ]
          )
        )
      )
    );
  }

  Widget _SubMenu() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width/14
          ),
          GestureDetector(
            onTap: () => Navigator.push(context, PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => cardList[_index].menuItems[0].pageRoute,
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
            )),
            child: _subCardBuilder(cardList[_index].menuItems[0]),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width/22
          ),
          GestureDetector(
            onTap: () => Navigator.push(context, PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => cardList[_index].menuItems[1].pageRoute,
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
            )),
            child: _subCardBuilder(cardList[_index].menuItems[1]),
          ),
          if (_index != 1) SizedBox(
            width: MediaQuery.of(context).size.width/22
          ),
          if (_index != 1) GestureDetector(
            onTap: () => Navigator.push(context, PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => cardList[_index].menuItems[2].pageRoute,
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
            )),
            child: _subCardBuilder(cardList[_index].menuItems[2]),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width/14
          ),
        ]
      )
    );
  }

  Widget _mainCardBuilder(CardData card) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: Colors.white,
      ),
      height: 80,
      width: 100,
      child: Stack(
          children: <Widget>[
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      card.cardName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)
                    )
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                        top: 20,
                        bottom: 20,
                      ),
                      child: Container(
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            color: Color.fromRGBO(254, 180, 48, 1),
                          ),
                          child: Center(child: Text("Let's go", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16), textAlign: TextAlign.center))
                      )
                  )
                ]
            )
          ]
      )
    );
  }

  Widget _subCardBuilder(MenuItemData menuItem) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color.fromRGBO(55, 62, 72, 1),
      ),
      width: 120,
      height: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 80
          ),
          Padding(
            padding: EdgeInsets.only(top: 12, bottom: 6),
            child: Text('smaller', style: TextStyle(color: Colors.grey, fontSize: 12))
          ),
          Padding(
              padding: EdgeInsets.only(bottom: 2, left: 12, right: 12),
              child: Center(child: Text(menuItem.itemName, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center))
          ),
        ]
      )
    );
  }
}