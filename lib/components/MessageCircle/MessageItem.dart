import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:yanyou/api/Talk.dart';
import 'package:yanyou/components/MessageCircle/CommentList.dart';
import 'package:yanyou/models/Talk.dart';
import 'package:yanyou/provider/TalkProvider.dart';

class MessageItem extends StatelessWidget {
  final TalkModel talkModel;
  MessageItem({Key key, this.talkModel}) : super(key: key);

  Function supportHander(BuildContext context) {
    return () async {
      try {
        TalkProvider talkProvider = Provider.of<TalkProvider>(
          context,
          listen: false,
        );
        var result = await talkLike(
          userId: 2,
          targetId: talkModel.talkId,
          type: 0,
        );
        if (result['noerr'] == 0) {
          talkProvider.updateLike(talkModel.talkId, result['data']);
        }
      } catch (err) {
        print(err);
      }
    };
  }

  Function openCommentSheet(BuildContext context) {
    return () {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return CommentList(talkId: talkModel.talkId);
        },
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    num screenWidth = MediaQuery.of(context).size.width;
    return Container(
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
            imageUrl: talkModel.userImage,
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
                talkModel.userName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                talkModel.createTime,
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
    List<Widget> imageWidgets = talkModel.talkImages.map((url) {
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
            talkModel.talkContent,
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
    return Builder(
      builder: (context) {
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
                    onTap: openCommentSheet(context),
                    child: Icon(
                      Icons.chat,
                      size: 20,
                      color: Colors.grey[400],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 2),
                    child: Text(
                      talkModel.comment.toString(),
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
                    onTap: supportHander(context),
                    child: Icon(
                      Icons.thumb_up,
                      size: 20,
                      color: talkModel.talkLike.action
                          ? Colors.blue[400]
                          : Colors.grey[400],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 2),
                    child: Text(
                      talkModel.talkLike.count.toString(),
                      style: TextStyle(fontSize: 12, color: Colors.grey[400]),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  //响应式计算图片的大小
  num computeImageSize(num screenWidth) {
    num width;
    if (talkModel.talkImages.length == 1) {
      width = (screenWidth / 2).floorToDouble() - 50;
    } else if (talkModel.talkImages.length <= 4) {
      width = (screenWidth / 2).floorToDouble() - 50;
    } else {
      width = (screenWidth / 3).floorToDouble() - 50;
    }
    return width;
  }
}
