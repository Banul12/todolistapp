import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';

class EditTaskScreen extends StatefulWidget {
  final String taskId;

  EditTaskScreen({required this.taskId});

  @override
  _EditTaskScreenState createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late String _editedDescription;
  late String _editedLocation;

  @override
  void initState() {
    super.initState();
    // Fetch the task details based on the taskId
    final taskData = Provider.of<TaskData>(context, listen: false);
    final task = taskData.tasks.firstWhere((task) => task.id == widget.taskId);
    _editedDescription = task.description;
    _editedLocation = task.location ?? ''; // Ensure location is not null
  }

  void _saveEditedTask() {
    // Update the task using TaskData
    Provider.of<TaskData>(context, listen: false)
        .editTask(widget.taskId, _editedDescription, _editedLocation);
    Navigator.pop(context); // Navigate back to the previous screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Task Description'),
              controller: TextEditingController(text: _editedDescription),
              onChanged: (value) {
                _editedDescription = value;
              },
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Location'),
              controller: TextEditingController(text: _editedLocation),
              onChanged: (value) {
                _editedLocation = value;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveEditedTask,
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
