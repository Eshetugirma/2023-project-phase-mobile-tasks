import 'package:flutter/material.dart';

class CreateTaskScreen extends StatefulWidget {
  static const routeName = '/create-task';

  @override
  _CreateTaskScreenState createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final dueDateController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    dueDateController.dispose();
    super.dispose();
  }

  void _saveTask() {
    if (_formKey.currentState!.validate()) {
      final title = titleController.text;
      final description = descriptionController.text;
      final dueDate = dueDateController.text;

      // TODO: Add logic to save the task

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create a Task"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Title",
                ),
                controller: titleController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a title.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Description",
                ),
                controller: descriptionController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a description.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Due Date",
                ),
                controller: dueDateController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a due date.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: _saveTask,
                child: Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
