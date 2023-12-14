import 'package:flutter/material.dart';
import 'package:tasks_to_do/screens/add_task_screen.dart';
import 'package:tasks_to_do/screens/app_drawer.dart';
import 'package:tasks_to_do/screens/completed_tasks_screen.dart';
import 'package:tasks_to_do/screens/favourite_tasks_screen.dart';
import 'package:tasks_to_do/screens/pending_tasks_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});
  static const id = "/tabScreen";

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const AddTaskScreen(),
              ),
            ));
  }

  final List<Map<String, dynamic>> _pages = [
    {"pageName": const PendingTasksScreen(), "title": "Pending Tasks"},
    {"pageName": const CompletedTasksScreen(), "title": "Completed Tasks"},
    {"pageName": const FavouriteTasksScreen(), "title": "Favourite Tasks"}
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[selectedIndex]["title"]),
        actions: selectedIndex == 0
            ? [
                IconButton(
                    onPressed: () {
                      _addTask(context);
                    },
                    icon: const Icon(Icons.add))
              ]
            : null,
      ),
      drawer: const AppDrawer(),
      body: _pages[selectedIndex]["pageName"],
      floatingActionButton: selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                _addTask(context);
              },
              tooltip: 'Add Task',
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.incomplete_circle), label: "Pending Tasks"),
          BottomNavigationBarItem(
              icon: Icon(Icons.done), label: "Completed Tasks"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favourite Tasks"),
        ],
      ),
    );
  }
}
