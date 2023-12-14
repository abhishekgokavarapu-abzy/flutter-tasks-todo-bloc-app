import 'package:flutter/material.dart';
import 'package:tasks_to_do/blocs/bloc_exports.dart';
import 'package:tasks_to_do/widgets/tasks_list.dart';

class PendingTasksScreen extends StatelessWidget {
  const PendingTasksScreen({super.key});
  static const id = "/pendingTasksScreen";
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        var taskList = state.pendingTasks;
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Chip(
                      label: Text(
                          "${state.pendingTasks.length} Pending | ${state.completedTasks.length} Completed")),
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
