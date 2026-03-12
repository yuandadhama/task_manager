import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/viewmodels/task_viewmodels.dart';
import '../models/task.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final titleController = TextEditingController();
  final descController = TextEditingController();

  String priority = "Low";
  String category = "Kuliah";
  DateTime deadline = DateTime.now();

  pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: deadline,
      firstDate: DateTime(2023),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        deadline = picked;
      });
    }
  }

  saveTask() {
    final task = Task(
      title: titleController.text,
      description: descController.text,
      priority: priority,
      category: category,
      deadline: deadline,
    );

    Provider.of<TaskViewModel>(context, listen: false).addTask(task);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Task")),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Title"),
            ),

            TextField(
              controller: descController,
              decoration: InputDecoration(labelText: "Description"),
            ),

            DropdownButton(
              value: priority,
              items: [
                "Low",
                "Medium",
                "High",
              ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (value) {
                setState(() {
                  priority = value!;
                });
              },
            ),

            SizedBox(height: 10),

            ElevatedButton(onPressed: pickDate, child: Text("Pick Deadline")),

            SizedBox(height: 20),

            ElevatedButton(onPressed: saveTask, child: Text("Save Task")),
          ],
        ),
      ),
    );
  }
}
