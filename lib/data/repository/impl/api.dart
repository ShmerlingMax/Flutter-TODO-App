import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/common/constants.dart';
import 'package:todo/data/repository/i_api.dart';
import 'package:todo/domain/models/task_model.dart';
import 'package:http/http.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'remote_storage.dart';

@Injectable(as: IApi)
class Api implements IApi {
  final _baseURL = "URL";
  final _token = "TOKEN";
  late int _revision;
  late SharedPreferences _prefs;

  @override
  Future<void> init() async {
    Response response;
    try {
      response = await get(
        Uri.parse("$_baseURL/list"),
        headers: {"Authorization": "Bearer $_token"},
      );
    } catch (e) {
      RemoteStorage.isOnline = false;
      return;
    }
    if (await checkStatusCode(response.statusCode)) {
      return;
    }
    _revision = jsonDecode(response.body)['revision'];
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  int getRevision() => _revision;

  @override
  void setRevision(int value) {
    _revision = value;
    _prefs.setInt(revisionKey, _revision);
  }

  @override
  Future<List<Task>?> getTasks() async {
    Response response;
    try {
      response = await get(
        Uri.parse("$_baseURL/list"),
        headers: {"Authorization": "Bearer $_token"},
      );
    } catch (e) {
      RemoteStorage.isOnline = false;
      return null;
    }
    if (await checkStatusCode(response.statusCode)) {
      return null;
    }
    return _listIntoTasks(response.body);
  }

  @override
  Future<List<Task>?> updateTasks(List<Task> tasks) async {
    var body = '{"list":${jsonEncode(tasks)}}';
    Response response;
    try {
      response = await patch(
        Uri.parse("$_baseURL/list"),
        headers: {
          "Authorization": "Bearer $_token",
          "X-Last-Known-Revision": "$_revision",
          "Content-Type": "application/json ",
        },
        body: body,
      );
    } catch (e) {
      RemoteStorage.isOnline = false;
      return null;
    }
    if (await checkStatusCode(response.statusCode)) {
      return null;
    }
    setRevision(jsonDecode(response.body)['revision']);
    return _listIntoTasks(response.body);
  }

  @override
  Future<Task?> getTask(String id) async {
    Response response;
    try {
      response = await get(
        Uri.parse("$_baseURL/list/$id"),
        headers: {"Authorization": "Bearer $_token"},
      );
    } catch (e) {
      RemoteStorage.isOnline = false;
      return null;
    }
    if (await checkStatusCode(response.statusCode)) {
      return null;
    }
    return Task.fromJson(jsonDecode(response.body)['element']);
  }

  @override
  Future<Task?> addTask(Task task) async {
    var body = '{"element":${jsonEncode(task)}}';
    Response response;
    try {
      response = await post(
        Uri.parse("$_baseURL/list"),
        headers: {
          "Authorization": "Bearer $_token",
          "X-Last-Known-Revision": "$_revision",
          "Content-Type": "application/json ",
        },
        body: body,
      );
    } catch (e) {
      RemoteStorage.isOnline = false;
      return null;
    }
    if (await checkStatusCode(response.statusCode)) {
      return null;
    }
    setRevision(jsonDecode(response.body)['revision']);
    return Task.fromJson(jsonDecode(response.body)['element']);
  }

  @override
  Future<Task?> updateTask(Task task) async {
    var body = '{"element":${jsonEncode(task)}}';
    Response response;
    try {
      response = await put(
        Uri.parse("$_baseURL/list/${task.id}"),
        headers: {
          "Authorization": "Bearer $_token",
          "X-Last-Known-Revision": "$_revision",
          "Content-Type": "application/json ",
        },
        body: body,
      );
    } catch (e) {
      RemoteStorage.isOnline = false;
      return null;
    }
    if (await checkStatusCode(response.statusCode)) {
      return null;
    }
    setRevision(jsonDecode(response.body)['revision']);
    return Task.fromJson(jsonDecode(response.body)['element']);
  }

  @override
  Future<Task?> deleteTask(String id) async {
    Response response;
    try {
      response = await delete(
        Uri.parse("$_baseURL/list/$id"),
        headers: {
          "Authorization": "Bearer $_token",
          "X-Last-Known-Revision": "$_revision",
        },
      );
    } catch (e) {
      RemoteStorage.isOnline = false;
      return null;
    }
    if (await checkStatusCode(response.statusCode)) {
      return null;
    }
    setRevision(jsonDecode(response.body)['revision']);
    return Task.fromJson(jsonDecode(response.body)['element']);
  }

  List<Task> _listIntoTasks(String body) {
    var list = jsonDecode(body)['list'];
    return List<Task>.from(list.map((task) => Task.fromJson(task)));
  }

  Future<bool> checkStatusCode(int statusCode) async {
    if (statusCode == 200) {
      return false;
    }
    RemoteStorage.isOnline = false;
    FirebaseCrashlytics.instance.recordError(statusCode, StackTrace.current);
    return true;
  }
}
