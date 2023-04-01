import 'package:flutter/material.dart';
import 'package:flutter_nav_two_habibi/navigation/my_router_delegate.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  static const pageName = '/second';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Page')),
      body: const Center(
        child: Text('Second Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          MyRouterDelegate.of(context).pop();
        },
        child: const Icon(Icons.close),
      ),
    );
  }
}
