import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yanyou/components/Home/Reward.dart';

class AdvisoryDetails extends StatefulWidget {
  AdvisoryDetails({Key key}) : super(key: key);
  _AdvisoryDetailsState createState() => _AdvisoryDetailsState();
}

Function showRewardSheet(BuildContext context) {
  return () {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Reward();
      },
    );
  };
}

class _AdvisoryDetailsState extends State<AdvisoryDetails> {
  @override
  Widget build(BuildContext context) {
    num screenWidth = MediaQuery.of(context).size.width;
    num screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('热点详情'),
        centerTitle: true,
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        padding: EdgeInsets.only(bottom: 16),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            advisoryHander(screenWidth),
            paragraph(),
            paragraph(),
            paragraph(),
            paragraph(),
            paragraph(),
            reward(),
          ],
        ),
      ),
    );
  }

  Widget advisoryHander(num screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        advisoryBanner(screenWidth),
        advisoryTitle(),
        advisorySub(),
      ],
    );
  }

  Widget advisoryBanner(num screenWidth) {
    return Container(
      width: screenWidth,
      height: 140,
      child: CachedNetworkImage(
        width: screenWidth,
        height: 140,
        fit: BoxFit.cover,
        imageUrl: 'http://kimvoice.oss-cn-beijing.aliyuncs.com/voice/1.png',
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }

  Widget advisoryTitle() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      margin: EdgeInsets.only(top: 8),
      child: Text(
        '扩招18.9万，考研族上岸容易吗容易吗?',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget advisorySub() {
    TextStyle style = TextStyle(
      fontSize: 13,
      color: Colors.grey,
    );
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      margin: EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('发布于3分钟前', style: style),
          Text('2000人访问', style: style),
          Text('来源：考研日报', style: style),
        ],
      ),
    );
  }

  Widget paragraph() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      margin: EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 4),
            child: Text(
              '3、支持和鼓励事业单位专业技术人员离岗创新创业',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            '单位专业技术人员带着科研项目和成果离岗创办科技型企业或者到企业开展创新工作（简称离岗创业），是充分发挥市场在人才资源配置中的决定性作用，提高人才流动性，最大限度激发和释放创新创业活力的重要举措，有助于科技创新成果快速实现产业化，转化为现实生产力。',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget reward() {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: showRewardSheet(context),
            child: Container(
              width: 70,
              height: 70,
              margin: EdgeInsets.only(bottom: 4),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/reward.png',
                  width: 50,
                  height: 50,
                ),
              ),
            ),
          ),
          Text('点击打赏'),
        ],
      ),
    );
  }
}
