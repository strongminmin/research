import 'package:flutter/material.dart';

class ScoreLine extends StatefulWidget {
  final String collegeName;
  ScoreLine({Key key, this.collegeName}) : super(key: key);
  _ScoreLineState createState() => _ScoreLineState();
}

class _ScoreLineState extends State<ScoreLine> {
  @override
  void initState() {
    super.initState();
    fetchRequest();
  }

  Future<void> fetchRequest() async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('历年分数线'),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
