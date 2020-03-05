import 'package:flutter/material.dart';

class ReportRatio extends StatefulWidget {
  final String collegeName;
  ReportRatio({Key key, this.collegeName}) : super(key: key);
  _ReportRatioState createState() => _ReportRatioState();
}

class _ReportRatioState extends State<ReportRatio> {
  Map<String, String> ratios = {
    '2020': '10:1',
    '2019': '10:1',
    '2018': '10:1',
    '2017': '10:1',
    '2016': '10:1',
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
        title: Text('报录比'),
        centerTitle: true,
      ),
      body: Container(
        width: screenWidth,
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: ratioContent(screenWidth),
          ),
        ),
      ),
    );
  }

  List<Widget> ratioContent(num screenWidth) {
    return ratios.keys.map((year) {
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
              '年报录比',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              ratios[year],
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
