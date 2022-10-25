import 'package:todo/domain/models/task_model.dart';
import 'package:todo/data/storage.dart';
import 'package:todo/domain/bloc/main_screen/main_screen_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

import 'test_injectable.dart';

class MockStorage extends Mock implements Storage {}

class FakeTask extends Fake implements Task {}

void main() {
  late MockStorage mockStorage;
  late Task task;
  late List<Task> tasks;

  setUpAll(() {
    configureDependencies();
    registerFallbackValue((FakeTask()));
  });

  setUp(() {
    task = const Task(
      id: 'id_1',
      text: 'text',
      importance: 'low',
      deadline: 1,
      done: true,
      created: 1,
      updated: 2,
      lastUpdatedBy: '0',
    );

    tasks = [task, task.copyWith(id: 'id_2')];
    mockStorage = MockStorage();
  });

  group('MainScreenBloc', () {
    MainScreenBloc buildBloc() {
      return MainScreenBloc(mockStorage);
    }

    group('constructor', () {
      test('works properly', () => expect(buildBloc, returnsNormally));

      test('has correct initial state', () {
        expect(
          buildBloc().state,
          equals(const MainScreenState()),
        );
      });
    });

    group('MainScreenSubscriptionRequested', () {
      blocTest<MainScreenBloc, MainScreenState>(
        'starts listening to storage get tasksStreamController stream',
        setUp: () => {
          when(
            () => mockStorage.tasksStreamController,
          ).thenAnswer((_) => Stream.value(tasks))
        },
        build: buildBloc,
        act: (bloc) => bloc.add(MainScreenSubscriptionRequested()),
        verify: (_) {
          verify(() => mockStorage.tasksStreamController).called(1);
        },
      );

      blocTest<MainScreenBloc, MainScreenState>(
        'emits state with updated status and tasks '
        'when storage get tasksStreamController stream emits new tasks',
        setUp: () => {
          when(
            () => mockStorage.tasksStreamController,
          ).thenAnswer((_) => Stream.value(tasks))
        },
        build: buildBloc,
        act: (bloc) => bloc.add(MainScreenSubscriptionRequested()),
        expect: () => [
          const MainScreenState(
            status: MainScreenStatus.loading,
            completedTasksVisibility: false,
          ),
          MainScreenState(
            status: MainScreenStatus.success,
            tasks: tasks,
            completedTasksVisibility: false,
          ),
        ],
      );

      blocTest<MainScreenBloc, MainScreenState>(
        'emits state with failure status '
        'when storage get tasksStreamController stream emits error',
        setUp: () {
          when(
            () => mockStorage.tasksStreamController,
          ).thenAnswer((_) => Stream.error(Exception('oops')));
        },
        build: buildBloc,
        act: (bloc) => bloc.add(MainScreenSubscriptionRequested()),
        expect: () => [
          const MainScreenState(
            status: MainScreenStatus.loading,
            completedTasksVisibility: false,
          ),
          const MainScreenState(
            status: MainScreenStatus.failure,
            completedTasksVisibility: false,
          ),
        ],
      );
    });

    group('MainScreenCompletedTasksVisibilityChanged', () {
      blocTest<MainScreenBloc, MainScreenState>(
        'emits state with updated completedTasksVisibility',
        build: buildBloc,
        seed: () => MainScreenState(tasks: tasks),
        act: (bloc) => bloc.add(
          MainScreenCompletedTasksVisibilityChanged(),
        ),
        expect: () => [
          MainScreenState(tasks: tasks, completedTasksVisibility: true),
        ],
      );
    });

    group('MainScreenTaskDoneChanged', () {
      blocTest<MainScreenBloc, MainScreenState>(
        'changes task using storage',
        setUp: () {
          when(
            () => mockStorage.updateTask(any(), any()),
          ).thenAnswer((_) async {});
        },
        build: buildBloc,
        seed: () => MainScreenState(tasks: tasks),
        act: (bloc) => bloc.add(
          MainScreenTaskDoneChanged(
            index: 0,
            task: tasks.first.copyWith(id: 'id_3'),
          ),
        ),
        verify: (bloc) {
          verify(
            () => mockStorage.updateTask(
              any(that: equals(0)),
              any(
                that: isA<Task>()
                    .having((t) => t.id, 'id', equals('id_3'))
                    .having((t) => t.text, 'text', equals('text'))
                    .having((t) => t.importance, 'importance', equals('low'))
                    .having((t) => t.deadline, 'deadline', equals(1))
                    .having((t) => t.done, 'done', equals(false))
                    .having((t) => t.created, 'created', equals(1))
                    .having((t) => t.updated, 'updated', equals(2))
                    .having(
                      (t) => t.lastUpdatedBy,
                      'lastUpdatedBy',
                      equals('0'),
                    ),
              ),
            ),
          ).called(1);
        },
      );
    });
    group('MainScreenTaskDeleted', () {
      blocTest<MainScreenBloc, MainScreenState>(
        'deletes task using storage',
        setUp: () {
          when(
            () => mockStorage.deleteTask(any()),
          ).thenAnswer((_) async {});
        },
        build: buildBloc,
        seed: () => MainScreenState(tasks: tasks),
        act: (bloc) => bloc.add(const MainScreenTaskDeleted(index: 0)),
        verify: (bloc) {
          verify(
            () => mockStorage.deleteTask(any(that: equals(0))),
          ).called(1);
        },
      );
    });

    group('MainScreenTaskAdded', () {
      blocTest<MainScreenBloc, MainScreenState>(
        'adds task using storage',
        setUp: () {
          when(
            () => mockStorage.addTask(any()),
          ).thenAnswer((_) async {});
        },
        build: buildBloc,
        seed: () => MainScreenState(tasks: tasks),
        act: (bloc) => bloc.add(const MainScreenTaskAdded(text: 'text')),
        verify: (bloc) {
          verify(
            () => mockStorage.addTask(
              any(
                that: isA<Task>()
                    .having((t) => t.id, 'id', equals(''))
                    .having((t) => t.text, 'text', equals('text'))
                    .having((t) => t.importance, 'importance', equals('basic'))
                    .having((t) => t.deadline, 'deadline', equals(null))
                    .having((t) => t.done, 'done', equals(false))
                    .having((t) => t.created, 'created', equals(0))
                    .having((t) => t.updated, 'updated', equals(0))
                    .having(
                      (t) => t.lastUpdatedBy,
                      'lastUpdatedBy',
                      equals('0'),
                    ),
              ),
            ),
          ).called(1);
        },
      );
    });
  });
}
