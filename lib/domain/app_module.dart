import 'package:todo/common/app_theme.dart';
import 'package:todo/common/resize.dart';
import 'package:todo/domain/services/firebase_service.dart';
import 'package:todo/domain/services/hive_service.dart';
import 'package:todo/domain/services/logger_service.dart';
import 'package:todo/domain/services/remote_config_service.dart';
import 'package:todo/navigation/delegate.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

@module
abstract class AppModule {
  @prod
  @lazySingleton
  @preResolve
  Future<FirebaseService> get firebaseService => FirebaseService.init();

  @preResolve
  Future<HiveService> get hiveService => HiveService.init();

  @prod
  @preResolve
  Future<RemoteConfigService> get remoteConfigService =>
      RemoteConfigService.init();

  @preResolve
  Future<AppTheme> get appTheme => AppTheme.init();

  @singleton
  MyRouterDelegate get myRouterDelegate => MyRouterDelegate();

  @singleton
  Logger get logger => LoggerService.init();

  @singleton
  Resize get resize => Resize();
}
