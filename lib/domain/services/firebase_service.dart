import 'package:todo/common/constants.dart';
import 'package:todo/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';

class FirebaseService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  static Future<FirebaseService> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    return FirebaseService();
  }

  Future<void> logAddEvent() async {
    await _analytics.logEvent(
      name: Event.add.textName,
      parameters: {'time': DateTime.now().millisecondsSinceEpoch},
    );
  }

  Future<void> logDeleteEvent() async {
    await _analytics.logEvent(
      name: Event.delete.textName,
      parameters: {'time': DateTime.now().millisecondsSinceEpoch},
    );
  }

  Future<void> logDoneEvent() async {
    await _analytics.logEvent(
      name: Event.done.textName,
      parameters: {'time': DateTime.now().millisecondsSinceEpoch},
    );
  }

  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);
}
