import 'package:flutter/material.dart';

class ReportRatio extends StatefulWidget {
  final String collegeName;
  ReportRatio({Key key, this.collegeName}) : super(key: key);
  _ReportRatioState createState() => _ReportRatioState();
}

class _ReportRatioState extends State<ReportRatio> {
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
        title: Text('报录比'),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
