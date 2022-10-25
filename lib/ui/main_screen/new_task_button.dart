import 'package:todo/common/resize.dart';
import 'package:todo/common/s.dart';
import 'package:todo/domain/bloc/main_screen/main_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/domain/injection.dart';

class NewTaskButton extends StatelessWidget {
  const NewTaskButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    return Padding(
      padding: locator<Resize>()
          .calculateEdgeInsets(const EdgeInsets.only(left: 42, right: 36)),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: S.of(context).new_task,
        ),
        onSubmitted: (String value) async {
          if (value.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(S.of(context).empty_case),
                behavior: SnackBarBehavior.floating,
              ),
            );
          } else {
            context
                .read<MainScreenBloc>()
                .add(MainScreenTaskAdded(text: value));
          }
          controller.clear();
        },
      ),
    );
  }
}
