import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/common/resize.dart';
import 'package:todo/common/s.dart';
import 'package:flutter/material.dart';
import 'package:todo/data/storage.dart';
import 'package:todo/domain/bloc/task_screen/task_screen_bloc.dart';
import 'package:todo/domain/injection.dart';

import 'important_field.dart';
import 'delete_button.dart';
import 'custom_app_bar.dart';
import 'note_field.dart';
import 'date_filed.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({this.index, Key? key}) : super(key: key);

  final int? index;

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  void initState() {
    context
        .read<TaskScreenBloc>()
        .add(TaskScreenTaskOpened(index: widget.index));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);
    var resize = locator<Resize>();
    return MediaQuery(
      data: data.copyWith(textScaleFactor: resize.textScaleFactor),
      child: SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          onPanDown: (_) => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            body: CustomScrollView(
              slivers: [
                const CustomAppBar(),
                SliverPadding(
                  padding: resize.calculateEdgeInsets(const EdgeInsets.all(16)),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NoteField(
                          text: widget.index != null
                              ? locator<Storage>().getTask(widget.index!).text
                              : '',
                        ),
                        Padding(
                          padding: resize.calculateEdgeInsets(
                            const EdgeInsets.only(top: 28),
                          ),
                          child: Text(
                            S.of(context).importance,
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                        const ImportantField(),
                        const Divider(height: 1),
                        const DateField(),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Padding(
                        padding: resize
                            .calculateEdgeInsets(const EdgeInsets.only(top: 8)),
                        child: const Divider(),
                      ),
                      Padding(
                        padding: resize.calculateEdgeInsets(
                          const EdgeInsets.only(left: 16),
                        ),
                        child: DeleteButton(disable: widget.index == null),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
