import 'package:dartz/dartz.dart';
import 'package:to_do_clean_archtecture/core/errors/failures.dart';
// import 'package:to_do_clean_archtecture/features/todo_list/domain/entities/tasks.dart';
import 'package:to_do_clean_archtecture/core/usecase/usecase.dart';
import 'package:to_do_clean_archtecture/features/todo_list/domain/repository/todo_list_repository.dart';

class DeleteTask implements UseCase<void, int> {
  final TaskRepository repository;

  DeleteTask(this.repository);

  @override
  Future<Either<Failure, void>> call(int id) async {
    final result = await repository.deleteTask(id);
    return result.fold(
      (failure) => Left(failure),
      (_) => Right(null),
    );
  }
}
