part of 'task_bloc.dart';

sealed class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

/// Task initial state
final class InitialState extends TaskState {}

/// Task loading state
final class LoadingState extends TaskState {}

/// Single task loaded state with [task] being the loaded task
final class LoadedSingleTaskState extends TaskState {
  final Task task;

  const LoadedSingleTaskState(this.task);

  @override
  List<Object> get props => [task];
}

/// All task loaded state with [tasks] being the loaded tasks
final class LoadedAllTasksState extends TaskState {
  final List<Task> tasks;

  const LoadedAllTasksState(this.tasks);

  @override
  List<Object> get props => [tasks];
}

/// New task created state with [task] being the created tasks
final class CreatedTaskState extends TaskState {
  final Task task;

  const CreatedTaskState(this.task);

  @override
  List<Object> get props => [task];
}

/// Task updated state with [task] being the updated tasks
final class UpdatedTaskState extends TaskState {
  final Task task;

  const UpdatedTaskState(this.task);

  @override
  List<Object> get props => [task];
}

/// Task deleted state with [task] being the deleted tasks
final class DeletedTaskState extends TaskState {
  final Task task;

  const DeletedTaskState(this.task);

  @override
  List<Object> get props => [task];
}

/// Error state with [message] being error message
final class ErrorState extends TaskState {
  final String message;

  const ErrorState(this.message);

  @override
  List<Object> get props => [message];
}
