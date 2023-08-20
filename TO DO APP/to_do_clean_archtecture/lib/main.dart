import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_observer.dart';
import 'features/todo_list/domain/entities/tasks.dart';
import 'features/todo_list/presentation/pages/add_tasks.dart';
import 'features/todo_list/presentation/pages/get_started.dart';
import 'features/todo_list/presentation/pages/task_detail.dart';
import 'features/todo_list/presentation/pages/to_do_lists.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  /// logs bloc events and states
  Bloc.observer = SimpleBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Todo App',
        theme: ThemeData(
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Color(0xFFEE6F57),
            secondary: Color(0xFF0C8CE9),
            surface: Color(0xFFF1EEEE),
            background: Color(0xFFFFFFFF),
            error: Color(0xFFB00020),
            onPrimary: Color(0xFFFFFFFF),
            onSecondary: Color(0xFFFFFFFF),
            onSurface: Color(0xFF000000),
            onBackground: Color(0xFF000000),
            onError: Color(0xFFFFFFFF),
          ),

          //
          // Font
          fontFamily: 'Poppins',
          textTheme: const TextTheme(
            titleSmall: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            titleMedium: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            titleLarge: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            bodySmall: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            bodyMedium: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            bodyLarge: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,

        //
        // Routes
        home: const OnboardingScreen(),
        onGenerateRoute: (settings) {
          // Onboarding screen
          if (settings.name == OnboardingScreen.routeName) {
            return MaterialPageRoute(
              builder: (context) => const OnboardingScreen(),
            );
          }

          // Tasklist screen
          else if (settings.name == TaskListScreen.routeName) {
            return MaterialPageRoute(
              builder: (context) => const TaskListScreen(),
            );
          }

          // Create task screen
          else if (settings.name == CreateTaskScreen.routeName) {
            if (settings.arguments != null) {
              final task = settings.arguments as Task;

              return MaterialPageRoute(
                builder: (context) => CreateTaskScreen(task: task),
              );
            }

            return MaterialPageRoute(
              builder: (context) => CreateTaskScreen(),
            );
          }

          // Task detail screen
          else if (settings.name == TaskDetailScreen.routeName) {
            final taskId = settings.arguments as String;

            return MaterialPageRoute(
              builder: (context) => TaskDetailScreen(taskId: taskId),
            );
          }

          if (kDebugMode) {
            assert(false, 'Need to implement ${settings.name}');
          }

          return null;
        });
  }
}
