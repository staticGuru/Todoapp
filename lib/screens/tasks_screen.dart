import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';
import '../widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({Key? key}) : super(key: key);

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
            onPressed: () {},
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
