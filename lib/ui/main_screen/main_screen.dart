import 'package:todo/common/resize.dart';
import 'package:todo/domain/injection.dart';
import 'package:todo/navigation/delegate.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'custom_app_bar.dart';
import 'to_do_list.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      Theme.of(context).appBarTheme.systemOverlayStyle!,
    );
    var resize = locator<Resize>();
    final MediaQueryData data = MediaQuery.of(context);
    return MediaQuery(
      data: data.copyWith(textScaleFactor: locator<Resize>().textScaleFactor),
      child: SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          onPanDown: (_) => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            floatingActionButton: Visibility(
              visible: WidgetsBinding.instance.window.viewInsets.bottom <= 0.0,
              child: FloatingActionButton(
                onPressed: () => locator<MyRouterDelegate>().gotoNewTask(),
                child: const Icon(Icons.add),
              ),
            ),
            body: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  pinned: true,
                  automaticallyImplyLeading: false,
                  collapsedHeight: 76 * resize.appBarScaleFactor,
                  expandedHeight: 140 * resize.appBarScaleFactor,
                  flexibleSpace: const CustomAppBar(),
                ),
                const ToDoList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
