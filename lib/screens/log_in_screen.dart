import 'package:covid_new_19/helpers/auth_provider.dart';
import 'package:covid_new_19/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:covid_new_19/widgets/screensize.dart';
import 'package:covid_new_19/screens/tabs/TabsPage.dart';
import 'package:covid_new_19/screens/forgetpswd_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

/*
 * Login Route
 * */
class LoginRoute extends StatefulWidget {
  static const String id = 'LoginRoute';

  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool mySpinner = false;
    var appWidth = screenWidth(context);
    AuthProvider authProvider = Provider.of(context);

    return ModalProgressHUD(
      inAsyncCall: mySpinner,
      child: Scaffold(
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
                          width: appWidth,
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
                          width: appWidth,
                          child: Text(
                            "Please log In to continue",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w300),
                          )),
                      /*-- Email Input --*/
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                                width: appWidth,
                                margin: EdgeInsets.only(bottom: 20),
                                child: TextFormField(
                                    controller: _emailController,
                                    autocorrect: true,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 7),
                                      hintText: 'Enter Your Email Here...',
                                      prefixIcon: Icon(Icons.email),
                                      hintStyle: TextStyle(color: Colors.grey),
                                      filled: true,
                                      fillColor: Colors.white70,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7)),
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 1),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7)),
                                        borderSide: BorderSide(
                                            color: Colors.green, width: 1),
                                      ),
                                    ))),
                            /*-- Password Input --*/
                            Container(
                                width: appWidth,
                                child: TextFormField(
                                    controller: _passwordController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 7),
                                      hintText: 'Password',
                                      prefixIcon: Icon(Icons.lock),
                                      hintStyle: TextStyle(color: Colors.grey),
                                      filled: true,
                                      fillColor: Colors.white70,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7)),
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 1),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7)),
                                        borderSide: BorderSide(
                                            color: Colors.green, width: 1),
                                      ),
                                    ))),
                          ],
                        ),
                      ),
                      /*-- Forgot Password --*/
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(ForegetRoute.id);
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10, bottom: 20),
                          width: appWidth,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "Forgot Password ?",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(fontSize: 15),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      /*-- Login Button--*/
                      Container(
                        width: appWidth,
                        padding: EdgeInsets.only(top: 2, bottom: 2),
                        child: FlatButton(
                          color: Color(0xff111EE3),
                          textColor: Colors.white,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
                          padding: EdgeInsets.all(15.0),
                          splashColor: Colors.blueAccent,
                          onPressed: () async {
                            setState(() {
                              mySpinner = true;
                            });
                            try {
                              final registerdUser =
                                  authProvider.signInWithEmail(
                                      email: _emailController.text,
                                      password: _passwordController.text);
                              if (registerdUser != null) {
                                Navigator.of(context).pushNamed(TabsPage.id);
                              }
                              setState(() {
                                mySpinner = false;
                              });
                            } catch (err) {
                              String exception = getExceptionText(err);
                              print(exception);
                              throw ('this $err');
                            }
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: Stack(
                            children: [
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
                            ],
                          ),
                        ),
                      ),
                      /*-- Create account --*/
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        width: appWidth,
                        child: GestureDetector(
                          child: Text(
                            "Don't have an account ? Create one",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                          ),
                          onTap: () {
                            Navigator.of(context).popAndPushNamed(
                              RegisterRoute.id,
                            );
                          },
                        ),
                      )
                    ],
                  ))
            ],
          )),
    );
  }
}
