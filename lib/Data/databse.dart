import 'package:hive_flutter/hive_flutter.dart';

class TODodatabase {
  List toDoList = [];

  // reference the box

  final _myBox = Hive.box('mybox');

  // run this if first time openning the App

  void createIntitialData() {
    toDoList = [
      ["Do DSA", false],
      ["Do Exercise", false],
    ];
  }

  // load data from database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }
  // update the database

  void updateDatabse() {
    _myBox.put("TODOLIST", toDoList);

  }
}
