import 'package:todo/common/app_theme.dart';
import 'package:todo/common/s.dart';
import 'package:todo/domain/bloc/task_screen/task_screen_bloc.dart';
import 'package:todo/domain/injection.dart';
import 'package:todo/navigation/delegate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeleteButton extends StatelessWidget {
  final bool disable;
  const DeleteButton({required this.disable, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color buttonColor =
        disable ? Theme.of(context).disabledColor : AppTheme.customRed;
    return Row(
      children: [
        TextButton.icon(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            alignment: Alignment.topLeft,
            foregroundColor: MaterialStateProperty.all(buttonColor),
            textStyle: MaterialStateProperty.all(
              Theme.of(context).textTheme.bodyText1,
            ),
          ),
          icon: const Icon(Icons.delete),
          label: Text(S.of(context).delete),
          onPressed: disable
              ? null
              : () {
                  context.read<TaskScreenBloc>().add(TaskScreenDeleted());
                  locator<MyRouterDelegate>().gotoMainScreen();
                },
        ),
      ],
    );
  }
}
