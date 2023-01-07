import 'package:flutter/cupertino.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail(
    this.id, {
    super.key,
  });
  final String id;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        id,
      ),
    );
  }
}
