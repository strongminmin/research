import 'package:flutter/material.dart';

class College extends StatefulWidget {
  _CollegeState createState() => _CollegeState();
}

class _CollegeState extends State<College> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('院校'),
        centerTitle: true,
      ),
      body: Container(
        child: Text('院校'),
      ),
    );
  }
}
