import 'package:dartz/dartz.dart' hide Task;
import 'package:to_do_clean_archtecture/core/errors/failures.dart';
import 'package:to_do_clean_archtecture/features/todo_list/domain/entities/tasks.dart';

abstract class TaskRepository {
  Stream<Either<Failure, List<Task>>> getTasks();
  Stream<Either<Failure, Task>> getTask(String id);
  Stream<Either<Failure, Task>> createTask(Task task);
  Stream<Either<Failure, Task>> updateTask(Task task);
  Stream<Either<Failure, Task>> deleteTask(String id);
}
