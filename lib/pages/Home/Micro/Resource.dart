import 'package:flutter/material.dart';

class FindResource extends StatefulWidget {
  FindResource({Key key}) : super(key: key);
  _FindResourceState createState() => _FindResourceState();
}

class _FindResourceState extends State<FindResource> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('找资料'),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
