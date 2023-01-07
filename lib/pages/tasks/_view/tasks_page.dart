import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      // TODO: labels should be in app localization file
      child: Text(AppLocalizations.of(context).tasksTitle),
    );
  }
}
