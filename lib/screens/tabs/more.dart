import 'package:covid_new_19/helpers/auth_provider.dart';
import 'package:covid_new_19/screens/getstarted_screen.dart';
import 'package:covid_new_19/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:covid_new_19/widgets/screensize.dart';
import 'package:provider/provider.dart';

class MorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appWidth = screenWidth(context);
    AuthProvider authProvider = Provider.of(context);

    double sizeFont = 14;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('MORE',
            style: TextStyle(
                color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold)),
        iconTheme: new IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Column(children: [
            GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      child: new AlertDialog(
                        title: new Text("Notifications"),
                        content: new Text("Setting set at default"),
                      ));
                },
                child: Container(
                    width: appWidth,
                    color: Colors.white,
                    padding: EdgeInsets.only(
                        left: 20, top: 10, right: 10, bottom: 10),
                    child: Row(children: [
                      Container(
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.notifications, color: Colors.grey)),
                      Container(
                          child: Text(
                        'Notifications',
                        style:
                            TextStyle(fontSize: sizeFont, color: Colors.grey),
                      ))
                    ]))),
            GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      child: new AlertDialog(
                        title: new Text("Donations"),
                        content: new Text("Payment Switch Loading ..."),
                      ));
                },
                child: Container(
                    width: appWidth,
                    padding: EdgeInsets.only(
                        left: 20, top: 10, right: 10, bottom: 10),
                    child: Row(children: [
                      Container(
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.payment, color: Colors.grey)),
                      Container(
                          child: Text(
                        'Donations',
                        style:
                            TextStyle(fontSize: sizeFont, color: Colors.grey),
                      ))
                    ]))),
            Container(
                width: appWidth,
                color: Colors.white,
                padding:
                    EdgeInsets.only(left: 20, top: 10, right: 10, bottom: 10),
                child: Row(children: [
                  Container(
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.language, color: Colors.grey)),
                  Container(
                      child: Text(
                    'Language',
                    style: TextStyle(fontSize: sizeFont, color: Colors.grey),
                  ))
                ])),
            GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      child: new AlertDialog(
                        title: new Text("About"),
                        content: new Text("Covid 19 App, Version 0.1"),
                      ));
                },
                child: Container(
                    width: appWidth,
                    padding: EdgeInsets.only(
                        left: 20, top: 10, right: 10, bottom: 10),
                    child: Row(children: [
                      Container(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.info,
                            color: Colors.grey,
                          )),
                      Container(
                          child: Text(
                        'About',
                        style:
                            TextStyle(fontSize: sizeFont, color: Colors.grey),
                      ))
                    ]))),
            Container(
                width: appWidth,
                color: Colors.white,
                padding:
                    EdgeInsets.only(left: 20, top: 10, right: 10, bottom: 10),
                child: Row(children: [
                  Container(
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.help, color: Colors.grey)),
                  Container(
                      child: Text(
                    'Support',
                    style: TextStyle(fontSize: sizeFont, color: Colors.grey),
                  ))
                ])),
            Container(
                width: appWidth,
                padding:
                    EdgeInsets.only(left: 20, top: 10, right: 10, bottom: 10),
                child: Row(children: [
                  Container(
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.share, color: Colors.grey)),
                  Container(
                      child: Text(
                    'Share',
                    style: TextStyle(fontSize: sizeFont, color: Colors.grey),
                  ))
                ])),
            GestureDetector(
              onTap: () {
                authProvider.signOut();
                Navigator.of(context).popAndPushNamed(RegisterRoute.id);
              },
              child: Container(
                  width: appWidth,
                  padding:
                      EdgeInsets.only(left: 20, top: 10, right: 10, bottom: 10),
                  child: Row(children: [
                    Container(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.exit_to_app, color: Colors.grey)),
                    Container(
                        child: Text(
                      'Log Out',
                      style: TextStyle(fontSize: sizeFont, color: Colors.grey),
                    ))
                  ])),
            ),
          ])
        ],
      ),
    );
  }
}
