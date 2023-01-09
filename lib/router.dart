import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:task_list_app/home_page.dart';
import 'package:task_list_app/model/task.dart';
import 'package:task_list_app/pages/projects/_view/projects_page.dart';
import 'package:task_list_app/pages/subfolder/subfolder_page.dart';
import 'package:task_list_app/pages/tasks/_view/tasks_detail.dart';
import 'package:task_list_app/pages/teams/_view/teams_page.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final mainRouterDelegate = BeamerDelegate(
  initialPath: '/tasks',
  transitionDelegate: const NoAnimationTransitionDelegate(),
  locationBuilder: RoutesLocationBuilder(
    routes: {
      '/': (context, state, data) => HomePage(),
      '/:name': (context, state, data) {
        final name = state.pathParameters['name']!;

        return BeamPage(
          key: ValueKey(name),
          title: name,
          popToNamed: '/',
          type: BeamPageType.scaleTransition,
          child: SubFolderPage(name: state.pathParameters['name']!),
        );
      },
    },
  ),
);
final routerDelegate = BeamerDelegate(
  transitionDelegate: const NoAnimationTransitionDelegate(),
  locationBuilder: RoutesLocationBuilder(
    routes: {
      '/': (context, state, data) => Scaffold(),
      '/:name': (context, state, data) {
        final name = state.pathParameters['name']!;

        return BeamPage(
          key: ValueKey(name),
          title: name,
          popToNamed: '/',
          type: BeamPageType.scaleTransition,
          child: SubFolderPage(name: state.pathParameters['name']!),
        );
      },
    },
  ),
);

final subRouterDelegate = BeamerDelegate(
  locationBuilder: RoutesLocationBuilder(
    routes: {
      '/': (context, state, data) => Scaffold(),
      '/:name/:id': (context, state, data) {
        final id = state.pathParameters['id']!;
        final name = state.pathParameters['name'];
        return BeamPage(
          key: ValueKey(id),
          title: id,
          popToNamed: '/$name',
          type: BeamPageType.scaleTransition,
          child: Builder(
            builder: (context) {
              if (name == "tasks") {
                return TaskDetail(
                  id: int.parse(id),
                  data: Task(id: id, title: null, description: null, dateTime: null),
                );
              } else if (name == "projects") {
                return ProjectsPage();
              } else {
                return TeamsPage();
              }
            },
          ),
        );
      },
    },
  ),
);
