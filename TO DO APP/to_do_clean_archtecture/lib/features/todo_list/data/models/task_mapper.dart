part of "task_model.dart";

extension TaskMapper on TaskModel {
  Task toEntity() {
    return Task(
        id: id,
        title: title,
        description: description,
        dueDate: dueDate,
        status: completed);
  }
}

extension TaskEntityMapper on Task {
  TaskModel toModel() {
    return TaskModel(
        id: id,
        title: title,
        description: description,
        dueDate: dueDate,
        completed: status);
  }
}
