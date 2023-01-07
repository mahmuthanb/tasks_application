import 'package:flutter/material.dart';
import 'package:task_list_app/common/styles/app_style.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({
    required this.title,
    super.key,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyle.titleHeader,
          ),
          Divider()
        ],
      ),
    );
  }
}
