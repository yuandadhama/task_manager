import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/viewmodels/task_viewmodels.dart';
import '../models/task.dart';

class DetailTaskScreen extends StatelessWidget {
  final Task task;

  const DetailTaskScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<TaskViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Task Detail")),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Title: ${task.title}", style: TextStyle(fontSize: 18)),

            SizedBox(height: 10),

            Text("Description: ${task.description}"),

            SizedBox(height: 10),

            Text("Priority: ${task.priority}"),

            SizedBox(height: 10),

            Text("Status: ${task.status}"),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                vm.updateStatus(task, "In Progress");
              },
              child: Text("Start Task"),
            ),

            ElevatedButton(
              onPressed: () {
                vm.updateStatus(task, "Done");
              },
              child: Text("Mark Done"),
            ),
          ],
        ),
      ),
    );
  }
}
