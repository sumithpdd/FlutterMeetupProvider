import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task_data.dart';
import 'package:todo_flutter/widgets/task_tile.dart';

class TasksList extends StatefulWidget {
  TasksList();

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
            taskTitle: Provider.of<TaskData>(context).tasks[index].name,
            isChecked: Provider.of<TaskData>(context).tasks[index].isDone,
            //Callback
            checkboxCallback: (checkboxState) {
              setState(() {
                Provider.of<TaskData>(context).tasks[index].toggleDone();
              });
            });
      },
      itemCount: Provider.of<TaskData>(context).tasks.length,
    );
  }
}
