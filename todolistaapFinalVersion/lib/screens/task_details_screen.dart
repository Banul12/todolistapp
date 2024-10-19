import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';
import 'edit_task_screen.dart';
import 'dart:io';

class TaskDetailsScreen extends StatelessWidget {
  final String taskId;

  TaskDetailsScreen({required this.taskId});

  @override
  Widget build(BuildContext context) {
    final taskData = Provider.of<TaskData>(context);
    final task = taskData.tasks.firstWhere((task) => task.id == taskId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Task Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.description,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            task.location != null
                ? Text('Location: ${task.location}')
                : Container(),
            SizedBox(height: 10),
            if (task.imagePath != null)
              Image.file(
                File(task.imagePath!),
                fit: BoxFit.cover,
                height: 200,
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to EditTaskScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditTaskScreen(taskId: task.id),
                  ),
                );
              },
              child: Text('Edit Task'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Logic to delete the task
                Provider.of<TaskData>(context, listen: false).deleteTask(task);
                Navigator.pop(context); // Navigate back after deletion
              },
              child: Text('Delete Task'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red), // Updated line
            ),
          ],
        ),
      ),
    );
  }
}
