import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:task_list_app/home_page.dart';
import 'package:task_list_app/pages/projects/_view/projects_page.dart';
import 'package:task_list_app/pages/tasks/_view/tasks_detail.dart';
import 'package:task_list_app/pages/tasks/_view/tasks_page.dart';
import 'package:task_list_app/pages/teams/_view/teams_page.dart';

final routerDelegate = BeamerDelegate(
  locationBuilder: RoutesLocationBuilder(
    routes: {
      '/': ((context, state, data) => HomePage()),
      '/tasks': (context, state, data) => TasksPage(),
      '/tasks/:taskId': (context, state, data) {
        final taskId = state.pathParameters['taskId']!;
        return BeamPage(
          key: ValueKey('task-$taskId'),
          title: 'Task #$taskId',
          popToNamed: '/',
          type: BeamPageType.scaleTransition,
          child: TaskDetail(taskId),
        );
      },
      '/projects': (context, state, data) => ProjectsPage(),
      '/teams': (context, state, data) => TeamsPage(),
    },
  ),
);
