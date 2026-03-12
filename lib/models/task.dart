class Task {
  String title;
  String description;
  String priority;
  String category;
  DateTime deadline;
  String status;

  Task({
    required this.title,
    required this.description,
    required this.priority,
    required this.category,
    required this.deadline,
    this.status = "Pending",
  });
}
