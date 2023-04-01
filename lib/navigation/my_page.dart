import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyPage extends Page {
  final Widget page;
  final String pageName;

   MyPage({required this.page, required this.pageName})
      : super(name: pageName, key: ValueKey(pageName));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      builder: (context) => page,
      settings: this,
    );
  }
}
