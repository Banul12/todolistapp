import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';
import '../screens/task_details_screen.dart';
import '../widgets/task_tile.dart';

class TaskListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskData = Provider.of<TaskData>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('All Tasks'),
      ),
      body: taskData.taskCount == 0
          ? Center(child: Text('No tasks available!'))
          : ListView.builder(
              itemCount: taskData.taskCount,
              itemBuilder: (context, index) {
                final task = taskData.tasks[index];
                return TaskTile(
                  taskId: task.id,
                  taskDescription: task.description,
                  taskLocation: task.location,
                  taskImage: task.imagePath,
                  isChecked: task.isCompleted,
                  checkboxCallback: (newValue) {
                    taskData.toggleTaskCompletion(task);
                  },
                );
              },
            ),
    );
  }
}
