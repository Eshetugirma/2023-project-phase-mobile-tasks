import 'package:dartz/dartz.dart' hide Task;
import 'package:to_do_app/core/errors/failures.dart';
import 'package:to_do_app/core/usecase/usecase.dart';
import 'package:to_do_app/features/todo_list/domain/entities/tasks.dart';
import 'package:to_do_app/features/todo_list/domain/repository/todo_list_repository.dart';

class ViewAllTasks extends UseCase<List<Task>, NoParams> {
  final TaskRepository repository;

  ViewAllTasks(this.repository);

  @override
  Future<Either<Failure, List<Task>>> call(NoParams params) async {
    return await repository.getAllTasks();
  }
}
