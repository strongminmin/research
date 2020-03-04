import 'package:flutter/material.dart';

class Admissions extends StatefulWidget {
  final String collegeName;
  Admissions({Key key, this.collegeName}) : super(key: key);
  _AdmissionsState createState() => _AdmissionsState();
}

class _AdmissionsState extends State<Admissions> {
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
        title: Text('招生简章'),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
