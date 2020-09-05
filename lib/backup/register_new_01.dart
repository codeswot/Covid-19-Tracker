import 'package:flutter/material.dart';
import 'package:covid_new_19/widgets/screensize.dart';
import 'package:covid_new_19/backup/login_new_01.dart';

/*
 * Login Route
 * */
class RegisterRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var AppWidth = screenWidth(context);

    return Scaffold(
        backgroundColor: Colors.white,
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
                padding: new EdgeInsets.only(left: 20, right: 40),
                child: Column(
                  children: [
                    /*Container( //logo_image
            padding : EdgeInsets.only(bottom:10),
            child : Image.asset(
                'images/logo-04.png',
                 height: 175,
            ),
          ), */
                    Container(
                        margin: EdgeInsets.only(top: 80),
                        padding: EdgeInsets.only(bottom: 5),
                        width: AppWidth,
                        child: Text(
                          "Welcome",
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
                          "Please log In to continue",
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
                              contentPadding: EdgeInsets.symmetric(vertical: 7),
                              hintText: 'Enter Your Email Here...',
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
                    /*-- Password Input --*/
                    Container(
                        width: AppWidth,
                        child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 7),
                              hintText: 'Password',
                              prefixIcon: Icon(Icons.lock),
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
                    /*-- Forgot Password --*/
                    Container(
                        margin: EdgeInsets.only(top: 10, bottom: 20),
                        width: AppWidth,
                        child: GestureDetector(
                          child: Text(
                            "Forgot Password ?",
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 15),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginRoute()),
                            );
                          },
                        )),
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
                                  builder: (context) => LoginRoute()),
                            );
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: Stack(children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Log In",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 17.0),
                                )),
                            Align(
                                alignment: Alignment.centerRight,
                                child: Icon(Icons.arrow_forward))
                          ]),
                        )),
                    /*-- Create account --*/
                    Container(
                        margin: EdgeInsets.only(top: 10, bottom: 20),
                        width: AppWidth,
                        child: GestureDetector(
                          child: Text(
                            "Don't have an account ? Create one",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginRoute()),
                            );
                          },
                        ))
                  ],
                ))
          ],
        ));
  }
}
