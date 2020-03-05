import 'package:flutter/material.dart';

class Totor extends StatefulWidget {
  final String collegeName;
  Totor({Key key, this.collegeName}) : super(key: key);
  _TotorState createState() => _TotorState();
}

class _TotorState extends State<Totor> {
  String platform;
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
        title: Text('研究生导师'),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
