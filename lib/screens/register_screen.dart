import 'package:covid_new_19/helpers/auth_provider.dart';
import 'package:covid_new_19/screens/log_in_screen.dart';
import 'package:covid_new_19/screens/tabs/TabsPage.dart';
import 'package:covid_new_19/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:covid_new_19/widgets/screensize.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

/*
 * Login Route
 * */
class RegisterRoute extends StatefulWidget {
  static const String id = 'RegisterRoute';

  @override
  _RegisterRouteState createState() => _RegisterRouteState();
}

class _RegisterRouteState extends State<RegisterRoute> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  LocationServices locationService = LocationServices();
  call() {
    locationService.showCheck();
  }

  @override
  Widget build(BuildContext context) {
    bool mySpiner = false;

    var appWidth = screenWidth(context);
    AuthProvider authProvider = Provider.of(context);

    return ModalProgressHUD(
      inAsyncCall: mySpiner,
      child: Scaffold(
        /*drawer: NavDrawer(),*/
        appBar: AppBar(
          iconTheme: new IconThemeData(color: Colors.black),
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: Stack(
          children: [
            Container(
              //logo_image
              // margin: new EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/create-account.png'),
                    fit: BoxFit.contain,
                    alignment: Alignment.topCenter),
              ),
            ),
            Container(
              child: Stack(
                children: [
                  Positioned(
                    bottom: 30,
                    left: 20,
                    right: 20,
                    child: Column(
                      children: <Widget>[
                        /*-- Create Account --*/
                        Container(
                          padding: EdgeInsets.only(bottom: 5),
                          width: appWidth,
                          child: Text(
                            "Create Account",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 27,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        /*-- Sign up text --*/
                        Container(
                            margin: EdgeInsets.only(bottom: 30),
                            width: appWidth,
                            child: Text(
                              "Sign up with email address",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 15),
                            )),
                        /*-- Email Input --*/
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                width: appWidth,
                                margin: EdgeInsets.only(bottom: 20),
                                child: TextField(
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.emailAddress,
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
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(7)),
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(7)),
                                      borderSide: BorderSide(
                                          color: Colors.green, width: 1),
                                    ),
                                  ),
                                ),
                              ),
                              /*-- Password Input --*/
                              Container(
                                width: appWidth,
                                child: TextField(
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
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(7)),
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(7),
                                      ),
                                      borderSide: BorderSide(
                                        color: Colors.green,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
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
                              call();

                              locationService.showCheck();

                              setState(() {
                                mySpiner = true;
                              });
                              final loggedInUser =
                                  await authProvider.signUpWithEmail(
                                email: _emailController.text,
                                password: _passwordController.text,
                              );
                              // Navigator.of(context).pushNamed(TabsPage.id);

                              if (loggedInUser != null) {
                                Navigator.of(context).pushNamed(TabsPage.id);
                              }
                              setState(() {
                                mySpiner = false;
                              });
                              print('my user is ${loggedInUser.email} 1');
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Sign Up",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 17.0),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(Icons.arrow_forward),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20, bottom: 20),
                          width: appWidth,
                          child: GestureDetector(
                            child: Text(
                              "Have an account ? Log in",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 15),
                            ),
                            onTap: () {
                              Navigator.of(context).popAndPushNamed(
                                LoginRoute.id,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
