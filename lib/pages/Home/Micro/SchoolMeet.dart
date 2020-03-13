import 'package:flutter/material.dart';

class SchoolMeet extends StatefulWidget {
  SchoolMeet({Key key}) : super(key: key);
  _SchoolMeetState createState() => _SchoolMeetState();
}

class _SchoolMeetState extends State<SchoolMeet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('校研会'),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
