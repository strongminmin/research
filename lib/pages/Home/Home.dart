import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:yanyou/api/Banner.dart';
import 'package:yanyou/components/Home/AdvisoryItem.dart';
import 'package:yanyou/components/Home/BannerSwiper.dart';
import 'package:yanyou/components/Home/CheckIn.dart';
import 'package:yanyou/components/Home/MicroPage.dart';

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> bannersUrl = [];
  bool loading = true;
  @override
  void initState() {
    super.initState();
    requestBanner();
  }

  Future<void> requestBanner() async {
    try {
      var result = await getBannerList();
      if (result['noerr'] == 0) {
        List<String> tempBannersUrl = result['data']
            .map((item) {
              return item['banner_url'];
            })
            .cast<String>()
            .toList();
        setState(() {
          bannersUrl = tempBannersUrl;
          loading = false;
        });
      }
    } catch (err) {
      print(err);
    }
  }

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
      body: loading
          ? Center(child: CircularProgressIndicator())
          : Container(
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
