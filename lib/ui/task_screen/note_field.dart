import 'package:todo/common/resize.dart';
import 'package:todo/common/s.dart';
import 'package:flutter/material.dart';
import 'package:todo/domain/bloc/task_screen/task_screen_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/injection.dart';

class NoteField extends StatelessWidget {
  final String text;
  const NoteField({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      borderRadius: const BorderRadius.all(
        Radius.circular(8),
      ),
      child: TextFormField(
        initialValue: text,
        decoration: InputDecoration(
          hintText: S.of(context).what_need,
        ),
        minLines: locator<Resize>().minLines,
        maxLines: null,
        keyboardType: TextInputType.multiline,
        onChanged: (String value) {
          context
              .read<TaskScreenBloc>()
              .add(TaskScreenTextChanged(text: value));
        },
      ),
    );
  }
}
