import 'package:flutter/material.dart';
import 'package:tasks_to_do/blocs/bloc_exports.dart';
import 'package:tasks_to_do/models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
  });

  final Task task;

  void _onRemoveOrDelete(BuildContext context, Task task) {
    task.isDeleted!
        ? context.read<TasksBloc>().add(DeleteTask(task: task))
        : context.read<TasksBloc>().add(RemoveTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
            decoration: task.isDone! ? TextDecoration.lineThrough : null),
      ),
      onLongPress: () {
        _onRemoveOrDelete(context, task);
      },
      trailing: Checkbox(
        onChanged: task.isDeleted == false
            ? (value) {
                context.read<TasksBloc>().add(UpdateTask(task: task));
              }
            : null,
        value: task.isDone,
      ),
    );
  }
}
