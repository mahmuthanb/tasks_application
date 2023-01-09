import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_list_app/common/styles/app_style.dart';
import 'package:task_list_app/common/widgets/header_title.dart';
import 'package:task_list_app/model/task.dart';
import 'package:task_list_app/pages/listing/_provider/listing_provider.dart';
import 'package:task_list_app/util/formatter.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail({
    required this.id,
    super.key,
  });
  final int id;
  @override
  Widget build(BuildContext context) {
    Task data = context.read<TasksProvider>().getDataWithId(id.toString());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(AppDimens.m),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderTitle(title: data.title!),
            SizedBox(height: AppDimens.l),
            Text(Formatter.dateTimeShort(data.dateTime!)),
            SizedBox(height: AppDimens.s),
            Text(data.description!),
          ],
        ),
      ),
    );
  }
}
