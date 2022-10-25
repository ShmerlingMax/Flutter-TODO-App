import 'package:todo/data/repository/i_local_storage.dart';
import 'package:todo/domain/models/task_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rxdart/subjects.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ILocalStorage)
class LocalStorage implements ILocalStorage {
  final _boxName = 'tasks';
  final _tasksStreamController = BehaviorSubject<List<Task>>.seeded(const []);

  LocalStorage() {
    getTasks();
  }

  @override
  Future<List<Task>> getTasks() async {
    var box = await Hive.openBox<Task>(_boxName);
    if (!box.isOpen) {
      box = await Hive.openBox<Task>(_boxName);
    }
    var tasks = box.values.toList();
    _tasksStreamController.add(tasks);
    box.close();
    return tasks;
  }

  @override
  Stream<List<Task>> getTasksStreamController() => _tasksStreamController;

  @override
  Task getTask(int index) => [..._tasksStreamController.value][index];

  @override
  Future<void> addTask(Task task) async {
    var box = await Hive.openBox<Task>(_boxName);
    await box.add(task);
    var tasks = box.values.toList();
    _tasksStreamController.add(tasks);
    box.close();
  }

  @override
  Future<void> deleteTask(int index) async {
    var tasks = [..._tasksStreamController.value];
    var box = await Hive.openBox<Task>(_boxName);
    await box.deleteAt(index);
    tasks = box.values.toList();
    _tasksStreamController.add(tasks);
    box.close();
  }

  @override
  Future<void> updateTask(int index, Task task) async {
    var box = await Hive.openBox<Task>(_boxName);
    await box.putAt(index, task);
    _tasksStreamController.add(box.values.toList());
    box.close();
  }

  @override
  Future<void> replaceTasks(List<Task> tasks) async {
    var box = await Hive.openBox<Task>(_boxName);
    await box.clear();
    await box.addAll(tasks);
    _tasksStreamController.add(box.values.toList());
    box.close();
  }
}
