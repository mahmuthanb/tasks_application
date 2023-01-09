import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_list_app/common/styles/app_style.dart';
import 'package:task_list_app/common/widgets/header_title.dart';
import 'package:task_list_app/model/task.dart';
import 'package:task_list_app/pages/listing/_provider/listing_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task_list_app/util/formatter.dart';

class ListingPage extends StatefulWidget {
  const ListingPage(
    this.name,
    this.onTap, {
    Key? key,
  }) : super(key: key);

  final Function(String) onTap;
  final String name;

  @override
  State<ListingPage> createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  List<Task> list = [];
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProvider>(builder: (context, value, child) {
      if (widget.name == "tasks") {
        list = value.list;
        if (list.isEmpty) {
          return Center(
            child: Text("no data"),
          );
        }
        return Container(
          padding: EdgeInsets.all(AppDimens.m),
          child: Column(
            children: [
              HeaderTitle(title: AppLocalizations.of(context).tasks),
              Expanded(
                child: ListView.separated(
                  itemCount: list.length,
                  padding: EdgeInsets.only(top: AppDimens.l),
                  separatorBuilder: (context, index) =>
                      SizedBox(height: AppDimens.m),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(AppDimens.s),
                      ),
                      child: ListTile(
                        onTap: () => widget.onTap.call(list[index].id!),
                        title: Text(
                          list[index].title!,
                          style: AppTextStyle.tileHeading,
                        ),
                        trailing: Text(
                            Formatter.dateTimeShort(list[index].dateTime!)),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      } else {
        return Center(
          child: Text(widget.name.toUpperCase()),
        );
      }
    });
  }

  getData() async {
    if (widget.name == "tasks") {
      await context.read<TasksProvider>().getData();
    }
  }
}
