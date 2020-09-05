import 'package:covid_new_19/screens/home_screen_test.dart';
import 'package:flutter/material.dart';
import 'package:covid_new_19/screens/tabs/statistics.dart';
import 'package:covid_new_19/screens/tabs/more.dart';

class TabNavigationItem {
  final Widget page;
  final Widget title;
  final Icon icon;

  TabNavigationItem({
    @required this.page,
    @required this.title,
    @required this.icon,
  });

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: HomeScreen(),
          icon: Icon(Icons.home),
          title: Text("Home"),
        ),
        TabNavigationItem(
          page: StatisticsPage(),
          icon: Icon(Icons.subject),
          title: Text("Statistics"),
        ),
        TabNavigationItem(
          page: MorePage(),
          icon: Icon(Icons.apps),
          title: Text("More"),
        ),
      ];
}
