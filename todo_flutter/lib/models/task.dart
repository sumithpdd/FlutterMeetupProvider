class Task {
  final String name;
  bool isDone;
  //Constructor
  Task({this.name, this.isDone = false});
  
  void toggleDone() {
    isDone = !isDone;
  }
}
