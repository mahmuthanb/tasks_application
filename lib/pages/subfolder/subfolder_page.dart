import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:task_list_app/common/styles/app_style.dart';
import 'package:task_list_app/pages/listing/_view/listing_page.dart';
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
      body: Row(
        children: [
          Expanded(
            child: ListingPage(
              widget.name,
              (p0) {
                _beamerKey.currentState?.routerDelegate
                    .beamToNamed('/${widget.name}/$p0');
              },
            ),
          ),
          VerticalDivider(
            color: AppColors.scaffoldColor,
            width: AppDimens.xxs,
            thickness: AppDimens.xxs,
          ),
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
