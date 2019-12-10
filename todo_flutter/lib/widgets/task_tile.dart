import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task.dart';
import 'package:todo_flutter/models/task_data.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final Function checkboxCallback;

  TaskTile({this.task, this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: ValueKey(task.id),
        background: Container(
          color: Theme.of(context).errorColor,
          child: Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          ),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 20),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        ),
        direction: DismissDirection.endToStart,
        confirmDismiss: (direction) {
          return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text('Are you sure?'),
              content: Text('Do you want to remove the task?'),
              actions: <Widget>[
                FlatButton(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.of(ctx).pop(false);
                  },
                ),
                FlatButton(
                  child: Text('Yes'),
                  onPressed: () {
                    Navigator.of(ctx).pop(true);
                  },
                )
              ],
            ),
          );
        },
        onDismissed: (direction) {
          Provider.of<TaskData>(context, listen: false).deleteTask(task.id);
          Scaffold.of(context).showSnackBar(new SnackBar(
            content: new Text('${task.name} is deleted'),
          ));
        },
        child: ListTile(
          title: Text(
            task.name,
            style: TextStyle(
                decoration: task.isDone ? TextDecoration.lineThrough : null,
                color: Colors.black),
          ),
          trailing: Checkbox(
            activeColor: Theme.of(context).accentColor,
            value: task.isDone,
            onChanged: checkboxCallback,
          ),
        ));
  }
}
