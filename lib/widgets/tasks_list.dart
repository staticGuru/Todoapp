import 'package:flutter/material.dart';
import 'package:todoapp/widgets/task_tile.dart';
import '../blocs/bloc_exports.dart';
import '../models/task.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
    required List<Task> tasksList,
  })  : _tasksList = tasksList,
        super(key: key);

  final List<Task> _tasksList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: _tasksList.length,
          itemBuilder: (context, index) {
            var task = _tasksList[index];
            return TaskTile(task: task);
          }),
    );
  }
}
