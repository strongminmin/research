import 'package:flutter/material.dart';

class MessageCircle extends StatefulWidget {
  _MessageCircleState createState() => _MessageCircleState();
}

class _MessageCircleState extends State<MessageCircle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('坛子'),
        centerTitle: true,
      ),
      body: Container(
        child: Text('坛子'),
      ),
    );
  }
}
