import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:yanyou/api/Advisory.dart';
import 'package:yanyou/api/Banner.dart';
import 'package:yanyou/components/Home/AdvisoryItem.dart';
import 'package:yanyou/components/Home/BannerSwiper.dart';
import 'package:yanyou/components/Home/CheckIn.dart';
import 'package:yanyou/components/Home/MicroPage.dart';
import 'package:yanyou/models/AdvisoryModel.dart';

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> bannersUrl = [];
  List<AdvisoryModel> advisoryList = [];
  bool loading = true;
  int page = 1;
  int count = 3;
  @override
  void initState() {
    super.initState();
    requestBanner();
    requestAdvisoryList('refresh', page++, count);
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

  Future<void> requestAdvisoryList(String type, int page, int count) async {
    try {
      var result = await getAdvisoryList(page: page, count: count);
      if (result['noerr'] == 0) {
        List<AdvisoryModel> tempAdvisoryList = result['data']
            .map((item) {
              return AdvisoryModel.fromJson(item);
            })
            .cast<AdvisoryModel>()
            .toList();
        setState(() {
          if (type == 'refresh') {
            advisoryList = tempAdvisoryList;
          } else {
            advisoryList.addAll(tempAdvisoryList);
          }
        });
      }
    } catch (err) {
      print(err);
    }
  }

  Future<void> onLoadHandler() async {
    await requestAdvisoryList('load', page++, count);
  }

  Future<void> onRefreshHandler() async {
    page = 1;
    await requestAdvisoryList('refresh', page++, count);
  }

  @override
  Widget build(BuildContext context) {
    num screenWidth = MediaQuery.of(context).size.width;
    List<Widget> widgetsList = initialHeaderWidgets(screenWidth);
    List<Widget> advisoryWidget = advisoryList.map((item) {
      return AdvisoryItem(advisory: item);
    }).toList();
    widgetsList.addAll(advisoryWidget);
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
