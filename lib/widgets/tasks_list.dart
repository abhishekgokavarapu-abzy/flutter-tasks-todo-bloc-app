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
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: taskList
              .map((task) => ExpansionPanelRadio(
                  value: task.id,
                  headerBuilder: (context, isOpen) => TaskTile(task: task),
                  body: ListTile(
                    title: SelectableText.rich(TextSpan(children: [
                      const TextSpan(
                          text: "Title:\n",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: task.title),
                      const TextSpan(
                          text: "\n\nDescription:\n",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: task.description),
                    ])),
                  )))
              .toList(),
        ),
      ),
    );
  }
}
