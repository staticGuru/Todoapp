
import 'package:flutter/material.dart';

import '../models/task.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
    required List<Task> tasksList,
  }) : _tasksList = tasksList, super(key: key);

  final List<Task> _tasksList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: _tasksList.length,
          itemBuilder: (context, index) {
            var task = _tasksList[index];
            return ListTile(
              title: Text(task.title),
              trailing: Checkbox(value: task.isDone, onChanged: (value) {}),
            ); 
          }),
    );
  }
}
