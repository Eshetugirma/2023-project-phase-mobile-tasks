part of 'task_bloc.dart';

sealed class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

/// Event for fetching all tasks
final class LoadAllTasksEvent extends TaskEvent {}

/// Event for fetching task with [id]
final class GetSingleTaskEvent extends TaskEvent {
  final String id;

  const GetSingleTaskEvent(this.id);

  @override
  List<Object> get props => [id];
}

/// Event for creating new task with [title], [description] and [date]
final class CreateTaskEvent extends TaskEvent {
  final String title;
  final String description;
  final String date;

  const CreateTaskEvent(this.title, this.description, this.date);

  @override
  List<Object> get props => [title, description, date];
}

/// Event for updating task with [id]
final class UpdateTaskEvent extends TaskEvent {
  final String id;
  final String title;
  final String description;
  final String date;
  final bool completed;

  const UpdateTaskEvent(
      this.id, this.title, this.description, this.date, this.completed);

  @override
  List<Object> get props => [id, title, description, date, completed];
}

/// Event for deleting task with [id]
final class DeleteTaskEvent extends TaskEvent {
  final String id;

  const DeleteTaskEvent(this.id);

  @override
  List<Object> get props => [id];
}
