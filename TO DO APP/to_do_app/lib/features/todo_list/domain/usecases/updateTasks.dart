import 'package:dartz/dartz.dart' hide Task;
import 'package:to_do_app/core/errors/failures.dart';
import 'package:to_do_app/features/todo_list/domain/entities/tasks.dart';
import 'package:to_do_app/core/usecase/usecase.dart';
import 'package:to_do_app/features/todo_list/domain/repository/todo_list_repository.dart';

class CreateTask implements UseCase<void, Task> {
  final TaskRepository repository;

  CreateTask(this.repository);

  @override
  Future<Either<Failure, void>> call(Task task) async {
    return await repository.addTask(task);
  }
}
