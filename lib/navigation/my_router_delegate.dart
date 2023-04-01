import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_nav_two_habibi/navigation/my_page_builder.dart';
import 'package:flutter_nav_two_habibi/screens/error_page.dart';
import 'package:flutter_nav_two_habibi/screens/my_home_page.dart';

class MyRouterDelegate extends RouterDelegate<RouteSettings>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final _stack = <RouteSettings>[
    const RouteSettings(name: MyHomePage.pageName)
  ];

  static MyRouterDelegate of(BuildContext context) {
    final delegate = Router.of(context).routerDelegate;
    assert(delegate is MyRouterDelegate,
        'Router Delegate Must be MyRouterDelegate but it found ${delegate.runtimeType}');
    return delegate as MyRouterDelegate;
  }

  pop() {
    if (_stack.isNotEmpty) {
      _stack.remove(_stack.last);
      notifyListeners();
    }
  }

  push(RouteSettings settings) {
    _stack.add(settings);
    notifyListeners();
  }

  @override
  RouteSettings? get currentConfiguration => _stack.isNotEmpty
      ? _stack.last
      : const RouteSettings(name: ErrorPage.pageName);
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: onPopPage,
      pages: [
        for (final routeSettings in _stack) PageBuilder.build(routeSettings)
      ],
    );
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(RouteSettings configuration) {

    _stack
      ..clear()
      ..add(configuration);
    return SynchronousFuture<void>(null);
  }

  @override
  Future<void> setInitialRoutePath(RouteSettings configuration) {
    return setNewRoutePath(configuration);
  }

  bool onPopPage(Route route, result) {
    if (_stack.isNotEmpty) {
      if (_stack.last.name == route.settings.name) {
        _stack.remove(_stack.last);
      }
    } else {
      _stack.add(const RouteSettings(name: MyHomePage.pageName));
    }
    return route.didPop(result);
  }
}
