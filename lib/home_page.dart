import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:task_list_app/app_navigation_bar.dart';
import 'package:task_list_app/common/styles/app_style.dart';
import 'package:task_list_app/pages/subfolder/subfolder_page.dart';
import 'package:task_list_app/router.dart';

// This class does not have to be used. It should be replaced with class
// handling navigation using Beamer package
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _beamerKey = GlobalKey<BeamerState>();
    return Scaffold(
      appBar: AppBar(
        title: Text("homepage appbar"),
      ),
      // drawer: Drawer(
      //   child: ConstrainedBox(
      //     constraints: BoxConstraints(minWidth: 200, maxWidth: 300),
      //     child: AppNavigationBar(),
      //   ),
      // ),
      body: Row(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 200, maxWidth: 300),
            child: AppNavigationBar(),
          ),
          // VerticalDivider(
          //   width: AppDimens.xs,
          // ),
          // Container(width: 1, color: Colors.blue),
          if ((context.currentBeamLocation.state as BeamState).uri.path.isEmpty)
            Expanded(
              child: Container(
                child: Center(
                  child: Text('Home'),
                ),
              ),
            )
          else
            Expanded(
              child: ClipRRect(
                child: Beamer(key: _beamerKey, routerDelegate: subRouterDelegate),
              ),
            ),
        ],
      ),
    );
  }
}
