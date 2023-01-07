import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_list_app/model/task.dart';
import 'package:task_list_app/service/network_service.dart';

final tasksProvider = StateNotifierProvider<TasksProvider, List<Task>>((ref) {
  return TasksProvider(ref);
});

class TasksProvider extends StateNotifier<List<Task>> {
  TasksProvider(this.ref) : super([]);
  final Ref ref;

  List<Task> list = [];

  void getData() {
    NetworkService().getTasks().then((value) => list = value);
  }
}
