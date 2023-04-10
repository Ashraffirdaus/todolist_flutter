// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
   ToDoTile(
    {super.key, 
   required this.taskName,
   required this.taskCompleted, 
   required this.onChanged,
   required this.taskDeletedButton,
   });

  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function()? taskDeletedButton;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(taskName),
      leading:Checkbox(value: taskCompleted, onChanged: onChanged), 
       trailing: IconButton(onPressed: taskDeletedButton, icon: const Icon(Icons.delete)),
    );
  }
}