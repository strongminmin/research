import 'package:flutter/material.dart';

class GraduateCollege extends StatefulWidget {
  final String collegeName;
  GraduateCollege({Key key, this.collegeName}) : super(key: key);
  _GraduateCollegeState createState() => _GraduateCollegeState();
}

class _GraduateCollegeState extends State<GraduateCollege> {
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
        title: Text('研究生院'),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
