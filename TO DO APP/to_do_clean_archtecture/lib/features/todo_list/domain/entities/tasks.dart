import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String id;
  final String title;
  final String description;
  final DateTime dueDate;
  final bool status;

  const Task({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    this.status = false,
  });

  @override
  List<Object?> get props => [id, title, description, dueDate, status];
}
