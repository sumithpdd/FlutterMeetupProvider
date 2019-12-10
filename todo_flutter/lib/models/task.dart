import 'package:flutter/foundation.dart';

class Task {
  final String id;
  final String name;
  bool isDone;
  //Constructor
  Task({@required this.id, @required this.name, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
