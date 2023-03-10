import 'dart:ffi';

import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';
import '../widgets/tasks_list.dart';
import 'add_task_screen.dart';
import 'my_drawer.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);
  static const id = "tasks_screen";
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  void _addTasks(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => const SingleChildScrollView(
              child: AddTasksScreen(),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> _tasksList = state.allTasks;
        return Scaffold(
          appBar: AppBar(title: const Text('Task App'), actions: [
            IconButton(
              onPressed: () => _addTasks(context),
              icon: const Icon(Icons.add),
            )
          ]),
          drawer: MyDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ignore: prefer_const_constructors
              Center(
                child: Chip(label: Text('${state.allTasks.length} Tasks')),
              ),
              TasksList(tasksList: _tasksList)
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _addTasks(context),
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
