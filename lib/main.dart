import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todoapp/service/app_router.dart';
import 'blocs/bloc_exports.dart';
import 'package:todoapp/screens/tasks_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  HydratedBlocOverrides.runZoned(() => runApp(MyApp(appRouter: AppRouter())),
      storage: storage);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc(),
      // ..add(AddTask(task: Task(title: "task1")))
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TasksScreen(),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
