import 'package:flutter/material.dart';

import '../models/task.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({Key? key}) : super(key: key);
  // ignore: prefer_final_fields
  List<Task> _tasksList = [
    Task(title: "task1"),
    Task(title: "task2"),
    Task(title: "task3")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task App'), actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add),
        )
      ]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Center(
            child: Chip(label: Text('Tasks')),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
