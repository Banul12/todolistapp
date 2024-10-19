import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';
import '../widgets/task_tile.dart';
import 'add_task_screen.dart'; // Import your Add Task Screen

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskData = Provider.of<TaskData>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
      ),
      body: taskData.taskCount == 0
          ? Center(
              child: Text('No tasks yet!'),
            )
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
                  // deleteCallback: () {
                  //   // Handle the delete action
                  //   taskData.deleteTask(task);
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     SnackBar(
                  //       content: Text('${task.description} deleted'),
                  //     ),
                  //   );
                  // },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the Add Task Screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
