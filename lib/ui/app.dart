import 'package:todo/common/app_theme.dart';
import 'package:todo/common/resize.dart';
import 'package:todo/common/s.dart';
import 'package:todo/domain/bloc/main_screen/main_screen_bloc.dart';
import 'package:todo/domain/bloc/task_screen/task_screen_bloc.dart';
import 'package:todo/domain/injection.dart';
import 'package:todo/navigation/back_dispatcher.dart';
import 'package:todo/navigation/delegate.dart';
import 'package:todo/navigation/information_parser.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var _isDark = false;

  @override
  void initState() {
    super.initState();
    ShakeDetector.autoStart(
      onPhoneShake: () {
        setState(() {
          _isDark = !_isDark;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var resize = locator<Resize>();
    resize.init(MediaQueryData.fromWindow(WidgetsBinding.instance.window).size);
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              locator<MainScreenBloc>()..add(MainScreenSubscriptionRequested()),
        ),
        BlocProvider(create: (_) => locator<TaskScreenBloc>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: !kReleaseMode,
        onGenerateTitle: (context) => S.of(context).app_name,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: _isDark
            ? AppTheme.getDark(
                resize.iconScaleFactor,
                resize.floatingActionButtonScaleFactor,
                resize.textScaleFactor,
              )
            : AppTheme.getLight(
                resize.iconScaleFactor,
                resize.floatingActionButtonScaleFactor,
                resize.textScaleFactor,
              ),
        routerDelegate: locator<MyRouterDelegate>(),
        routeInformationParser: MyRouteInformationParser(),
        backButtonDispatcher: locator<MyBackButtonDispatcher>(),
      ),
    );
  }
}
