import 'package:flutter/material.dart';

class Senior extends StatefulWidget {
  final String collegeName;
  Senior({Key key, this.collegeName}) : super(key: key);
  _SeniorState createState() => _SeniorState();
}

class _SeniorState extends State<Senior> {
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
        title: Text('直通学长'),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
