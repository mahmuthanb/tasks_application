import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String id;
  const DetailPage({Key? key, required this.id}) : super(key: key);
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('${widget.id}'),
      // ),
      body: Text('${widget.id}'),
    );
  }
}
