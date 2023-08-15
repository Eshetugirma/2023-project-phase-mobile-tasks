import 'package:dartz/dartz.dart' hide Task;
import 'package:to_do_app/core/errors/failures.dart';
import 'package:to_do_app/features/todo_list/domain/entities/tasks.dart';

abstract class TaskRepository {
  Future<Either<Failure, List<Task>>> getAllTasks();
  Future<Either<Failure, Task>> getTask(int id);
  Future<Either<Failure, void>> addTask(Task task);
  Future<Either<Failure, void>> updateTask(Task task);
  Future<Either<Failure, void>> deleteTask(int id);
}
