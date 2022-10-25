import 'package:todo/domain/injection.dart';
import 'package:todo/domain/services/firebase_service.dart';
import 'package:todo/domain/services/remote_config_service.dart';
import 'package:mocktail/mocktail.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_analytics/observer.dart';

import 'test_injectable.config.dart';

class MockFirebaseAnalyticsObserver extends Mock
    implements FirebaseAnalyticsObserver {}

class MockFirebaseService extends Mock implements FirebaseService {
  @override
  Future<void> logAddEvent() async {}
  @override
  Future<void> logDoneEvent() async {}
  @override
  Future<void> logDeleteEvent() async {}
  @override
  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      MockFirebaseAnalyticsObserver();
}

class MockRemoteConfigService extends Mock implements RemoteConfigService {}

@InjectableInit(generateForDir: ['lib', 'test'])
Future<void> configureDependencies() =>
    $initGetIt(locator, environment: Environment.test);

@module
abstract class MockAppModule {
  @test
  @injectable
  FirebaseService get firebaseService => MockFirebaseService();

  @test
  @injectable
  RemoteConfigService get remoteConfigService => MockRemoteConfigService();
}
