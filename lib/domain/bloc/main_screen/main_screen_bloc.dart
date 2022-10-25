import 'dart:async';

import 'package:todo/data/storage.dart';
import 'package:todo/domain/injection.dart';
import 'package:todo/domain/models/task_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/domain/services/firebase_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';
part 'main_screen_bloc.freezed.dart';

@injectable
class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc(this._storage) : super(const MainScreenState()) {
    on<MainScreenSubscriptionRequested>(_onSubscriptionRequested);
    on<MainScreenCompletedTasksVisibilityChanged>(
      _onCompletedTasksVisibilityChanged,
    );
    on<MainScreenTaskDoneChanged>(_onTaskDoneChanged);
    on<MainScreenTaskDeleted>(_onTaskDeleted);
    on<MainScreenTaskAdded>(_onTaskAdded);
  }

  final Storage _storage;

  Future<void> _onSubscriptionRequested(
    MainScreenSubscriptionRequested event,
    Emitter<MainScreenState> emit,
  ) async {
    emit(state.copyWith(status: MainScreenStatus.loading));
    await emit.forEach<List<Task>>(
      _storage.tasksStreamController,
      onData: (tasks) => state.copyWith(
        status: MainScreenStatus.success,
        tasks: tasks,
      ),
      onError: (_, __) => state.copyWith(
        status: MainScreenStatus.failure,
      ),
    );
  }

  void _onCompletedTasksVisibilityChanged(
    MainScreenCompletedTasksVisibilityChanged event,
    Emitter<MainScreenState> emit,
  ) {
    emit(
      state.copyWith(
        completedTasksVisibility: !state.completedTasksVisibility,
      ),
    );
  }

  Future<void> _onTaskDoneChanged(
    MainScreenTaskDoneChanged event,
    Emitter<MainScreenState> emit,
  ) async {
    await _storage.updateTask(
      event.index,
      event.task.copyWith(done: !event.task.done),
    );
    locator<FirebaseService>().logDoneEvent();
  }

  Future<void> _onTaskDeleted(
    MainScreenTaskDeleted event,
    Emitter<MainScreenState> emit,
  ) async {
    await _storage.deleteTask(event.index);
    locator<FirebaseService>().logDeleteEvent();
  }

  Future<void> _onTaskAdded(
    MainScreenTaskAdded event,
    Emitter<MainScreenState> emit,
  ) async {
    await _storage.addTask(Task(text: event.text));
    locator<FirebaseService>().logAddEvent();
  }
}
