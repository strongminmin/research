import 'package:flutter/material.dart';

class Setup extends StatefulWidget {
  Setup({Key key}) : super(key: key);
  _SetupState createState() => _SetupState();
}

class _SetupState extends State<Setup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设置'),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
