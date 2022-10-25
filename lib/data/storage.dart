import 'package:todo/common/constants.dart';
import 'package:todo/data/repository/i_local_storage.dart';
import 'package:todo/data/repository/i_remote_storage.dart';
import 'package:todo/data/repository/impl/remote_storage.dart';
import 'package:todo/domain/models/task_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';

@singleton
class Storage {
  final ILocalStorage _localStorage;
  final IRemoteStorage _remoteStorage;

  Storage(this._localStorage, this._remoteStorage) {
    _openStorage();
  }

  Stream<List<Task>> get tasksStreamController =>
      _localStorage.getTasksStreamController();

  Future<void> _openStorage() async {
    await _remoteStorage.init();
    final prefs = await SharedPreferences.getInstance();
    if (RemoteStorage.isOnline) {
      var revision = prefs.getInt(revisionKey) ?? 0;
      if (revision < _remoteStorage.getRevision() && revision != -1) {
        var tasks = await _remoteStorage.getTasks();
        if (tasks != null) {
          await _localStorage.replaceTasks(tasks);
        }
      } else if (revision >= _remoteStorage.getRevision() || revision == -1) {
        await _remoteStorage.updateTasks(await _localStorage.getTasks());
      }
      prefs.setInt(revisionKey, _remoteStorage.getRevision());
    } else {
      prefs.setInt(revisionKey, -1);
    }
    await getTasks();
  }

  Future<List<Task>> getTasks() async {
    var tasks = await _localStorage.getTasks();
    return tasks;
  }

  Task getTask(int index) => _localStorage.getTask(index);

  Future<void> addTask(Task task) async {
    task = task.copyWith(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      created: DateTime.now().millisecondsSinceEpoch,
      updated: DateTime.now().millisecondsSinceEpoch,
    );
    await _localStorage.addTask(task);
    if (RemoteStorage.isOnline) {
      _remoteStorage.addTask(task);
    }
  }

  Future<void> deleteTask(int index) async {
    var task = _localStorage.getTask(index);
    await _localStorage.deleteTask(index);
    if (RemoteStorage.isOnline) {
      _remoteStorage.deleteTask(task.id);
    }
  }

  Future<void> updateTask(int index, Task task) async {
    task = task.copyWith(updated: DateTime.now().millisecondsSinceEpoch);
    await _localStorage.updateTask(index, task.copyWith());
    if (RemoteStorage.isOnline) {
      _remoteStorage.updateTask(task);
    }
  }
}
