import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  Header({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    num screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 150,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 16, top: 16),
            height: 100,
            color: Colors.blue[400],
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    width: 60,
                    height: 60,
                    imageUrl:
                        'http://kimvoice.oss-cn-beijing.aliyuncs.com/voice/1.png',
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 8, top: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '周慧敏',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: screenWidth - 100,
                        margin: EdgeInsets.only(top: 4),
                        child: Text(
                          '这个人很懒，什么也没留下,这个人很懒，什么也没留下这个人很懒，什么也没留下',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[200],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 85,
            left: screenWidth * 0.1,
            child: Container(
              width: screenWidth * 0.8,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        '志愿学校：',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Text('清华大学'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        '报考专业：',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Text('人工智能'),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
