
import 'package:hive/hive.dart';

class TodoListDatabase {
  List todoList = [];

  // Box reference
  final _myBox = Hive.box("box");

  // Run app 1st time
  void createInitialList() {
    todoList = [
      ["Task #01", false],
      ["Task #02", false]
    ];
  }

  void loadData() {
    todoList = _myBox.get("todolist");
  }

  void updateList() {
    _myBox.put("todolist", todoList);
  }
}