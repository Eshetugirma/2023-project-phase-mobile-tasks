import 'dart:async';

import 'package:dartz/dartz.dart' hide Task;

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';

import '../entities/tasks.dart';
import '../repository/todo_list_repository.dart';

/// Use case for getting all [Task]s
///
/// Uses [TaskRepository] to get all [Task]s
/// takes no params
class GetAllTasks extends UseCase<List<Task>, NoParams> {
  final TaskRepository _taskRepository;

  GetAllTasks(this._taskRepository);

  @override
  Stream<Either<Failure, List<Task>>> call(NoParams params) {
    return _taskRepository.getTasks();
  }
}
