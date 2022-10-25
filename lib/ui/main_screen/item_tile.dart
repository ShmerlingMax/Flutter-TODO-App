import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/common/app_theme.dart';
import 'package:todo/common/date_formatter.dart';
import 'package:todo/common/resize.dart';
import 'package:todo/domain/bloc/main_screen/main_screen_bloc.dart';
import 'package:todo/domain/injection.dart';
import 'package:todo/domain/models/task_model.dart';
import 'package:todo/common/constants.dart';
import 'package:todo/navigation/delegate.dart';
import 'package:tuple/tuple.dart';
import 'package:flutter/material.dart';

import 'dart:ui';

class ItemTile extends StatefulWidget {
  final int index;
  const ItemTile(this.index, {Key? key}) : super(key: key);

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  double _progress = 0;

  @override
  Widget build(BuildContext context) {
    var resize = locator<Resize>();
    return BlocSelector<MainScreenBloc, MainScreenState, Tuple2<bool, Task>>(
      selector: (state) => Tuple2(
        state.completedTasksVisibility,
        state.tasks.length == widget.index
            ? const Task()
            : state.tasks[widget.index],
      ),
      builder: (context, data) {
        var visibility = data.item1;
        var task = data.item2;
        double rightPadding = 18;
        if (task.importance == Importance.important.textName) {
          rightPadding = 10;
        } else if (task.importance == Importance.low.textName) {
          rightPadding = 13;
        }
        return Visibility(
          visible: visibility || !task.done,
          child: ClipRect(
            child: Dismissible(
              key: Key(task.id),
              onUpdate: (details) {
                setState(() {
                  _progress = details.progress;
                });
              },
              confirmDismiss: (direction) async {
                if (direction == DismissDirection.startToEnd) {
                  context.read<MainScreenBloc>().add(
                        MainScreenTaskDoneChanged(
                          index: widget.index,
                          task: task,
                        ),
                      );
                  return !visibility;
                }
                return true;
              },
              onDismissed: (direction) {
                if (direction == DismissDirection.startToEnd) {
                  context.read<MainScreenBloc>().add(
                        MainScreenTaskDoneChanged(
                          index: widget.index,
                          task: task,
                        ),
                      );
                } else {
                  context.read<MainScreenBloc>().add(
                        MainScreenTaskDeleted(
                          index: widget.index,
                        ),
                      );
                }
              },
              background: _Background(_progress),
              secondaryBackground: _SecondaryBackground(_progress),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _CheckBox(
                    index: widget.index,
                    task: task,
                    resize: resize,
                    rightPadding: rightPadding,
                  ),
                  _ImportantIcon(
                    task: task,
                    resize: resize,
                  ),
                  _LowIcon(
                    task: task,
                    resize: resize,
                  ),
                  _TaskText(
                    task: task,
                    resize: resize,
                  ),
                  IconButton(
                    padding: resize
                        .calculateEdgeInsets(const EdgeInsets.only(top: 19)),
                    alignment: Alignment.topCenter,
                    icon: const Icon(Icons.info_outline),
                    onPressed: () {
                      locator<MyRouterDelegate>().gotoTask(widget.index);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Background extends StatelessWidget {
  final double _progress;
  const _Background(this._progress, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.customGreen,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Align(
        alignment: Alignment.lerp(
          Alignment.centerLeft,
          Alignment.centerRight,
          lerpDouble(-0.07, 1, _progress)! - 0.05,
        )!,
        child: Icon(Icons.check, color: AppTheme.customWhite),
      ),
    );
  }
}

class _SecondaryBackground extends StatelessWidget {
  final double _progress;
  const _SecondaryBackground(this._progress, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.customRed,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Align(
        alignment: Alignment.lerp(
          Alignment.centerRight,
          Alignment.centerLeft,
          lerpDouble(-0.07, 1, _progress)! - 0.05,
        )!,
        child: Icon(Icons.delete, color: AppTheme.customWhite),
      ),
    );
  }
}

class _CheckBox extends StatelessWidget {
  final int _index;
  final Task _task;
  final Resize _resize;
  final double _rightPadding;

  const _CheckBox({
    required index,
    required task,
    required resize,
    required rightPadding,
    Key? key,
  })  : _index = index,
        _task = task,
        _resize = resize,
        _rightPadding = rightPadding,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _resize.calculateEdgeInsets(
        EdgeInsets.only(
          top: 18,
          left: 18,
          bottom: 18,
          right: _rightPadding,
        ),
      ),
      child: Transform.scale(
        scale: _resize.checkBoxScaleFactor,
        child: SizedBox(
          height: 18,
          width: 18,
          child: Container(
            decoration: BoxDecoration(
              color: !_task.done &&
                      _task.importance == Importance.important.textName
                  ? AppTheme.importanceColor.withOpacity(0.16)
                  : null,
              borderRadius: BorderRadius.circular(2),
            ),
            clipBehavior: Clip.hardEdge,
            child: Checkbox(
              activeColor: AppTheme.customGreen,
              side: !_task.done &&
                      _task.importance == Importance.important.textName
                  ? MaterialStateBorderSide.resolveWith(
                      (states) => BorderSide(
                        width: 2,
                        color: AppTheme.importanceColor,
                      ),
                    )
                  : null,
              value: _task.done,
              onChanged: (bool? value) {
                context.read<MainScreenBloc>().add(
                      MainScreenTaskDoneChanged(
                        index: _index,
                        task: _task,
                      ),
                    );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _ImportantIcon extends StatelessWidget {
  final Task _task;
  final Resize _resize;
  const _ImportantIcon({required task, required resize, Key? key})
      : _task = task,
        _resize = resize,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _resize.calculateEdgeInsets(const EdgeInsets.only(top: 17)),
      child: Visibility(
        visible: _task.importance == Importance.important.textName,
        child: Row(
          children: [
            SizedBox(
              width: 6 * _resize.iconScaleFactor,
              child: Icon(
                Icons.priority_high,
                color: AppTheme.importanceColor,
              ),
            ),
            Icon(
              Icons.priority_high,
              color: AppTheme.importanceColor,
            ),
          ],
        ),
      ),
    );
  }
}

class _LowIcon extends StatelessWidget {
  final Task _task;
  final Resize _resize;
  const _LowIcon({required task, required resize, Key? key})
      : _task = task,
        _resize = resize,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _resize.calculateEdgeInsets(const EdgeInsets.only(top: 17)),
      child: Visibility(
        visible: _task.importance == Importance.low.textName,
        child: Icon(
          Icons.arrow_downward,
          color: AppTheme.customGray,
        ),
      ),
    );
  }
}

class _TaskText extends StatelessWidget {
  final Task _task;
  final Resize _resize;
  const _TaskText({required task, required resize, Key? key})
      : _task = task,
        _resize = resize,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: _resize.calculateEdgeInsets(const EdgeInsets.only(top: 17)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _task.text,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: _task.done
                  ? TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Theme.of(context).hintColor,
                    )
                  : const TextStyle(
                      decoration: TextDecoration.none,
                    ),
            ),
            Visibility(
              visible: _task.deadline != null,
              child: Text(
                formatDate(_task.deadline),
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
