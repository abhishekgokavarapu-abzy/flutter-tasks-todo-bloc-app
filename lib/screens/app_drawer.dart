import 'package:flutter/material.dart';
import 'package:tasks_to_do/blocs/bloc_exports.dart';
import 'package:tasks_to_do/screens/recycle_bin.dart';
import 'package:tasks_to_do/screens/tab_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(children: [
          Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              child: Text(
                "Tasks",
                style: Theme.of(context).textTheme.headlineLarge,
              )),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, TabScreen.id);
            },
            child: BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return ListTile(
                    leading: const Icon(Icons.folder_special),
                    title: const Text("My Tasks"),
                    trailing: Text(
                      "${state.pendingTasks.length.toString()} | ${state.completedTasks.length.toString()}",
                    ));
              },
            ),
          ),
          const Divider(),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, RecycleBin.id);
            },
            child: BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return ListTile(
                  leading: const Icon(Icons.delete),
                  title: const Text("Bin"),
                  trailing: Text(state.removedTasks.length.toString()),
                );
              },
            ),
          ),
          const Divider(),
          BlocBuilder<SwitchBloc, SwitchState>(
            builder: (context, state) {
              return Switch(
                  value: state.switchValue,
                  onChanged: (value) {
                    value
                        ? context.read<SwitchBloc>().add(SwitchOnEvent())
                        : context.read<SwitchBloc>().add(SwitchOffEvent());
                  });
            },
          )
        ]),
      ),
    );
  }
}
