import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:task_list_app/common/widgets/initial_view.dart';
import 'package:task_list_app/home_page.dart';
import 'package:task_list_app/pages/projects/_view/projects_page.dart';
import 'package:task_list_app/pages/subfolder/subfolder_page.dart';
import 'package:task_list_app/pages/listing/_view/tasks_detail.dart';
import 'package:task_list_app/pages/teams/_view/teams_page.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final mainRouterDelegate = BeamerDelegate(
  transitionDelegate: const NoAnimationTransitionDelegate(),
  locationBuilder: RoutesLocationBuilder(
    routes: {
      '*': (context, state, data) => HomePage(),
    },
  ),
);

final routerDelegate = BeamerDelegate(
  transitionDelegate: const NoAnimationTransitionDelegate(),
  initialPath: '/tasks',
  locationBuilder: RoutesLocationBuilder(
    routes: {
      '/:name': (context, state, data) {
        final name = state.pathParameters['name']!;

        return BeamPage(
          key: ValueKey(name),
          popToNamed: '/',
          name: name,
          title: name,
          type: BeamPageType.scaleTransition,
          child: SubFolderPage(name: state.pathParameters['name']!),
        );
      },
    },
  ),
);

final subRouterDelegate = BeamerDelegate(
  transitionDelegate: NoAnimationTransitionDelegate(),
  locationBuilder: RoutesLocationBuilder(
    routes: {
      '/': (p0, p1, p2) => InitialView(),
      '/:name/:id': (context, state, data) {
        final id = state.pathParameters['id']!;
        final name = state.pathParameters['name'];
        return BeamPage(
          key: ValueKey(id),
          title: '$name - $id',
          popToNamed: '/$name',
          type: BeamPageType.scaleTransition,
          child: Builder(
            builder: (context) {
              if (name == "tasks") {
                return TaskDetail(
                  id: int.parse(id),
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
