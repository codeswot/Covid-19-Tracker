import 'package:flutter/material.dart';
import 'package:covid_new_19/widgets/screensize.dart';
import 'package:icon_shadow/icon_shadow.dart';

class HomeRoute extends StatefulWidget {
  HomeRoute({Key key}) : super(key: key);

  @override
  _HomeRouteState createState() => _HomeRouteState();
}

/*
 * Home Route
 * */
class _HomeRouteState extends State<HomeRoute> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, color: Colors.green, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Center(
        child: Text(
      'Statistics',
      style: optionStyle,
    )),
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'More',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var appWidth = screenWidth(context);

    return Scaffold(
      /*drawer: NavDrawer(),*/
      appBar: AppBar(
        centerTitle: true,
        title: const Text('COVID-19 DISTANCING',
            style: TextStyle(
                color: Color(0xff0DA766),
                fontSize: 15,
                fontWeight: FontWeight.bold)),
        iconTheme: new IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          _widgetOptions.elementAt(_selectedIndex),
          Positioned(
            bottom: 0,
            child: Container(
                width: appWidth,
                padding:
                    EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
                color: Color(0xff0DA766),
                child: Row(children: [
                  Container(
                      // color : Colors.orange,
                      padding: EdgeInsets.only(right: 5),
                      child: IconShadowWidget(
                        Icon(
                          Icons.notifications_none,
                          color: Colors.white,
                        ),
                        shadowColor: Colors.black,
                      )),
                  Container(
                      // color : Colors.blue,
                      child: Column(
                    children: <Widget>[
                      Container(
                          width: 230,
                          // color : Colors.red,
                          child: Text(
                            "Social Distance Alert is ON!",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                      Container(
                          width: 230,
                          // color: Colors.blue,
                          child: Text(
                            "Switch off alert when indoors",
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.w200),
                          ))
                    ],
                  )),
                  Spacer(),
                  Container(
                      // color: Colors.grey,
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Switch(
                            value: true,
                            activeTrackColor: Colors.lightGreenAccent,
                            activeColor: Colors.green,
                            onChanged: (bool value) {},
                          )))
                ])),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.subject),
            title: Text('Statistics'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            title: Text('More'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}
