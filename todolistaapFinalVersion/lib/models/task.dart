class Task {
  final String id; // Unique identifier
  String description;
  String? location;
  String? imagePath;
  bool isCompleted;

  Task({
    required this.id,
    required this.description,
    this.location,
    this.imagePath,
    this.isCompleted = false,
  });

  void toggleCompletion() {
    isCompleted = !isCompleted;
  }
}
