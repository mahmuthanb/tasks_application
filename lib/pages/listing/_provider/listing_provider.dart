import 'package:flutter/material.dart';
import 'package:task_list_app/model/task.dart';
import 'package:task_list_app/service/network_service.dart';

class TasksProvider extends ChangeNotifier {
  List<Task> _list = [];
  List<Task> get list => _list;
  getData() async {
    await NetworkService().getTasks().then((value) {
      _list = value;
      notifyListeners();
    });
  }

  Task getDataWithId(String id) {
    return list.firstWhere((element) => element.id == id);
  }
}
