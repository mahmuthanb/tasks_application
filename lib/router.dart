import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:task_list_app/home_page.dart';
import 'package:task_list_app/pages/projects/_view/projects_page.dart';
import 'package:task_list_app/pages/tasks/_view/tasks_detail.dart';
import 'package:task_list_app/pages/tasks/_view/tasks_page.dart';
import 'package:task_list_app/pages/teams/_view/teams_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final routerDelegate = BeamerDelegate(
  locationBuilder: RoutesLocationBuilder(
    routes: {
      '/': ((context, state, data) {
        return BeamPage(
          key: ValueKey('home-page'),
          title: AppLocalizations.of(context).homePageTitle,
          popToNamed: '/',
          type: BeamPageType.scaleTransition,
          child: HomePage(),
        );
      }),
      '/tasks': ((context, state, data) {
        return BeamPage(
          key: ValueKey('task-page'),
          title: AppLocalizations.of(context).tasksTitle,
          popToNamed: '/',
          type: BeamPageType.scaleTransition,
          child: TasksPage(),
        );
      }),
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
