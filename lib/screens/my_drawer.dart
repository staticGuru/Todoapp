import 'package:flutter/material.dart';
import 'package:todoapp/blocs/bloc_exports.dart';
import 'package:todoapp/screens/recycle_bin.dart';
import 'package:todoapp/screens/tasks_screen.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              color: Colors.grey,
              child: Text("Task Drawer",
                  style: Theme.of(context).textTheme.headline4),
            ),
            BlocBuilder<TasksBloc,TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: ()=>Navigator.of(context).pushReplacementNamed(TasksScreen.id),
                  child: ListTile(
                    leading: const Icon(Icons.folder_copy_outlined),
                    title: const Text("My tasks"),
                    trailing: Text("${state.allTasks.length}"),
                  ),
                );
              }
            ),
            const Divider(),
            BlocBuilder<TasksBloc,TasksState>(
             builder: (context, state) {
                return GestureDetector(
                  onTap: ()=>Navigator.of(context).pushReplacementNamed(RecyleBin.id),
                  child:  ListTile(
                    leading: const Icon(Icons.delete),
                    title: const Text("My tasks"),
                    trailing: Text("${state.removedTasks.length}"),
                  ),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
