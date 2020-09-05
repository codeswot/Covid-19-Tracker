import 'package:covid_new_19/helpers/auth_provider.dart';
import 'package:covid_new_19/screens/tabs/TabsPage.dart';
import 'package:covid_new_19/screens/tabs/home.dart';
import 'package:covid_new_19/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import 'getstarted_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'SplashScreen';
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

LocationServices locationServices = LocationServices();
callLocation() {
  locationServices.getPosition();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    callLocation();
    super.initState();
    Future.delayed(
      Duration(seconds: 4),
      () {
        AuthProvider authProvider = Provider.of(context);
        if (authProvider.isAuthenticated) {
          Navigator.of(context).popAndPushNamed(TabsPage.id);
        } else {
          Navigator.of(context).popAndPushNamed(
            GetStartedRoute.id,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
          title: Text('TalkPlus +'),
        ),*/
      body: Stack(
        children: [
          Positioned(
            top: 190,
            left: 0,
            right: 0,
            child: Image.asset('images/logo-03.png'),
          ),
        ],
      ),
    );
  }
}
