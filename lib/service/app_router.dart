import 'package:flutter/material.dart';
import 'package:todoapp/screens/recycle_bin.dart';
import 'package:todoapp/screens/tasks_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecyleBin.id:
        return MaterialPageRoute(
          builder: (_) => const RecyleBin(),
        );
      case TasksScreen.id:
        return MaterialPageRoute(
          builder: (_) => const TasksScreen(),
        );
      default:
        return null;
    }
  }
}
