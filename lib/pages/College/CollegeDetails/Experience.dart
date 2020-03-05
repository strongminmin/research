import 'package:flutter/material.dart';

class Experience extends StatefulWidget {
  final String collegeName;
  Experience({Key key, this.collegeName}) : super(key: key);
  _ExperienceState createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  List<Map> experiences = [
    {
      'Q': '考研应该怎么准备？考研应该怎么准备？考研应该怎么准备？考研应该怎么准备？考研应该怎么准备？',
      'A': '别学了，玩去吧。别学了，玩去吧。别学了，玩去吧。别学了，玩去吧。别学了，玩去吧。别学了，玩去吧。'
    },
    {'Q': '考研应该怎么准备？', 'A': '别学了，玩去吧。'},
    {'Q': '考研应该怎么准备？', 'A': '别学了，玩去吧。'},
    {'Q': '考研应该怎么准备？', 'A': '别学了，玩去吧。'},
    {'Q': '考研应该怎么准备？', 'A': '别学了，玩去吧。'},
    {'Q': '考研应该怎么准备？', 'A': '别学了，玩去吧。'},
    {'Q': '考研应该怎么准备？', 'A': '别学了，玩去吧。'},
    {'Q': '考研应该怎么准备？', 'A': '别学了，玩去吧。'},
    {'Q': '考研应该怎么准备？', 'A': '别学了，玩去吧。'},
  ];
  @override
  void initState() {
    super.initState();
    fetchRequest();
  }

  Future<void> fetchRequest() async {}
  List<Widget> experiencesWidget(num screenWidth) {
    return experiences.map((exper) {
      List<Widget> experWidget = exper.keys.map((key) {
        return Container(
          margin: EdgeInsets.only(top: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '$key：',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: screenWidth - 100,
                margin: EdgeInsets.only(top: 2),
                child: Text(
                  exper[key],
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        );
      }).toList();
      return Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.5, color: Colors.grey[200]),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: experWidget,
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    num screenWidth = MediaQuery.of(context).size.width;
    num screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('考研经验'),
        centerTitle: true,
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        color: Colors.white,
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: experiencesWidget(screenWidth),
          ),
        ),
      ),
    );
  }
}
