import 'package:dartz/dartz.dart' hide Task;
import 'package:equatable/equatable.dart';
import 'package:to_do_clean_archtecture/core/errors/failures.dart';
import 'package:to_do_clean_archtecture/core/usecase/usecase.dart';
import 'package:to_do_clean_archtecture/features/todo_list/domain/entities/tasks.dart';
import 'package:to_do_clean_archtecture/features/todo_list/domain/repository/todo_list_repository.dart';

class ViewTask extends UseCase<Task, GetTaskParams> {
  final TaskRepository repository;

  ViewTask(this.repository);

  @override
  Future<Either<Failure, Task>> call(GetTaskParams params) async {
    return await repository.getTask(params.id);
  }
}

class GetTaskParams extends Equatable {
  final int id;

  GetTaskParams({required this.id});

  @override
  List<Object?> get props => [id];
}
