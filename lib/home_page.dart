import 'package:flutter/material.dart';
import 'package:task_list_app/app_navigation_bar.dart';
import 'package:task_list_app/pages/tasks/_view/tasks_page.dart';

// This class does not have to be used. It should be replaced with class
// handling navigation using Beamer package
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 200, maxWidth: 300),
            child: AppNavigationBar(),
          ),
          Expanded(child: TasksPage()),
        ],
      ),
    );
  }
}
