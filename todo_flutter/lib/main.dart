import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task_data.dart';
import './screens/tasks_screen.dart';
void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => TaskData(),
          child: MaterialApp(
        title: 'Todo App',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            accentColor: Colors.lightBlueAccent
        ),
        home: TasksScreen(),
      ),
    );
  }
}
 