import 'package:flutter/material.dart';
import 'package:tasks_to_do/blocs/bloc_exports.dart';
import 'package:tasks_to_do/widgets/tasks_list.dart';

class FavouriteTasksScreen extends StatelessWidget {
  const FavouriteTasksScreen({super.key});
  static const id = "/favouriteTasksScreen";
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        var taskList = state.favouriteTasks;
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child:
                      Chip(label: Text("${state.favouriteTasks.length} Tasks")),
                ),
                TaskList(taskList: taskList)
              ],
            ),
          ),
        );
      },
    );
  }
}
