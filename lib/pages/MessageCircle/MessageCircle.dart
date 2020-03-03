import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:yanyou/components/MessageCircle/MessageItem.dart';
import 'package:yanyou/routes/Application.dart';
import 'package:yanyou/routes/Routes.dart';

class MessageCircle extends StatefulWidget {
  _MessageCircleState createState() => _MessageCircleState();
}

class _MessageCircleState extends State<MessageCircle> {
  void jumpReleaseMessagePage() {
    Application.router.navigateTo(
      context,
      Routes.releaseMessagePage,
      transition: TransitionType.native,
    );
  }

  Future<void> onLoadHandler() async {}
  Future<void> onRefreshHanlder() async {}

  @override
  Widget build(BuildContext context) {
    num screenWidth = MediaQuery.of(context).size.width;
    num screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('坛子'),
        centerTitle: true,
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 12),
            child: IconButton(
              onPressed: jumpReleaseMessagePage,
              icon: Icon(Icons.send),
            ),
          )
        ],
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        color: Colors.white,
        child: EasyRefresh(
          onLoad: onLoadHandler,
          onRefresh: onRefreshHanlder,
          footer: MaterialFooter(),
          header: MaterialHeader(),
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return MessageItem();
            },
          ),
        ),
      ),
    );
  }
}
