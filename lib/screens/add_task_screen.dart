
import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';

class AddTasksScreen extends StatelessWidget {
   const AddTasksScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      TextEditingController taskTitleController = TextEditingController();

    return Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            const Text("Add Tasks", style: TextStyle(fontSize: 24)),
            const SizedBox(height: 10),
            TextField(
              autofocus: true,
              controller: taskTitleController,
              decoration: const InputDecoration(
                  label: Text('Title'), border: OutlineInputBorder()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel")),
                ElevatedButton(
                    onPressed: () {
                      var task = Task(title: taskTitleController.text);
                      context.read<TasksBloc>().add(AddTask(task: task));
                      Navigator.pop(context);
                    },
                    child: const Text("Add"))
              ],
            ),
          ]),
        ));
  }
}
