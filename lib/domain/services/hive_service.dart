import 'package:todo/domain/models/task_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static Future<HiveService> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TaskAdapter());
    return HiveService();
  }
}
