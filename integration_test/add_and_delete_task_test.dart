import 'package:todo/ui/main_screen/main_screen.dart';
import 'package:todo/ui/task_screen/task_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';

import 'test_main.dart' as test_app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('add and delete task', (tester) async {
    test_app.main();

    await tester.pumpAndSettle(const Duration(seconds: 10));
    await tester.pumpAndSettle();

    final floatingActionButton = find.byType(FloatingActionButton);
    expect(find.byType(MainScreen), findsOneWidget);

    await tester.tap(floatingActionButton);

    await tester.pumpAndSettle();

    final submitButton = find.text('СОХРАНИТЬ');
    expect(find.byType(TaskScreen), findsOneWidget);

    await tester.enterText(find.byType(TextFormField), 'task');
    await tester.pumpAndSettle();

    await tester.tap(submitButton);
    await tester.pumpAndSettle(const Duration(seconds: 10));

    expect(find.text('task'), findsOneWidget);

    await tester.fling(find.text('task'), const Offset(-100, 0.0), 3000);
    await tester.pumpAndSettle();

    expect(find.text('task'), findsNothing);
    await tester.pumpAndSettle(const Duration(seconds: 10));
  });
}
