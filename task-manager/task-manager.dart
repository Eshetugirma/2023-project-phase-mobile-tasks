import 'dart:io';

class Task {
  String title;
  String description;
  DateTime dueDate;
  bool isCompleted;

  Task(this.title, this.description, this.dueDate, this.isCompleted);

  @override
  String toString() {
    String status = isCompleted ? 'Completed' : 'Pending';
    return 'Title: $title\nDescription: $description\nDue Date: ${_formatDate(dueDate)}\nStatus: $status\n';
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}

class TaskManager {
  List<Task> tasks = [];

  void addTask(Task task) {
    tasks.add(task);
  }

  void viewAllTasks() {
    if (tasks.isEmpty) {
      print('No tasks found.');
    } else {
      for (var i = 0; i < tasks.length; i++) {
        print('Task ${i + 1}:\n${tasks[i]}');
      }
    }
  }

  void viewCompletedTasks() {
    List<Task> completedTasks =
        tasks.where((task) => task.isCompleted).toList();
    if (completedTasks.isEmpty) {
      print('No completed tasks found.');
    } else {
      for (var i = 0; i < completedTasks.length; i++) {
        print('Completed Task ${i + 1}:\n${completedTasks[i]}');
      }
    }
  }

  void viewPendingTasks() {
    List<Task> pendingTasks = tasks.where((task) => !task.isCompleted).toList();
    if (pendingTasks.isEmpty) {
      print('No pending tasks found.');
    } else {
      for (var i = 0; i < pendingTasks.length; i++) {
        print('Pending Task ${i + 1}:\n${pendingTasks[i]}');
      }
    }
  }

  void editTask(int taskIndex,
      {String? title,
      String? description,
      DateTime? dueDate,
      bool? isCompleted}) {
    if (taskIndex < 0 || taskIndex >= tasks.length) {
      print('Invalid task index.');
    } else {
      Task task = tasks[taskIndex];
      task.title = title ?? task.title;
      task.description = description ?? task.description;
      task.dueDate = dueDate ?? task.dueDate;
      task.isCompleted = isCompleted ?? task.isCompleted;
      print('Task ${taskIndex + 1} edited successfully.');
    }
  }

  void deleteTask(int taskIndex) {
    if (taskIndex < 0 || taskIndex >= tasks.length) {
      print('Invalid task index.');
    } else {
      tasks.removeAt(taskIndex);
      print('Task ${taskIndex + 1} deleted successfully.');
    }
  }
}

void main() {
  final taskManager = TaskManager();

  while (true) {
    print('\nOptions:');
    print('1. Add a new task');
    print('2. View all tasks');
    print('3. View completed tasks');
    print('4. View pending tasks');
    print('5. Edit a task');
    print('6. Delete a task');
    print('7. Exit');
    stdout.write('Enter your choice: ');

    var choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        stdout.write('Enter task title: ');
        var title = stdin.readLineSync()!;
        stdout.write('Enter task description: ');
        var description = stdin.readLineSync()!;
        stdout.write('Enter due date (yyyy-mm-dd): ');
        var dueDateStr = stdin.readLineSync()!;
        var dueDate = DateTime.parse(dueDateStr);
        taskManager.addTask(Task(title, description, dueDate, false));
        print('Task added successfully.');
        break;
      case 2:
        taskManager.viewAllTasks();
        break;
      case 3:
        taskManager.viewCompletedTasks();
        break;
      case 4:
        taskManager.viewPendingTasks();
        break;
      case 5:
        stdout.write('Enter the task index to edit: ');
        var taskIndex = int.parse(stdin.readLineSync()!);
        taskIndex -= 1;
        stdout.write(
            'Enter new task title (press enter to keep the current title): ');
        var newTitle = stdin.readLineSync()!;
        stdout.write(
            'Enter new task description (press enter to keep the current description): ');
        var newDescription = stdin.readLineSync()!;
        stdout.write(
            'Enter new due date (yyyy-mm-dd) (press enter to keep the current due date): ');
        var newDueDateStr = stdin.readLineSync()!;
        DateTime? newDueDate;
        if (newDueDateStr.isNotEmpty) {
          newDueDate = DateTime.parse(newDueDateStr);
        }
        stdout.write('Is the task completed? (y/n): ');
        var isCompletedStr = stdin.readLineSync()!;
        var isCompleted = isCompletedStr.toLowerCase().startsWith('y');
        taskManager.editTask(taskIndex,
            title: newTitle,
            description: newDescription,
            dueDate: newDueDate,
            isCompleted: isCompleted);
        break;
      case 6:
        stdout.write('Enter the task index to delete: ');
        var taskIndexToDelete = int.parse(stdin.readLineSync()!);
        taskIndexToDelete -= 1;
        taskManager.deleteTask(taskIndexToDelete);
        break;
      case 7:
        print('Exiting the Task Manager.');
        return;
      default:
        print('Invalid option. Please try again.');
        break;
    }
  }
}
