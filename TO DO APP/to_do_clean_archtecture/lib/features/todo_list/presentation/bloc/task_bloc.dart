import 'package:dartz/dartz.dart' hide Task;
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/messages.dart';
import '../../../../core/presentation/util/input_converter.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/tasks.dart';
import '../../domain/usecases/usecases.dart' as usecases;

part 'task_event.dart';
part 'task_state.dart';

/// Bloc for managing [Task]s
///
/// Delegates to [usecases.CreateTask], [usecases.DeleteTask], [usecases.UpdateTask], [usecases.GetTask], [usecases.GetAllTasks]
/// for creating, deleting, updating, getting, and getting all [Task]s

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final usecases.GetTask getTask;
  final usecases.GetAllTasks getTasks;
  final usecases.CreateTask createTask;
  final usecases.UpdateTask updateTask;
  final usecases.DeleteTask deleteTask;

  final InputConverter inputConverter;

  TaskBloc({
    required this.createTask,
    required this.deleteTask,
    required this.updateTask,
    required this.getTask,
    required this.getTasks,
    required this.inputConverter,
  }) : super(InitialState()) {
    //
    //
    // Handle [LoadAllTasksEvent]
    on<LoadAllTasksEvent>((event, emit) async {
      emit(LoadingState());

      final stream = getTasks(NoParams());

      await emit.forEach(stream, onData: (result) {
        late TaskState state;

        result.fold(
          (failure) {
            state = ErrorState(mapFailureToMessage(failure));
          },
          (task) {
            state = LoadedAllTasksState(task);
          },
        );

        return state;
      });
    });

    //
    // Handle [GetSingleTaskEvent]
    on<GetSingleTaskEvent>((event, emit) async {
      emit(LoadingState());

      final stream = getTask(usecases.GetTaskParams(id: event.id));

      await emit.forEach(stream, onData: (result) {
        late TaskState state;

        result.fold(
          (failure) {
            state = ErrorState(mapFailureToMessage(failure));
          },
          (task) {
            state = LoadedSingleTaskState(task);
          },
        );

        return state;
      });
    });

    //
    // Hanlde [CreateTaskEvent]
    on<CreateTaskEvent>((event, emit) async {
      final parsedDate =
          inputConverter.stringToDateTime(event.date, future: true);

      parsedDate.fold(
          (failure) => emit(ErrorState(mapFailureToMessage(failure))),
          (right) => null);

      if (parsedDate.isLeft()) return;

      final task = Task(
          id: '',
          title: event.title,
          description: event.description,
          status: false,
          dueDate: (parsedDate as Right).value);

      final stream = createTask(usecases.CreateParams(task: task));

      await emit.forEach(stream, onData: (result) {
        late TaskState state;

        result.fold(
          (failure) {
            state = ErrorState(mapFailureToMessage(failure));
          },
          (task) {
            state = CreatedTaskState(task);
          },
        );

        return state;
      });
    });

    //
    // Handle [UpdateTaskEvent]
    on<UpdateTaskEvent>((event, emit) async {
      final parsedDate =
          inputConverter.stringToDateTime(event.date, future: true);

      parsedDate.fold(
          (failure) => emit(ErrorState(mapFailureToMessage(failure))),
          (right) => null);

      if (parsedDate.isLeft()) return;

      // If date is valid, update task
      final task = Task(
          id: event.id,
          title: event.title,
          description: event.description,
          status: event.completed,
          dueDate: (parsedDate as Right).value);

      final stream = updateTask(usecases.UpdateParams(task: task));

      await emit.forEach(stream, onData: (result) {
        late TaskState state;

        result.fold(
          (failure) {
            state = ErrorState(mapFailureToMessage(failure));
          },
          (task) {
            state = UpdatedTaskState(task);
          },
        );

        return state;
      });
    });

    //
    // Hanlde [DeleteTaskEvent]
    on<DeleteTaskEvent>((event, emit) async {
      final stream = deleteTask(usecases.DeleteParams(id: event.id));

      await emit.forEach(stream, onData: (result) {
        late TaskState state;

        result.fold(
          (failure) {
            state = ErrorState(mapFailureToMessage(failure));
          },
          (task) {
            state = DeletedTaskState(task);
          },
        );

        return state;
      });
    });
  }
}
