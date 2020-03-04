import 'package:flutter/material.dart';

class Experience extends StatefulWidget {
  final String collegeName;
  Experience({Key key, this.collegeName}) : super(key: key);
  _ExperienceState createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
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
        title: Text('考研经验'),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
