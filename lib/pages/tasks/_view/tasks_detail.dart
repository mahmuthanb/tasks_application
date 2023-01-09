import 'package:flutter/material.dart';
import 'package:task_list_app/model/task.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail({
    required this.id,
    required this.data,
    super.key,
  });
  final int id;
  final Task data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("task appbar"),
      ),
      body: Container(
        child: Text(
          id.toString(),
        ),
      ),
    );
  }
}
