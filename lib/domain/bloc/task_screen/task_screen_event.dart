part of 'task_screen_bloc.dart';

abstract class TaskScreenEvent extends Equatable {
  const TaskScreenEvent();

  @override
  List<Object?> get props => [];
}

class TaskScreenTaskOpened extends TaskScreenEvent {
  const TaskScreenTaskOpened({this.index});

  final int? index;

  @override
  List<Object?> get props => [index];
}

class TaskScreenTextChanged extends TaskScreenEvent {
  const TaskScreenTextChanged({required this.text});

  final String text;

  @override
  List<Object> get props => [text];
}

class TaskScreenImportanceChanged extends TaskScreenEvent {
  const TaskScreenImportanceChanged({required this.importance});

  final String importance;

  @override
  List<Object> get props => [importance];
}

class TaskScreenDeadlineChanged extends TaskScreenEvent {
  const TaskScreenDeadlineChanged({required this.deadline});

  final int? deadline;

  @override
  List<Object?> get props => [deadline];
}

class TaskScreenSaved extends TaskScreenEvent {}

class TaskScreenDeleted extends TaskScreenEvent {}
