import 'dart:async';

import 'package:todo/ui/app.dart';
import 'package:flutter/material.dart';

import '../test/domain/bloc/test_injectable.dart';

void main() {
  runZonedGuarded<Future<void>>(
    () async {
      await configureDependencies();
      runApp(const App());
    },
    (error, stack) => {},
  );
}
