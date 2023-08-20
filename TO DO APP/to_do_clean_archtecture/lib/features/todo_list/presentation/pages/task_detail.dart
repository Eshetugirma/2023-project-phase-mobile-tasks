import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/util/input_converter.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/tasks.dart';
import '../bloc/task_bloc.dart';
import '../widgets/app_bar.dart';
import '../widgets/loading.dart';
import '../widgets/snackbar.dart';
import '../widgets/task_detail_card.dart';
import 'add_tasks.dart';

class TaskDetailScreen extends StatelessWidget {
  static const routeName = '/task-detail';

  final String taskId;

  const TaskDetailScreen({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          serviceLocator<TaskBloc>()..add(GetSingleTaskEvent(taskId)),
      child: BlocConsumer<TaskBloc, TaskState>(
        listener: (context, state) {
          if (state is UpdatedTaskState) {
            final message = state.task.status ? 'complete' : 'incomplete';
            showSuccess(context, 'Task marked as $message');
            Navigator.of(context).pop();
          } else if (state is DeletedTaskState) {
            showSuccess(context, 'Task deleted successfully');
            Navigator.of(context).pop();
          } else if (state is ErrorState) {
            showError(context, state.message);
          }
        },
        buildWhen: (previous, current) => current is! ErrorState,
        builder: (context, state) {
          if (state is LoadedSingleTaskState) {
            return Scaffold(
              appBar: CustomAppBar(
                title: 'Task detail',
                actions: buildActions(context, state.task),
              ),

              //
              body: buildBody(context, state.task),
            );
          }
          return const LoadingWidget();
        },
      ),
    );
  }

  List<Widget> buildActions(BuildContext context, Task task) {
    return [
      PopupMenuButton(
        onSelected: (value) async {
          if (value == 'edit') {
            final taskBloc = context.read<TaskBloc>();

            await Navigator.pushNamed(context, CreateTaskScreen.routeName,
                arguments: task);

            taskBloc.add(GetSingleTaskEvent(taskId));
          } else if (value == 'toggle_complete') {
            context.read<TaskBloc>().add(UpdateTaskEvent(task.id, task.title,
                task.description, task.dueDate.toString(), !task.status));
          } else if (value == 'delete') {
            context.read<TaskBloc>().add(DeleteTaskEvent(task.id));
          }
        },
        icon: const Icon(Icons.more_vert),
        itemBuilder: (_) => [
          PopupMenuItem(
            value: 'edit',
            child: Text('Edit', style: Theme.of(context).textTheme.bodySmall),
          ),
          PopupMenuItem(
            value: 'toggle_complete',
            child: Text(task.status ? 'Mark as incomplete' : 'Mark as complete',
                style: Theme.of(context).textTheme.bodySmall),
          ),
          PopupMenuItem(
            value: 'delete',
            child: Text('Delete', style: Theme.of(context).textTheme.bodySmall),
          ),
        ],
      )
    ];
  }

  Widget buildBody(BuildContext context, Task task) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .3,
            child: Image.asset(
              'assets/view_lists.png',
            ),
          ),

          //
          const SizedBox(height: 30),
          TaskDetailCard(title: 'Title', content: task.title),

          //
          const SizedBox(height: 20),
          TaskDetailCard(title: 'Description', content: task.description),

          //
          const SizedBox(height: 20),
          TaskDetailCard(
              title: 'Deadline',
              content: serviceLocator<InputConverter>()
                  .dateTimeToString(task.dueDate)),
        ],
      ),
    );
  }
}
