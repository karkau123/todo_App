import 'package:flutter/material.dart';
import 'package:todo_app/Data/databse.dart';
import 'package:todo_app/utilities/dialog_box.dart';
import 'package:todo_app/utilities/todo_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference hive box
  final _myBox = Hive.box('mybox');
  TODodatabase db = TODodatabase();
  @override
  void initState() {
    // if this is first time open the appp
    if (_myBox.get("TODOLIST") == null) {
      db.createIntitialData();
    } else {
      // there already exhishts data
      db.loadData();
    }
    super.initState();
  }

  //text Controller
  final _controller = TextEditingController();

  // List of todo tasks
  ////  List toDoList = [];

  // checkBox  tapped
  void checkBoxchanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabse();
  }

  // save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false, _controller.clear()]);
      Navigator.of(context).pop();
       db.updateDatabse();
    });
  }

  // create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
     db.updateDatabse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Center(child: Text('TO DO')),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
        backgroundColor: Colors.yellow,
      ),
      body: db.toDoList.length != 0
          ? ListView.builder(
              itemCount: db.toDoList.length,
              itemBuilder: (context, index) {
                return TODOTile(
                  taskName: db.toDoList[index][0],
                  taskCompleted: db.toDoList[index][1],
                  onChanged: (value) => checkBoxchanged(value, index),
                  deleteFunction: (context) => deleteTask(index),
                );
              },
            )
          : Center(child: Text("No Tasks Added ! Add few to get Started")),
    );
  }
}
