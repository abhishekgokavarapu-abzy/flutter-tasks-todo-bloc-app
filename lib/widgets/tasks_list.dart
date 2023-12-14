import 'package:flutter/material.dart';
import 'package:tasks_to_do/models/task.dart';
import 'package:tasks_to_do/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.taskList,
  });

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: taskList.length,
            itemBuilder: ((context, index) {
              var task = taskList[index];
              return TaskTile(task: task);
            })));
  }
}
