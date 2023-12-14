import 'package:flutter/material.dart';
import 'package:tasks_to_do/blocs/bloc_exports.dart';
import 'package:tasks_to_do/screens/app_drawer.dart';
import 'package:tasks_to_do/widgets/tasks_list.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});
  static const id = "/recycle-bin";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text("Recycle Bin"),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
            ],
          ),
          drawer: const AppDrawer(),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child:
                      Chip(label: Text("${state.removedTasks.length} Tasks")),
                ),
                TaskList(taskList: state.removedTasks)
              ],
            ),
          ),
        );
      },
    );
  }
}
