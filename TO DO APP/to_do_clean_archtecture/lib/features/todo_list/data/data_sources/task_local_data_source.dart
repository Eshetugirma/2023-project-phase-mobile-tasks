import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/errors/exception.dart';

import '../models/task_model.dart';

/// Shared preference key for storing cached tasks
const sharedPreferenceStorageKey = 'CACHED_TASKS';

/// Interface for local data source
abstract class TaskLocalDataSource {
  Future<void> cacheTasks(List<TaskModel> tasks);
  Future<List<TaskModel>> getTasks();
  Future<TaskModel> getTask(String id);
  Future<TaskModel> createTask(TaskModel todo);
  Future<TaskModel> updateTask(TaskModel todo);
  Future<TaskModel> deleteTask(String id);
}

/// Implementation of [TaskLocalDataSource]
///
/// Uses [SharedPreferences] to store cached tasks
class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  final SharedPreferences sharedPreferences;

  TaskLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheTasks(List<TaskModel> tasks) async {
    await sharedPreferences.setString(
        sharedPreferenceStorageKey, jsonEncode(tasks));
  }

  @override
  Future<TaskModel> createTask(TaskModel task) async {
    final tasks = await getTasks();

    tasks.add(task);

    await sharedPreferences.setString(
        sharedPreferenceStorageKey, jsonEncode(tasks));

    return task;
  }

  @override
  Future<TaskModel> getTask(String id) async {
    final tasks = await getTasks();

    for (final task in tasks) {
      if (task.id == id) {
        return task;
      }
    }

    throw CacheException.cacheNotFound();
  }

  @override
  Future<List<TaskModel>> getTasks() async {
    final serialized =
        sharedPreferences.getString(sharedPreferenceStorageKey) ?? '[]';
    try {
      final json = jsonDecode(serialized) as List;
      final tasks = json.map<TaskModel>((e) => TaskModel.fromJson(e)).toList();
      return tasks;
    } catch (e) {
      throw CacheException.readError();
    }
  }

  @override
  Future<TaskModel> updateTask(TaskModel task) async {
    final tasks = await getTasks();

    for (int i = 0; i < tasks.length; i++) {
      if (tasks[i].id == task.id) {
        tasks[i] = task;
        await sharedPreferences.setString(
            sharedPreferenceStorageKey, jsonEncode(tasks));
        return task;
      }
    }

    throw CacheException.cacheNotFound();
  }

  @override
  Future<TaskModel> deleteTask(String id) async {
    final tasks = await getTasks();

    final task = await getTask(id);

    tasks.removeWhere((element) => element.id == id);

    await sharedPreferences.setString(
        sharedPreferenceStorageKey, jsonEncode(tasks));

    return task;
  }
}
