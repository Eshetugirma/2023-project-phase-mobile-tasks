import 'dart:async';

import 'package:dartz/dartz.dart' hide Task;

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/tasks.dart';
import '../../domain/repository/todo_list_repository.dart';
import '../data_sources/task_local_data_source.dart';
import '../data_sources/task_remote_data_source.dart';
import '../models/task_model.dart';

/// Implementation of [TaskRepository]
///
/// Uses [TaskLocalDataSource] and [TaskRemoteDataSource] to perform CRUD operations
///
/// Uses [NetworkInfo] to check network connection

class TaskRepositoryImpl extends TaskRepository {
  final TaskLocalDataSource localDataSource;
  final TaskRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  TaskRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Stream<Either<Failure, Task>> createTask(Task task) {
    final controller = StreamController<Either<Failure, Task>>();

    networkInfo.isConnected.then((isConnected) async {
      if (isConnected) {
        try {
          final taskModel = await remoteDataSource.createTask(task.toModel());

          try {
            await localDataSource.createTask(taskModel);
            controller.add(Right(taskModel.toEntity()));
          } on CacheException catch (e) {
            controller.add(Left(CacheFailure.fromException(e)));
          }
        } on ServerException catch (e) {
          controller.add(Left(ServerFailure.fromException(e)));
        }
      } else {
        controller.add(Left(ServerFailure.connectionFailed()));
      }
    });

    return controller.stream;
  }

  @override
  Stream<Either<Failure, Task>> deleteTask(String id) {
    final controller = StreamController<Either<Failure, Task>>();

    networkInfo.isConnected.then((isConnected) async {
      if (isConnected) {
        try {
          final taskModel = await remoteDataSource.deleteTask(id);

          try {
            await localDataSource.deleteTask(id);
            controller.add(Right(taskModel.toEntity()));
          } on CacheException catch (e) {
            controller.add(Left(CacheFailure.fromException(e)));
          }
        } on ServerException catch (e) {
          controller.add(Left(ServerFailure.fromException(e)));
        }
      } else {
        controller.add(Left(ServerFailure.connectionFailed()));
      }
    });

    return controller.stream;
  }

  @override
  Stream<Either<Failure, Task>> getTask(String id) {
    final controller = StreamController<Either<Failure, Task>>();

    localDataSource.getTask(id).then((taskModel) {
      controller.add(Right(taskModel.toEntity()));
    }).catchError((exception) {
      controller.add(Left(CacheFailure.fromException(exception)));
    });

    networkInfo.isConnected.then((isConnected) async {
      if (isConnected) {
        try {
          final taskModel = await remoteDataSource.getTask(id);
          controller.add(Right(taskModel.toEntity()));
        } on ServerException catch (e) {
          controller.add(Left(ServerFailure.fromException(e)));
        }
      }
    });

    return controller.stream;
  }

  @override
  Stream<Either<Failure, List<Task>>> getTasks() {
    final controller = StreamController<Either<Failure, List<Task>>>();

    localDataSource.getTasks().then((taskModels) {
      final tasks = taskModels.map((e) => e.toEntity()).toList();
      controller.add(Right(tasks));
    }).catchError((exception) {
      controller.add(Left(CacheFailure.fromException(exception)));
    });

    networkInfo.isConnected.then((isConnected) async {
      if (isConnected) {
        try {
          final taskModels = await remoteDataSource.getTasks();

          await localDataSource.cacheTasks(taskModels);

          final tasks = taskModels.map((e) => e.toEntity()).toList();

          controller.add(Right(tasks));
        } on ServerException catch (e) {
          controller.add(Left(ServerFailure.fromException(e)));
        }
      }
    });

    return controller.stream;
  }

  @override
  Stream<Either<Failure, Task>> updateTask(Task task) {
    final controller = StreamController<Either<Failure, Task>>();

    networkInfo.isConnected.then((isConnected) async {
      if (isConnected) {
        try {
          final updatedTask = await remoteDataSource.updateTask(task.toModel());

          try {
            await localDataSource.updateTask(updatedTask);
            controller.add(Right(updatedTask.toEntity()));
          } on CacheException catch (e) {
            controller.add(Left(CacheFailure.fromException(e)));
          }
        } on ServerException catch (e) {
          controller.add(Left(ServerFailure.fromException(e)));
        }
      } else {
        controller.add(Left(ServerFailure.connectionFailed()));
      }
    });

    return controller.stream;
  }
}
