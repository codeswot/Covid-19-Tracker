import 'package:covid_new_19/helpers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:covid_new_19/screens/register_screen.dart';
import 'package:covid_new_19/widgets/screensize.dart';
import 'package:provider/provider.dart';

/*
 * Login Route
 * */
class GetStartedRoute extends StatelessWidget {
  static const String id = 'GetStartedRoute';

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    AuthProvider authProvider = Provider.of(context);
    var appWidth = screenWidth(context);
    return Scaffold(
      /*drawer: NavDrawer(),
      appBar: AppBar(
          title: const Text('Getting Started', style: TextStyle(color: Colors.black)),
          iconTheme: new IconThemeData(color: Colors.black),
          // backgroundColor: Colors.white,
        ),*/
      body: Stack(
        children: [
          Positioned.fill(
            //
            child: Image(
              image: AssetImage('images/home-splash-01.png'),
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomCenter,
            ),
          ),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 60,
                  child: Text(
                    "COVID-19 DISTANCING",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                  bottom: 70,
                  left: 20,
                  right: 20,
                  child: Column(
                    children: [
                      Container(
                          child: Text("Keep distance, Stop Coronavirus",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold))),
                      Container(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        width: appWidth,
                        child: Text(
                          "Covid-19 distancing helps you avoid unsafe contact with "
                          "people through alerts outside the home",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Container(
                        width: 230,
                        padding: EdgeInsets.all(7),
                        child: FlatButton(
                          color: Colors.white,
                          textColor: Colors.green,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
                          padding: EdgeInsets.all(15.0),
                          splashColor: Colors.blueAccent,
                          onLongPress: () {},
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              RegisterRoute.id,
                            );
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: Text(
                            "Get Started",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
