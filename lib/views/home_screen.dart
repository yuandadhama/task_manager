import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/viewmodels/task_viewmodels.dart';
import 'add_task_screen.dart';
import 'detail_task_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<TaskViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Task Manager")),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddTaskScreen()),
          );
        },
      ),

      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Completed: ${vm.completedTasks}"),
                Text("Pending: ${vm.pendingTasks}"),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: vm.tasks.length,
              itemBuilder: (context, index) {
                final task = vm.tasks[index];

                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(task.title),
                    subtitle: Text(task.priority),
                    trailing: Text(task.status),

                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailTaskScreen(task: task),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
