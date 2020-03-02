import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:yanyou/components/Home/AdvisoryItem.dart';
import 'package:yanyou/components/Home/BannerSwiper.dart';
import 'package:yanyou/components/Home/CheckIn.dart';
import 'package:yanyou/components/Home/MicroPage.dart';

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> bannersUrl = [
    'assets/images/banner.jpg',
    'assets/images/banner.jpg',
    'assets/images/banner.jpg',
    'assets/images/banner.jpg',
  ];
  Future<void> onLoadHandler() async {}
  Future<void> onRefreshHandler() async {}
  @override
  Widget build(BuildContext context) {
    num screenWidth = MediaQuery.of(context).size.width;
    List<Widget> widgetsList = initialHeaderWidgets(screenWidth);
    return Scaffold(
      appBar: AppBar(
        title: Text('研优'),
        centerTitle: true,
      ),
      body: Container(
        width: screenWidth,
        color: Colors.white,
        child: EasyRefresh(
          onLoad: onLoadHandler,
          onRefresh: onRefreshHandler,
          footer: MaterialFooter(),
          header: MaterialHeader(),
          child: ListView(
            children: widgetsList,
          ),
        ),
      ),
    );
  }

  List<Widget> initialHeaderWidgets(screenWidth) {
    return <Widget>[
      CheckIn(),
      BannerSwiper(bannersUrl: bannersUrl),
      MicroPage(),
      Container(
        width: screenWidth,
        height: 0.5,
        margin: EdgeInsets.symmetric(vertical: 12),
        color: Colors.grey[200],
      ),
      hotTitle(),
      AdvisoryItem(),
      AdvisoryItem(),
      AdvisoryItem(),
      AdvisoryItem(),
      AdvisoryItem(),
    ];
  }

  Widget hotTitle() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 4,
            height: 20,
            margin: EdgeInsets.only(right: 4),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(2)),
          ),
          Text(
            '每日热点',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
