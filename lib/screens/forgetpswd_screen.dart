import 'package:covid_new_19/screens/tabs/TabsPage.dart';
import 'package:flutter/material.dart';
import 'package:covid_new_19/widgets/screensize.dart';

/*
 * Login Route
 * */
class ForegetRoute extends StatelessWidget {
  static const String id = 'ForegetRoute';

  @override
  Widget build(BuildContext context) {
    var AppWidth = screenWidth(context);

    return Scaffold(
      /*drawer: NavDrawer(),*/
      appBar: AppBar(
        title: const Text('', style: TextStyle(color: Colors.black)),
        iconTheme: new IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Container(
            //logo_image
            margin: new EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/reset-account.png'),
                    fit: BoxFit.contain,
                    alignment: Alignment.topCenter)),
          ),
          Container(
            child: Stack(children: [
              Positioned(
                  bottom: 120,
                  left: 20,
                  right: 20,
                  child: Column(
                    children: <Widget>[
                      /*-- Create Account --*/
                      Container(
                          padding: EdgeInsets.only(bottom: 5),
                          width: AppWidth,
                          child: Text(
                            "Forgot Password ",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 27,
                                fontWeight: FontWeight.bold),
                          )),
                      /*-- Sign up text --*/
                      Container(
                          margin: EdgeInsets.only(bottom: 30),
                          width: AppWidth,
                          child: Text(
                            "Enter the email address attached to your account",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w300),
                          )),
                      /*-- Email Input --*/
                      Container(
                          width: AppWidth,
                          margin: EdgeInsets.only(bottom: 20),
                          child: TextField(
                              autocorrect: true,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 7),
                                hintText: 'Email address.',
                                prefixIcon: Icon(Icons.email),
                                hintStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: Colors.white70,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)),
                                  borderSide:
                                      BorderSide(color: Colors.black, width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)),
                                  borderSide:
                                      BorderSide(color: Colors.green, width: 1),
                                ),
                              ))),
                      /*-- Login Button--*/
                      Container(
                          width: AppWidth,
                          padding: EdgeInsets.only(top: 2, bottom: 2),
                          child: FlatButton(
                            color: Color(0xff111EE3),
                            textColor: Colors.white,
                            disabledColor: Colors.grey,
                            disabledTextColor: Colors.black,
                            padding: EdgeInsets.all(15.0),
                            splashColor: Colors.blueAccent,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TabsPage()),
                              );
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            child: Stack(children: [
                              Align(
                                  child: Text(
                                "Reset",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 17.0),
                              ))
                            ]),
                          ))
                    ],
                  ))
            ]),
          )
        ],
      ),
    );
  }
}
