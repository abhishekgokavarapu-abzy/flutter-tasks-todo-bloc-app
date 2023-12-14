import 'package:flutter/material.dart';
import 'package:tasks_to_do/screens/recycle_bin.dart';
import 'package:tasks_to_do/screens/tab_screen.dart';
import 'package:tasks_to_do/screens/pending_tasks_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case TabScreen.id:
        return MaterialPageRoute(builder: (_) => const TabScreen());
      case PendingTasksScreen.id:
        return MaterialPageRoute(builder: (_) => const PendingTasksScreen());
      case RecycleBin.id:
        return MaterialPageRoute(builder: (_) => const RecycleBin());
      default:
        return null;
    }
  }
}
