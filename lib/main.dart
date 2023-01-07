import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:task_list_app/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Task list App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      routeInformationParser: BeamerParser(),
      routerDelegate: routerDelegate,
      //home: HomePage(),
    );
  }
}
