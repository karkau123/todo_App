import 'package:flutter/material.dart';
class TODOTile extends StatelessWidget {
    TODOTile({super.key,
    required this.taskName,
    required this.taskCompleted,
     required this.onChanged
     });

  final String taskName;
  final bool taskCompleted;
  Function(bool?)?onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25,right: 25,top: 25),
      child: Container(
        padding: EdgeInsets.all(24),
        child: Row(
          children: [
            // chekBox
             Checkbox(
              value: taskCompleted, 
              onChanged: onChanged,
              activeColor: Colors.black,
             checkColor: Colors.white,
              ),
             Text(
              taskName,
              style:TextStyle(decoration: taskCompleted ? TextDecoration.lineThrough: TextDecoration.none),
              
              ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
