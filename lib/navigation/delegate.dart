import 'package:flutter/material.dart';
import 'package:todo/domain/injection.dart';
import 'package:todo/domain/services/firebase_service.dart';
import 'package:todo/ui/main_screen/main_screen.dart';
import 'package:todo/ui/task_screen/task_screen.dart';

import 'transition_delegate.dart';
import 'state.dart';

class MyRouterDelegate extends RouterDelegate<NavigationState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<NavigationState> {
  NavigationState state = NavigationState(true, null);

  bool get isMainScreen => state.isMainScreen;

  bool get isNewTask => !state.isMainScreen && state.taskIndex == null;

  bool get isOldTask => !state.isMainScreen && state.taskIndex != null;

  void gotoMainScreen() {
    state
      ..isMainScreen = true
      ..taskIndex = null;
    notifyListeners();
  }

  void gotoTask(int id) {
    state
      ..isMainScreen = false
      ..taskIndex = id;
    notifyListeners();
  }

  void gotoNewTask() {
    state
      ..isMainScreen = false
      ..taskIndex = null;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onPopPage: (route, result) => route.didPop(result),
      transitionDelegate: MyTransitionDelegate(),
      key: navigatorKey,
      observers: [locator<FirebaseService>().getAnalyticsObserver()],
      pages: [
        if (state.isMainScreen)
          const MaterialPage(
            child: MainScreen(),
          ),
        if (!state.isMainScreen)
          const MaterialPage(
            child: TaskScreen(),
          ),
        if (state.taskIndex != null)
          MaterialPage(
            child: TaskScreen(
              index: state.taskIndex,
            ),
          ),
      ],
    );
  }

  @override
  NavigationState? get currentConfiguration {
    return NavigationState(state.isMainScreen, state.taskIndex);
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey();

  @override
  Future<void> setNewRoutePath(NavigationState configuration) {
    state.taskIndex = configuration.taskIndex;
    state.isMainScreen = configuration.isMainScreen;
    return Future.value();
  }
}
