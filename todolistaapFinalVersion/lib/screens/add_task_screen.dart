import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../models/task_data.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  File? _image;

  // Function to fetch user's current location
  Future<void> _getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      locationController.text = '${position.latitude}, ${position.longitude}';
    });
  }

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  // Function to save the task
  void _saveTask() {
    if (descriptionController.text.isNotEmpty) {
      // Generate a unique ID for the new task
      String taskId = Uuid().v4();

      // Save the task using TaskData
      Provider.of<TaskData>(context, listen: false).addTask(
        taskId, // Pass the taskId
        descriptionController.text, // Non-nullable string
        locationController.text.isNotEmpty
            ? locationController.text
            : '', // Ensure non-nullable
        _image?.path,
      );
      Navigator.pop(context); // Navigate back to the Home Screen after saving
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a task description.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Task Description',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _getLocation,
              child: Text('Attach Location'),
            ),
            TextField(
              controller: locationController,
              decoration: InputDecoration(
                labelText: 'Location',
                border: OutlineInputBorder(),
              ),
              readOnly: true, // Make it read-only
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Attach Image'),
            ),
            _image != null
                ? Image.file(
                    _image!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  )
                : Container(),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _saveTask,
              child: Text('Save Task'),
            ),
          ],
        ),
      ),
    );
  }
}
