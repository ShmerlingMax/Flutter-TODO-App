import 'package:todo/common/app_theme.dart';
import 'package:todo/common/date_formatter.dart';
import 'package:todo/common/resize.dart';
import 'package:todo/common/s.dart';
import 'package:todo/domain/bloc/task_screen/task_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/domain/injection.dart';

class DateField extends StatelessWidget {
  const DateField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var task = context.watch<TaskScreenBloc>().state.currentTask;
    var resize = locator<Resize>();
    return Padding(
      padding: resize.calculateEdgeInsets(const EdgeInsets.only(top: 10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).do_before,
                style: Theme.of(context).textTheme.headline4,
              ),
              Visibility(
                visible: task.deadline == null ? false : true,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    alignment: Alignment.topLeft,
                    textStyle: MaterialStateProperty.all(
                      Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  onPressed: () async {
                    final bloc = context.read<TaskScreenBloc>();
                    DateTime? date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(DateTime.now().year),
                      lastDate: DateTime(DateTime.now().year + 100),
                      builder: (context, child) => Theme(
                        data: ThemeData(),
                        child: Transform.scale(
                          scale: resize.calendarScaleFactor,
                          child: child!,
                        ),
                      ),
                    );
                    if (date != null) {
                      bloc.add(
                        TaskScreenDeadlineChanged(
                          deadline: date.millisecondsSinceEpoch,
                        ),
                      );
                    }
                  },
                  child: Text(formatDate(task.deadline)),
                ),
              ),
            ],
          ),
          Transform.scale(
            scale: resize.switchScaleFactor,
            child: Switch(
              activeColor: AppTheme.customBlue,
              activeTrackColor: AppTheme.customBlue.withOpacity(0.3),
              inactiveThumbColor:
                  Theme.of(context).brightness == Brightness.light
                      ? AppTheme.lightBackElevated
                      : AppTheme.darkBackElevated,
              inactiveTrackColor:
                  Theme.of(context).brightness == Brightness.light
                      ? AppTheme.lightSupportOverlay
                      : AppTheme.darkSupportOverlay,
              value: task.deadline == null ? false : true,
              onChanged: (bool value) {
                context.read<TaskScreenBloc>().add(
                      TaskScreenDeadlineChanged(
                        deadline: value
                            ? DateTime.now().millisecondsSinceEpoch
                            : null,
                      ),
                    );
              },
            ),
          ),
        ],
      ),
    );
  }
}
