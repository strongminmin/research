import 'package:flutter/material.dart';

class ScoreLine extends StatefulWidget {
  final String collegeName;
  ScoreLine({Key key, this.collegeName}) : super(key: key);
  _ScoreLineState createState() => _ScoreLineState();
}

class _ScoreLineState extends State<ScoreLine> {
  Map yearScoreLine = {
    '2020': '386',
    '2019': '386',
    '2018': '386',
    '2017': '386',
    '2016': '386',
    '2015': '386',
  };
  @override
  void initState() {
    super.initState();
    fetchRequest();
  }

  Future<void> fetchRequest() async {}
  @override
  Widget build(BuildContext context) {
    num screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('历年分数线'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: scoreLineContent(screenWidth),
        ),
      ),
    );
  }

  List<Widget> scoreLineContent(num screenWidth) {
    return yearScoreLine.keys.map((year) {
      return Container(
        width: screenWidth,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.5, color: Colors.grey[200]),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              year,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '年初始分数线：',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              '${yearScoreLine[year]}分',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}
