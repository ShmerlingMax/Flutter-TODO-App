import 'package:todo/common/checking_network.dart';
import 'package:todo/data/repository/i_api.dart';
import 'package:todo/data/repository/i_remote_storage.dart';
import 'package:todo/domain/models/task_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IRemoteStorage)
class RemoteStorage implements IRemoteStorage {
  final IApi _api;
  static bool isOnline = false;

  RemoteStorage(this._api);

  @override
  Future<void> init() async {
    isOnline = await hasNetwork();
    if (isOnline) {
      await _api.init();
    }
  }

  @override
  int getRevision() => _api.getRevision();
  @override
  Future<List<Task>?> getTasks() => _api.getTasks();
  @override
  Future<Task?> getTask(index) => _api.getTask(index);
  @override
  void addTask(Task task) {
    _api.addTask(task);
  }

  @override
  Future<void> deleteTask(String id) => _api.deleteTask(id);
  @override
  Future<void> updateTask(Task task) => _api.updateTask(task);
  @override
  Future<void> updateTasks(List<Task> tasks) => _api.updateTasks(tasks);
}
