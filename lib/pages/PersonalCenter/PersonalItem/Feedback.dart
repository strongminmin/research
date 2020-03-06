import 'package:flutter/material.dart';

class SystemFeedback extends StatelessWidget {
  SystemFeedback({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('系统反馈'),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
