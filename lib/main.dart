import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/viewmodels/task_viewmodels.dart';

import 'views/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Task Manager",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomeScreen(),
      ),
    );
  }
}
