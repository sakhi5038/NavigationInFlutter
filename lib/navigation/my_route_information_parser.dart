import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_nav_two_habibi/navigation/my_page_builder.dart';
import 'package:flutter_nav_two_habibi/screens/error_page.dart';

class MyRouteInformationParser extends RouteInformationParser<RouteSettings> {
  @override
  Future<RouteSettings> parseRouteInformation(
      RouteInformation routeInformation) {
    final routeSettings = RouteSettings(name: routeInformation.location);
    if (PageBuilder.isValidPage(routeSettings)) {
      return SynchronousFuture(routeSettings);
    }
    return SynchronousFuture(const RouteSettings(name: ErrorPage.pageName));
  }

  @override
  RouteInformation? restoreRouteInformation(RouteSettings configuration) {
    
    if (PageBuilder.isValidPage(configuration)) {
      return RouteInformation(location: configuration.name);
    }
    return const RouteInformation(location: ErrorPage.pageName);
  }
}
