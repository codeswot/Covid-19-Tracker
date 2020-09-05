import 'package:covid_new_19/screens/home_screen_test.dart';
import 'package:covid_new_19/screens/tabs/TabsPage.dart';
import 'package:covid_new_19/screens/forgetpswd_screen.dart';
import 'package:covid_new_19/screens/getstarted_screen.dart';
import 'package:covid_new_19/screens/log_in_screen.dart';
import 'package:covid_new_19/screens/splash_screen.dart';
import 'package:covid_new_19/screens/tabs/home.dart';
import 'package:flutter/material.dart';

import '../screens/register_screen.dart';

Map<String, WidgetBuilder> myAppRoutes = {
  SplashScreen.id: (context) => SplashScreen(),
  HomeScreen.id: (context) => HomeScreen(),
  GetStartedRoute.id: (context) => GetStartedRoute(),
  LoginRoute.id: (context) => LoginRoute(),
  RegisterRoute.id: (context) => RegisterRoute(),
  TabsPage.id: (context) => TabsPage(),
  ForegetRoute.id: (context) => ForegetRoute(),
};
