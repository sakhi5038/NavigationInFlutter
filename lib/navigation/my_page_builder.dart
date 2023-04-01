import 'package:flutter/widgets.dart';
import 'package:flutter_nav_two_habibi/main.dart';
import 'package:flutter_nav_two_habibi/navigation/my_page.dart';
import 'package:flutter_nav_two_habibi/screens/my_home_page.dart';
import 'package:flutter_nav_two_habibi/screens/second_page.dart';

import '../screens/error_page.dart';

class PageBuilder {
  static Page build(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case MyHomePage.pageName:
        return MyPage(
            page: const MyHomePage(title: 'Pakistan'),
            pageName: MyHomePage.pageName);
      case SecondPage.pageName:
        return MyPage(page: const SecondPage(), pageName: SecondPage.pageName);
      default:
        return MyPage(page: const ErrorPage(), pageName: ErrorPage.pageName);
    }
  }

  static bool isValidPage(RouteSettings routeSettings) {
    return routeSettings.name == MyHomePage.pageName ||
        routeSettings.name == SecondPage.pageName;
  }
}
