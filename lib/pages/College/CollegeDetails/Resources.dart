import 'package:flutter/material.dart';

class Resources extends StatefulWidget {
  final String collegeName;
  Resources({Key key, this.collegeName}) : super(key: key);
  _ResourcesState createState() => _ResourcesState();
}

class _ResourcesState extends State<Resources> {
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
        title: Text('真题资料'),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
