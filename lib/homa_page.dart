import 'package:flutter/material.dart';
import 'package:todo_app/utilities/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List of todo tasks
  List toDoList = [
    ["Make Tutorial", false],
    ["Do Exercise", false],
    ["Play Cricket",true],
    ["Do DSA",true]
  ];
 
   // checkBox  tapped

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Center(child: Text('TO DO')),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return TODOTile(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged : (value) => checkBoxChanged,
              );
        },
      ),
    );
  }
}
