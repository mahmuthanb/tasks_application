import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_list_app/common/styles/app_style.dart';
import 'package:task_list_app/model/task.dart';
import 'package:task_list_app/pages/tasks/_view/task_provider.dart';
import 'package:task_list_app/util/formatter.dart';

class TasksPage extends ConsumerWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(tasksProvider);

    String loremDesc =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut eu sem integer vitae justo eget magna. Et tortor at risus viverra adipiscing. Et netus et malesuada fames ac turpis egestas maecenas pharetra. Sem et tortor consequat id porta. Scelerisque felis imperdiet proin fermentum leo vel orci porta. Feugiat nibh sed pulvinar proin. Tristique et egestas quis ipsum suspendisse ultrices. Urna nec tincidunt praesent semper feugiat nibh. Amet volutpat consequat mauris nunc congue nisi vitae suscipit tellus. Tortor at auctor urna nunc id cursus. Tristique senectus et netus et malesuada. Et magnis dis parturient montes nascetur ridiculus mus mauris. Tortor id aliquet lectus proin nibh nisl.";
    final now = DateTime.now();
    List<Task> list = [
      Task(
          id: '1',
          title: 'Read emails from mailbox',
          dateTime: now,
          description: loremDesc),
      Task(
          id: '2',
          title: 'Check latest news on Flutter',
          dateTime: now,
          description: loremDesc),
    ];
    return ListView.separated(
      itemCount: list.length,
      padding: EdgeInsets.all(AppDimens.m),
      separatorBuilder: (context, index) => SizedBox(height: AppDimens.m),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(
              AppDimens.s,
            ),
          ),
          child: ListTile(
            title: Text(
              list[index].title!,
              style: AppTextStyle.tileHeading,
            ),
            trailing: Text(Formatter.dateTimeShort(list[index].dateTime!)),
          ),
        );
      },
    );
  }
}
