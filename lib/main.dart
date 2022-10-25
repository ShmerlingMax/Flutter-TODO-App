import 'dart:async';

import 'package:todo/domain/injection.dart';
import 'package:flutter/material.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'ui/app.dart';

void main() {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await configureDependencies();
      runApp(const App());
    },
    (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack),
  );
}
