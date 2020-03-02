import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  MessageItem({Key key}) : super(key: key);
  final List<String> images = [
    'http://kimvoice.oss-cn-beijing.aliyuncs.com/voice/1.png',
    'http://kimvoice.oss-cn-beijing.aliyuncs.com/voice/1.png',
    'http://kimvoice.oss-cn-beijing.aliyuncs.com/voice/1.png',
    'http://kimvoice.oss-cn-beijing.aliyuncs.com/voice/1.png',
    'http://kimvoice.oss-cn-beijing.aliyuncs.com/voice/1.png',
    'http://kimvoice.oss-cn-beijing.aliyuncs.com/voice/topic/2020-02-27%2023%3A33%3A42.772603.jpg',
    'http://kimvoice.oss-cn-beijing.aliyuncs.com/voice/topic/2020-02-27%2023%3A33%3A42.772603.jpg',
    'http://kimvoice.oss-cn-beijing.aliyuncs.com/voice/topic/2020-02-27%2023%3A33%3A42.772603.jpg',
    'http://kimvoice.oss-cn-beijing.aliyuncs.com/voice/topic/2020-02-27%2023%3A33%3A42.772603.jpg',
  ];
  void jumpDetailsPage() {
    print('跳转到详情页');
  }

  void supportHander() {
    print('点赞');
  }

  @override
  Widget build(BuildContext context) {
    num screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: jumpDetailsPage,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
            width: 0.5,
            color: Colors.grey[200],
          )),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            messageHeader(),
            messageContent(screenWidth),
            messageFooter(),
          ],
        ),
      ),
    );
  }

  // 消息的头部信息-头像及用户名称
  Widget messageHeader() {
    return Row(
      children: <Widget>[
        ClipOval(
          child: CachedNetworkImage(
            width: 40,
            height: 40,
            imageUrl: 'http://kimvoice.oss-cn-beijing.aliyuncs.com/voice/1.png',
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                '周慧敏',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '56分钟前',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  // 消息的内容区域-文字和图片
  Widget messageContent(num screenWidth) {
    num imageW = computeImageSize(screenWidth);
    List<Widget> imageWidgets = images.map((url) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          width: imageW,
          height: imageW,
          fit: BoxFit.cover,
          imageUrl: url,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      );
    }).toList();
    return Container(
      margin: EdgeInsets.only(left: 40, top: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '今天天气不错',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 8),
              child: Wrap(
                spacing: 4.0,
                runSpacing: 4.0,
                children: imageWidgets,
              ))
          // imageLayout(screenWidth)
        ],
      ),
    );
  }

  // 消息的底部信息-点赞及评论
  Widget messageFooter() {
    return Container(
      margin: EdgeInsets.only(top: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: jumpDetailsPage,
                child: Icon(
                  Icons.chat,
                  size: 20,
                  color: Colors.grey[400],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 2),
                child: Text(
                  '123',
                  style: TextStyle(fontSize: 12, color: Colors.grey[400]),
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: supportHander,
                child: Icon(
                  Icons.thumb_up,
                  size: 20,
                  color: true ? Colors.blue[400] : Colors.grey[400],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 2),
                child: Text(
                  '123',
                  style: TextStyle(fontSize: 12, color: Colors.grey[400]),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  //响应式计算图片的大小
  num computeImageSize(num screenWidth) {
    num width;
    if (images.length == 1) {
      width = (screenWidth / 2).floorToDouble() - 50;
    } else if (images.length <= 4) {
      width = (screenWidth / 2).floorToDouble() - 50;
    } else {
      width = (screenWidth / 3).floorToDouble() - 50;
    }
    return width;
  }
}
