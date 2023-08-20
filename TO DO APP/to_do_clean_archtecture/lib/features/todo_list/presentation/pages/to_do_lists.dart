import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/task_bloc.dart';
import '../widgets/app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/loading.dart';
import '../widgets/snackbar.dart';
import '../widgets/tasks_list_view.dart';
import 'add_tasks.dart';

class TaskListScreen extends StatefulWidget {
  static const routeName = '/tasks';

  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Todo List'),
      body: BlocProvider(
        create: (context) =>
            serviceLocator<TaskBloc>()..add(LoadAllTasksEvent()),
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, _) => buildBody(context),
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // top image
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .25,
            child: Image.asset(
              'assets/to_do_list.png',
            ),
          ),
          const SizedBox(height: 30),

          // Title
          Text(
            'Tasks list',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 10),

          // Tasks list
          BlocConsumer<TaskBloc, TaskState>(
            buildWhen: (previous, current) => current is! ErrorState,

            //
            listener: (context, state) {
              if (state is ErrorState) {
                showError(context, state.message);
              }
            },

            //
            builder: (context, state) {
              // task loading
              if (state is LoadingState) {
                return const LoadingWidget();
              }

              // tasks loaded
              else if (state is LoadedAllTasksState) {
                return TasksListView(tasks: state.tasks);
              }

              return const CircularProgressIndicator();
            },
          ),

          const SizedBox(height: 30),

          // Create task button
          Center(
            child: CustomButton(
              label: 'Create task',
              onPressed: () async {
                await Navigator.pushNamed(context, CreateTaskScreen.routeName);

                if (mounted) {
                  context.read<TaskBloc>().add(LoadAllTasksEvent());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
