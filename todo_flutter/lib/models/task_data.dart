import 'package:flutter/foundation.dart';
import 'task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(id:"1",name: 'Buy milk'),
    Task(id:"2",name: 'Buy eggs'),
    Task(id:"3",name: 'Buy bread'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }
  int get taskCount {
    return _tasks.length;
  }
 void addTask(String newTaskTitle) {
    final task = Task(id: DateTime.now().toString(), name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }
  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(String taskId) {
    _tasks.removeWhere((task)=> task.id ==taskId);
    notifyListeners();
  }
}
