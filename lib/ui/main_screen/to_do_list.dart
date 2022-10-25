import 'package:todo/common/app_theme.dart';
import 'package:todo/common/resize.dart';
import 'package:todo/domain/bloc/main_screen/main_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/injection.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'new_task_button.dart';
import 'item_tile.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MainScreenBloc, MainScreenState, int>(
      selector: (state) => state.tasks.length,
      builder: (context, count) {
        return SliverPadding(
          padding: locator<Resize>().calculateEdgeInsets(
            const EdgeInsets.only(
              right: 8,
              left: 8,
              top: 8,
              bottom: 16,
            ),
          ),
          sliver: SliverStack(
            children: [
              SliverPositioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.light
                        ? AppTheme.lightBackSecondary
                        : AppTheme.darkBackSecondary,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.12),
                        offset: const Offset(0, 2),
                        blurRadius: 2,
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        offset: const Offset(0, 2),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) =>
                      index == count ? const NewTaskButton() : ItemTile(index),
                  childCount: count + 1,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
