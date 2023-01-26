import 'package:flutter/material.dart';
import 'package:todoapp/blocs/bloc_exports.dart';
import 'package:todoapp/screens/my_drawer.dart';
import 'package:todoapp/widgets/tasks_list.dart';

import '../models/task.dart';

class RecyleBin extends StatelessWidget {
  const RecyleBin({Key? key}) : super(key: key);
  static const id = "recycle_bin_screen";
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
                List<Task> _removedTasksList = state.removedTasks;

      return Scaffold(
        appBar: AppBar(title: const Text('Recycle Bin'), actions: [
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.add),
          )
        ]),
        drawer: MyDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ignore: prefer_const_constructors
            Center(
              child: Chip(label: Text('${_removedTasksList.length} Tasks')),
            ),
            TasksList(tasksList: _removedTasksList)
          ],
        ),
      );
    });
  }
}
