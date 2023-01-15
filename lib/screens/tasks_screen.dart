import 'dart:ffi';

import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';
import '../widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({Key? key}) : super(key: key);
  TextEditingController taskTitleController = TextEditingController();
  void _addTasks(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Column(children: [
                    const Text("Add Tasks", style: TextStyle(fontSize: 24)),
                    const SizedBox(height: 10),
                    TextField(
                      controller: taskTitleController,
                      decoration: const InputDecoration(
                          label: Text('Title'), border: OutlineInputBorder()),
                    )
                  ])),
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
              onPressed: () {},
              icon: const Icon(Icons.add),
            )
          ]),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(label: Text('Tasks')),
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
