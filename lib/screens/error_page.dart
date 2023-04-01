import 'package:flutter/material.dart';
import 'package:flutter_nav_two_habibi/navigation/my_router_delegate.dart';
import 'package:flutter_nav_two_habibi/screens/my_home_page.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});
  static const pageName = '/errorPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error Page')),
      body: Center(
        child:
            Container(color: Colors.red, child: const Text('Error Page 404')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          MyRouterDelegate.of(context)
              .push(const RouteSettings(name: MyHomePage.pageName));
        },
        child: const Icon(Icons.home),
      ),
    );
  }
}
