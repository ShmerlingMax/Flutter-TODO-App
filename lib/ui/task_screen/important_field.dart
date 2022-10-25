import 'package:todo/common/app_theme.dart';
import 'package:todo/common/constants.dart';
import 'package:todo/common/resize.dart';
import 'package:todo/common/s.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/domain/bloc/task_screen/task_screen_bloc.dart';
import 'package:todo/domain/injection.dart';

class ImportantField extends StatelessWidget {
  const ImportantField({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final items = <String>[
      S.of(context).no,
      S.of(context).low,
      S.of(context).high
    ];
    var task = context.watch<TaskScreenBloc>().state.currentTask;
    var resize = locator<Resize>();
    return SizedBox(
      width: 130 * resize.sizeBoxScaleFactor,
      child: DropdownButton(
        underline: Container(color: Colors.transparent),
        dropdownColor: Theme.of(context).brightness == Brightness.light
            ? AppTheme.lightBackElevated
            : AppTheme.darkBackElevated,
        value: task.importance,
        iconSize: 0,
        itemHeight: 50 * resize.dropDownButtonScaleFactor,
        items: [
          DropdownMenuItem(
            value: Importance.basic.textName,
            child: Text(
              S.of(context).no,
              style: Theme.of(context).textTheme.button,
            ),
          ),
          DropdownMenuItem(
            value: Importance.low.textName,
            child: Text(
              S.of(context).low,
              style: Theme.of(context).textTheme.button,
            ),
          ),
          DropdownMenuItem(
            value: Importance.important.textName,
            child: Text(
              S.of(context).high,
              style: Theme.of(context)
                  .textTheme
                  .button!
                  .copyWith(color: AppTheme.importanceColor),
            ),
          ),
        ],
        onChanged: (String? value) {
          context
              .read<TaskScreenBloc>()
              .add(TaskScreenImportanceChanged(importance: value!));
        },
        selectedItemBuilder: (context) {
          return items.map<Widget>((String item) {
            return DropdownMenuItem(
              child: Text(
                item,
                style: item == S.of(context).high
                    ? Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: AppTheme.importanceColor)
                    : Theme.of(context).textTheme.headline3,
              ),
            );
          }).toList();
        },
      ),
    );
  }
}
