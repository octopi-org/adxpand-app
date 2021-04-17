import 'package:flutter/material.dart';
import 'package:applify/Menu/Requests/menu-functions.dart';
import "package:flare_flutter/flare_actor.dart" as flare;

class MenuSection extends StatefulWidget {
  final String title;
  final Color backgroundColor;
  final Color accentColor;
  final List<MenuItemData> menuOptions;
  final AssetImage assetImage;

  MenuSection(this.title, this.backgroundColor, this.accentColor, this.menuOptions, this.assetImage);

  @override
  _MenuSectionState createState() => _MenuSectionState();
}

class _MenuSectionState extends State<MenuSection> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  static final Animatable<double> _sizeTween = Tween<double>(
    begin: 0.0,
    end: 1.0,
  );
  Animation<double> _sizeAnimation;
  bool _isExpanded = false;

  @override
  initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    final CurvedAnimation curve = CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
    _sizeAnimation = _sizeTween.animate(curve);
    _controller.addListener(() {
      setState(() {});
    });
  }

  _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
    switch (_sizeAnimation.status) {
      case AnimationStatus.completed:
        _controller.reverse();
        break;
      case AnimationStatus.dismissed:
        _controller.forward();
        break;
      case AnimationStatus.reverse:
      case AnimationStatus.forward:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _toggleExpand,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: widget.backgroundColor,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    left: 0,
                    right: 0,
                    child: Container(
                        decoration: new BoxDecoration(image: new DecorationImage(image: widget.assetImage, fit: BoxFit.fill))
                    ),
                  ),
                  Column(
                      children: <Widget>[
                        Container(
                          height: 150.0,
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 21.0,
                                width: 21.0,
                                margin: EdgeInsets.all(18.0),
                                child: flare.FlareActor(
                                  'assets/ExpandCollapse.flr',
                                  color: widget.accentColor,
                                  animation: _isExpanded ? 'Collapse' : 'Expand'
                                ),
                              ),
                              Text(
                                widget.title,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: widget.accentColor
                                ),
                              ),
                            ]
                          )
                        ),
                        SizeTransition(
                          axisAlignment: 0.0,
                          axis: Axis.vertical,
                          sizeFactor: _sizeAnimation,
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.only(left: 56.0, right: 20.0, top: 10.0),
                              child: Column(
                                children: widget.menuOptions.map((item) {
                                  return GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () => Navigator.push(context, PageRouteBuilder(
                                        pageBuilder: (context, animation, secondaryAnimation) => item.pageRoute,
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
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(
                                              bottom: 20.0
                                            ),
                                            child: Text(
                                              item.itemName,
                                              style: TextStyle(
                                                color: widget.accentColor,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                              )
                                            )
                                          )
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: widget.accentColor,
                                          )
                                        )
                                      ]
                                    )
                                  );
                                }).toList()
                              )
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
}