import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:yanyou/routes/Application.dart';
import 'package:yanyou/routes/Routes.dart';

class AdvisoryItem extends StatelessWidget {
  AdvisoryItem({Key key}) : super(key: key);
  Function jumpAdvisoryDetails(BuildContext context) {
    return () {
      print('进入热点详情页');
      Application.router.navigateTo(
        context,
        Routes.advisoryDetailsPage,
        transition: TransitionType.native,
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    num screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: jumpAdvisoryDetails(context),
      child: Container(
        width: screenWidth,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 0.5,
              color: Colors.grey[200],
            ),
          ),
        ),
        child: Column(
          children: <Widget>[
            advisoryTitle(),
            advisoryContent(screenWidth),
          ],
        ),
      ),
    );
  }

  // 咨询标题
  Widget advisoryTitle() {
    return Row(
      children: <Widget>[
        Container(
          width: 28,
          height: 28,
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              '报',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ),
        Text('报考指南'),
      ],
    );
  }

  // 咨询内容
  Widget advisoryContent(screenWidth) {
    return Container(
      margin: EdgeInsets.only(top: 6),
      height: 70,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/banner.jpg',
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: screenWidth - 110,
                child: Text(
                  '教育部：2020年自划线研究生复试录取工作延期。',
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              advisoryBottom(),
            ],
          ),
        ],
      ),
    );
  }

  // 咨询底部-发布时间以及访问量
  Widget advisoryBottom() {
    TextStyle textStyle = TextStyle(
      color: Colors.grey,
      fontSize: 12,
    );
    return Row(
      children: <Widget>[
        Icon(
          Icons.access_time,
          size: 14,
          color: Colors.grey,
        ),
        Text(
          '3分钟前',
          style: textStyle,
        ),
        Container(
          margin: EdgeInsets.only(left: 12),
          child: Text(
            '2000人访问',
            style: textStyle,
          ),
        ),
      ],
    );
  }
}
