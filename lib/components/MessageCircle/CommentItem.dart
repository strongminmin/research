import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  CommentItem({Key key}) : super();
  Future<void> commentLikeAction() async {
    print('评论喜欢');
  }

  @override
  Widget build(BuildContext context) {
    num screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              ClipOval(
                child: CachedNetworkImage(
                  width: 35,
                  height: 35,
                  imageUrl:
                      'http://kimvoice.oss-cn-beijing.aliyuncs.com/voice/1.png',
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '周慧敏',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '3分钟前',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 40, top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: screenWidth - 110,
                  child: Text(
                    '这个东西好厉害。这个东西好厉害这个东西好厉害这个东西好厉害',
                    maxLines: 3,
                  ),
                ),
                Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: commentLikeAction,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                    Text(
                      '123',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
