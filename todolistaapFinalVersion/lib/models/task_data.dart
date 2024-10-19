import 'package:flutter/foundation.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  int get taskCount => _tasks.length;

  void addTask(
      String id, String description, String location, String? imagePath) {
    final task = Task(
      id: id,
      description: description,
      location: location,
      imagePath: imagePath,
    );
    _tasks.add(task);
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void editTask(String id, String newDescription, String newLocation) {
    Task task = _tasks.firstWhere((task) => task.id == id);
    task.description = newDescription;
    task.location = newLocation;
    notifyListeners();
  }

  void toggleTaskCompletion(Task task) {
    task.isCompleted = !task.isCompleted;
    notifyListeners();
  }
}
