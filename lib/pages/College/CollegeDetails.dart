import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:yanyou/common/index.dart';
import 'package:yanyou/constants/index.dart';
import 'package:yanyou/routes/Application.dart';

class CollegeDetails extends StatelessWidget {
  final String collegeName;
  CollegeDetails({Key key, @required this.collegeName}) : super(key: key);

  Function jumpItemDetails(BuildContext context, String pagePath) {
    return () {
      String collegeNameEncode = FluroConvertUtils.fluroCnParamsEncode(
        collegeName,
      );
      Application.router.navigateTo(
        context,
        '$pagePath?name=$collegeNameEncode',
        transition: TransitionType.native,
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    num screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(collegeName),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            collegeBanner(screenWidth),
            collegeContent(screenWidth),
          ],
        ),
      ),
    );
  }

  Widget collegeBanner(num screenWidth) {
    return Container(
      width: screenWidth,
      height: 200,
      child: CachedNetworkImage(
        width: screenWidth,
        height: 200,
        fit: BoxFit.cover,
        imageUrl: 'http://kimvoice.oss-cn-beijing.aliyuncs.com/voice/1.png',
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }

  Widget collegeContent(num screenWidth) {
    return Container(
      width: screenWidth,
      margin: EdgeInsets.only(top: 16),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.5,
        ),
        itemCount: collegeGrid.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: jumpItemDetails(context, collegeGrid[index]['page']),
            child: Container(
              child: Column(
                children: <Widget>[
                  Image.asset(
                    collegeGrid[index]['url'],
                    width: 40,
                    height: 40,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      collegeGrid[index]['text'],
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
