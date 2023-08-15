import 'package:flutter/material.dart';
import 'package:to_do_clean_archtecture/features/get_started.dart';
import 'package:to_do_clean_archtecture/features/to_do_lists.dart';
import 'package:to_do_clean_archtecture/features/add_tasks.dart';
import 'package:to_do_clean_archtecture/features/task_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => GetStartedPage(),
        '/create': (context) => CreateTodo(),
        '/details': (context) => ViewDetails(),
        '/all': (context) => TodoList()
      },
    );
  }
}
