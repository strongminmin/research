import 'package:flutter/material.dart';

class History extends StatefulWidget {
  History({Key key}) : super(key: key);
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('浏览记录'),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
