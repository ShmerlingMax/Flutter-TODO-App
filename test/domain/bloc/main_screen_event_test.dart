import 'package:todo/domain/bloc/main_screen/main_screen_bloc.dart';
import 'package:todo/domain/models/task_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MainScreenEvent', () {
    var mockTask = const Task(
      id: 'id_1',
      text: 'text',
      importance: 'low',
      deadline: 1,
      done: true,
      created: 1,
      updated: 2,
      lastUpdatedBy: '0',
    );

    group('MainScreenSubscriptionRequested', () {
      test('supports value equality', () {
        expect(
          MainScreenSubscriptionRequested(),
          equals(MainScreenSubscriptionRequested()),
        );
      });

      test('props are correct', () {
        expect(
          MainScreenSubscriptionRequested().props,
          equals(<Object?>[]),
        );
      });
    });

    group('MainScreenCompletedTasksVisibilityChanged', () {
      test('supports value equality', () {
        expect(
          MainScreenCompletedTasksVisibilityChanged(),
          equals(MainScreenCompletedTasksVisibilityChanged()),
        );
      });

      test('props are correct', () {
        expect(
          MainScreenCompletedTasksVisibilityChanged().props,
          equals(<Object?>[]),
        );
      });
    });

    group('MainScreenTaskDoneChanged', () {
      test('supports value equality', () {
        expect(
          MainScreenTaskDoneChanged(index: 0, task: mockTask),
          equals(MainScreenTaskDoneChanged(index: 0, task: mockTask)),
        );
      });

      test('props are correct', () {
        expect(
          MainScreenTaskDoneChanged(index: 0, task: mockTask).props,
          equals(<Object?>[mockTask, 0]),
        );
      });
    });

    group('MainScreenTaskDeleted', () {
      test('supports value equality', () {
        expect(
          const MainScreenTaskDeleted(index: 0),
          equals(const MainScreenTaskDeleted(index: 0)),
        );
      });

      test('props are correct', () {
        expect(
          const MainScreenTaskDeleted(index: 0).props,
          equals(<Object?>[0]),
        );
      });
    });

    group('MainScreenTaskAdded', () {
      test('supports value equality', () {
        expect(
          const MainScreenTaskAdded(text: 'text'),
          equals(const MainScreenTaskAdded(text: 'text')),
        );
      });

      test('props are correct', () {
        expect(
          const MainScreenTaskAdded(text: 'text').props,
          equals(<Object?>['text']),
        );
      });
    });
  });
}
