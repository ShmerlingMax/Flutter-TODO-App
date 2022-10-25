import 'package:flutter/widgets.dart';
import 'package:todo/navigation/delegate.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class MyBackButtonDispatcher extends RootBackButtonDispatcher {
  final MyRouterDelegate _routerDelegate;

  MyBackButtonDispatcher(this._routerDelegate) : super();

  @override
  Future<bool> didPopRoute() {
    if (_routerDelegate.isMainScreen) {
      return Future.value(false);
    }
    _routerDelegate.gotoMainScreen();
    return Future.value(true);
  }
}
