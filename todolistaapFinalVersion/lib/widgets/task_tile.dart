import 'package:flutter/material.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import '../models/task_data.dart';
import '../screens/task_details_screen.dart';

class TaskTile extends StatelessWidget {
  final String taskId; // Add taskId to uniquely identify the task
  final String taskDescription;
  final String? taskLocation;
  final String? taskImage;
  final bool isChecked;
  final void Function(bool?)? checkboxCallback;

  TaskTile({
    required this.taskId, // Pass taskId to the constructor
    required this.taskDescription,
    this.taskLocation,
    this.taskImage,
    required this.isChecked,
    this.checkboxCallback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskDescription,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: taskLocation != null ? Text('Location: $taskLocation') : null,
      leading: taskImage != null
          ? Image.file(
              File(taskImage!),
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            )
          : null,
      trailing: Checkbox(
        value: isChecked,
        onChanged: checkboxCallback,
      ),
      onTap: () {
        // Navigate to the Task Details Screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TaskDetailsScreen(taskId: taskId),
          ),
        );
      },
    );
  }
}
