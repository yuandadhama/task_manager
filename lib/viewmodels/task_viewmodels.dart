import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskViewModel extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void updateStatus(Task task, String status) {
    task.status = status;
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  int get completedTasks => _tasks.where((t) => t.status == "Done").length;

  int get pendingTasks => _tasks.where((t) => t.status != "Done").length;
}
