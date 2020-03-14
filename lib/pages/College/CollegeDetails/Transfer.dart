import 'package:flutter/material.dart';

class Transfer extends StatefulWidget {
  final String collegeName;
  Transfer({Key key, this.collegeName}) : super(key: key);
  _TransferState createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
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
        title: Text('考研调剂'),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
