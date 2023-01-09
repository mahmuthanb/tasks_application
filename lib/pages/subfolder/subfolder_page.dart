import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:task_list_app/common/widgets/menu_button.dart';
import 'package:task_list_app/router.dart';

class SubFolderPage extends StatefulWidget {
  final String name;
  const SubFolderPage({Key? key, required this.name}) : super(key: key);
  @override
  State<SubFolderPage> createState() => _SubFolderPageState();
}

class _SubFolderPageState extends State<SubFolderPage> {
  final _beamerKey = GlobalKey<BeamerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('subfolder appbar'),
      ),
      body: Row(
        children: [
          Container(
            color: Colors.blue[300],
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                MenuButton(
                  beamer: _beamerKey,
                  uri: '/${widget.name}/1',
                  child: Text('1'),
                ),
                SizedBox(height: 16.0),
                MenuButton(
                  beamer: _beamerKey,
                  uri: '/${widget.name}/2',
                  child: Text('2'),
                ),
              ],
            ),
          ),
          Container(width: 1, color: Colors.blue),
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
