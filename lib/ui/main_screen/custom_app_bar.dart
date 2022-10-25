import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/common/app_theme.dart';
import 'package:todo/common/resize.dart';
import 'package:todo/common/s.dart';
import 'package:flutter/material.dart';
import 'package:todo/domain/bloc/main_screen/main_screen_bloc.dart';
import 'package:todo/domain/injection.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var resize = locator<Resize>();
    final settings =
        context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
    final progress = (settings!.currentExtent - settings.minExtent) /
        (settings.maxExtent - settings.minExtent);
    return Padding(
      padding: resize.calculateEdgeInsets(
        EdgeInsets.lerp(
          const EdgeInsets.only(
            left: 16,
            top: 24,
          ),
          const EdgeInsets.only(
            left: 60,
            top: 58,
          ),
          progress,
        )!,
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).title,
                style: TextStyle.lerp(
                  Theme.of(context).textTheme.headline2,
                  Theme.of(context).textTheme.headline1,
                  progress,
                ),
              ),
              Opacity(
                opacity: progress,
                child: Row(
                  children: [
                    Text(
                      S.of(context).done,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    BlocSelector<MainScreenBloc, MainScreenState, int>(
                      selector: (state) =>
                          state.tasks.where((element) => element.done).length,
                      builder: (context, count) {
                        return Text(
                          '$count',
                          style: Theme.of(context).textTheme.bodyText1,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: resize.calculateEdgeInsets(
                EdgeInsets.lerp(
                  const EdgeInsets.only(right: 8),
                  const EdgeInsets.only(right: 8, top: 42),
                  progress,
                )!,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 38,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: BlocSelector<MainScreenBloc, MainScreenState, bool>(
                        selector: (state) => state.completedTasksVisibility,
                        builder: (context, visibility) => Icon(
                          visibility ? Icons.visibility_off : Icons.visibility,
                        ),
                      ),
                      color: AppTheme.customBlue,
                      onPressed: () => context
                          .read<MainScreenBloc>()
                          .add(MainScreenCompletedTasksVisibilityChanged()),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
