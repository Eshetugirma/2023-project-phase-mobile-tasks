import 'package:dartz/dartz.dart' hide Task;
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/tasks.dart';
import '../repository/todo_list_repository.dart';

/// Use case for getting a [Task]
///
/// Uses [TaskRepository] to get a [Task]

class GetTask extends UseCase<Task, GetTaskParams> {
  final TaskRepository _taskRepository;

  GetTask(this._taskRepository);

  @override
  Stream<Either<Failure, Task>> call(GetTaskParams params) {
    return _taskRepository.getTask(params.id);
  }
}

/// Params for getting a [Task]
///
/// Expects the task [id] to be retrieved

class GetTaskParams extends Equatable {
  final String id;

  const GetTaskParams({required this.id});

  @override
  List<Object?> get props => [id];
}
