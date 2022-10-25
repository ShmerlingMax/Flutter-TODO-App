import 'package:flutter/material.dart';

import 'state.dart';
import 'paths.dart';

class MyRouteInformationParser extends RouteInformationParser<NavigationState> {
  @override
  Future<NavigationState> parseRouteInformation(
    RouteInformation routeInformation,
  ) {
    final uri = Uri.parse(routeInformation.location ?? '');
    if (uri.pathSegments.isEmpty) {
      return Future.value(NavigationState.mainScreen());
    }
    if (uri.pathSegments.length == 1 &&
        uri.pathSegments[0] == Paths.taskScreen) {
      return Future.value(NavigationState.newTask());
    }
    return Future.value(NavigationState.mainScreen());
  }

  @override
  RouteInformation? restoreRouteInformation(NavigationState configuration) {
    if (configuration.isMainScreen) {
      return const RouteInformation(location: Paths.mainScreen);
    }
    if (configuration.taskIndex == null) {
      return const RouteInformation(location: "/${Paths.taskScreen}");
    }
    return RouteInformation(
      location: "/${Paths.taskScreen}/${configuration.taskIndex}",
    );
  }
}
