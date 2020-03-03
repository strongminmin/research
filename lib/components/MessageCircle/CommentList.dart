import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:yanyou/components/MessageCircle/CommentItem.dart';

class CommentList extends StatefulWidget {
  CommentList({Key key}) : super(key: key);
  _CommentListState createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {
  TextEditingController _textEditingController;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController?.dispose();
  }

  Future<void> onLoadHandler() async {}
  Future<void> onRefreshHandler() async {}
  Future<void> commentAction() async {}
  @override
  Widget build(BuildContext context) {
    num screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: screenWidth,
        padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Column(
          children: <Widget>[
            Text(
              '评论列表',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: EasyRefresh(
                onLoad: onLoadHandler,
                onRefresh: onRefreshHandler,
                footer: MaterialFooter(),
                header: MaterialHeader(),
                child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return CommentItem();
                  },
                ),
              ),
            ),
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                suffix: GestureDetector(
                  onTap: commentAction,
                  child: Text(
                    '评论',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                    ),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
