part of 'main_screen_bloc.dart';

abstract class MainScreenEvent extends Equatable {
  const MainScreenEvent();

  @override
  List<Object?> get props => [];
}

class MainScreenSubscriptionRequested extends MainScreenEvent {}

class MainScreenCompletedTasksVisibilityChanged extends MainScreenEvent {}

class MainScreenTaskDoneChanged extends MainScreenEvent {
  const MainScreenTaskDoneChanged({required this.index, required this.task});

  final Task task;
  final int index;

  @override
  List<Object> get props => [task, index];
}

class MainScreenTaskDeleted extends MainScreenEvent {
  const MainScreenTaskDeleted({required this.index});
  final int index;

  @override
  List<Object?> get props => [index];
}

class MainScreenTaskAdded extends MainScreenEvent {
  const MainScreenTaskAdded({required this.text});

  final String text;

  @override
  List<Object> get props => [text];
}
