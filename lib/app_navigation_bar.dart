import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:task_list_app/common/styles/app_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationBarItems = getNavItems(context);
    return ColoredBox(
      color: AppColors.darkBlue,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 64),
        itemCount: navigationBarItems.length,
        itemBuilder: (context, index) => _NavigationBarListItem(
          item: navigationBarItems[index],
        ),
        separatorBuilder: (context, index) => Divider(
          color: AppColors.mediumBlue,
          height: 1,
          endIndent: 16,
          indent: 16,
        ),
      ),
    );
  }
}

class _NavigationBarListItem extends StatelessWidget {
  const _NavigationBarListItem({
    Key? key,
    required this.item,
  }) : super(key: key);
  final NavigationBarItem item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.beamToNamed('/${item.url}'),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Text(
          item.name,
          style: TextStyle(
            color: AppColors.lightTextColor,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

List<NavigationBarItem> getNavItems(BuildContext context) {
  final navigationBarItems = [
    // TO DO: labels should be in app localization file
    NavigationBarItem(
      name: AppLocalizations.of(context).tasks,
      url: AppLocalizations.of(context).tasks.toLowerCase(),
    ),
    NavigationBarItem(
      name: AppLocalizations.of(context).projects,
      url: AppLocalizations.of(context).projects.toLowerCase(),
    ),
    NavigationBarItem(
      name: AppLocalizations.of(context).teams,
      url: AppLocalizations.of(context).teams.toLowerCase(),
    ),
  ];
  return navigationBarItems;
}

class NavigationBarItem {
  final String name;
  final String url;

  NavigationBarItem({required this.name, required this.url});
}
