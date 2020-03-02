import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    num screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('研优'),
        centerTitle: true,
      ),
      body: Container(
        width: screenWidth,
        // color: Colors.grey[200],
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CheckIn(),
            BannerSwiper(bannersUrl: bannersUrl),
            MicroPage(),
            Container(
              width: screenWidth,
              height: 0.5,
              margin: EdgeInsets.symmetric(vertical: 12),
              color: Colors.grey[200],
            )
          ],
        ),
      ),
    );
  }
}
