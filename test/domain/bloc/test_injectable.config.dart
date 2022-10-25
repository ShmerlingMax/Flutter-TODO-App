// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logging/logging.dart' as _i12;
import 'package:todo/common/app_theme.dart' as _i3;
import 'package:todo/common/resize.dart' as _i15;
import 'package:todo/data/repository/i_api.dart' as _i6;
import 'package:todo/data/repository/i_local_storage.dart' as _i8;
import 'package:todo/data/repository/i_remote_storage.dart' as _i10;
import 'package:todo/data/repository/impl/api.dart' as _i7;
import 'package:todo/data/repository/impl/local_storage.dart' as _i9;
import 'package:todo/data/repository/impl/remote_storage.dart' as _i11;
import 'package:todo/data/storage.dart' as _i16;
import 'package:todo/domain/app_module.dart' as _i20;
import 'package:todo/domain/bloc/main_screen/main_screen_bloc.dart' as _i18;
import 'package:todo/domain/bloc/task_screen/task_screen_bloc.dart' as _i17;
import 'package:todo/domain/services/firebase_service.dart' as _i4;
import 'package:todo/domain/services/hive_service.dart' as _i5;
import 'package:todo/domain/services/remote_config_service.dart' as _i14;
import 'package:todo/navigation/back_dispatcher.dart' as _i19;
import 'package:todo/navigation/delegate.dart' as _i13;

import 'test_injectable.dart' as _i21;

const String _test = 'test';
const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  final mockAppModule = _$MockAppModule();
  await gh.factoryAsync<_i3.AppTheme>(() => appModule.appTheme,
      preResolve: true);
  gh.factory<_i4.FirebaseService>(() => mockAppModule.firebaseService,
      registerFor: {_test});
  await gh.lazySingletonAsync<_i4.FirebaseService>(
      () => appModule.firebaseService,
      registerFor: {_prod},
      preResolve: true);
  await gh.factoryAsync<_i5.HiveService>(() => appModule.hiveService,
      preResolve: true);
  gh.factory<_i6.IApi>(() => _i7.Api());
  gh.factory<_i8.ILocalStorage>(() => _i9.LocalStorage());
  gh.factory<_i10.IRemoteStorage>(() => _i11.RemoteStorage(get<_i6.IApi>()));
  gh.singleton<_i12.Logger>(appModule.logger);
  gh.singleton<_i13.MyRouterDelegate>(appModule.myRouterDelegate);
  gh.factory<_i14.RemoteConfigService>(() => mockAppModule.remoteConfigService,
      registerFor: {_test});
  await gh.factoryAsync<_i14.RemoteConfigService>(
      () => appModule.remoteConfigService,
      registerFor: {_prod},
      preResolve: true);
  gh.singleton<_i15.Resize>(appModule.resize);
  gh.singleton<_i16.Storage>(
      _i16.Storage(get<_i8.ILocalStorage>(), get<_i10.IRemoteStorage>()));
  gh.factory<_i17.TaskScreenBloc>(
      () => _i17.TaskScreenBloc(get<_i16.Storage>()));
  gh.factory<_i18.MainScreenBloc>(
      () => _i18.MainScreenBloc(get<_i16.Storage>()));
  gh.singleton<_i19.MyBackButtonDispatcher>(
      _i19.MyBackButtonDispatcher(get<_i13.MyRouterDelegate>()));
  return get;
}

class _$AppModule extends _i20.AppModule {}

class _$MockAppModule extends _i21.MockAppModule {}
