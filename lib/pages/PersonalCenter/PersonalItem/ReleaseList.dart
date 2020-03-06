import 'package:flutter/material.dart';

class ReleaseList extends StatefulWidget {
  ReleaseList({Key key}) : super(key: key);
  _ReleaseListState createState() => _ReleaseListState();
}

class _ReleaseListState extends State<ReleaseList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我发布的'),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
