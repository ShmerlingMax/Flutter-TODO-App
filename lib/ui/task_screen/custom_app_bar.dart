import 'package:todo/common/resize.dart';
import 'package:todo/common/s.dart';
import 'package:todo/domain/bloc/task_screen/task_screen_bloc.dart';
import 'package:todo/domain/injection.dart';
import 'package:todo/navigation/delegate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 50 * locator<Resize>().appBarScaleFactor,
      pinned: true,
      leading: IconButton(
        icon: const Icon(
          Icons.close,
        ),
        onPressed: () {
          locator<MyRouterDelegate>().gotoMainScreen();
        },
      ),
      actions: [
        TextButton(
          onPressed:
              context.watch<TaskScreenBloc>().state.currentTask.text.isEmpty
                  ? null
                  : () {
                      context.read<TaskScreenBloc>().add(TaskScreenSaved());
                      locator<MyRouterDelegate>().gotoMainScreen();
                    },
          style: Theme.of(context).textButtonTheme.style,
          child: Text(S.of(context).save),
        ),
      ],
    );
  }
}
