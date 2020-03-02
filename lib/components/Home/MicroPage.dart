import 'package:flutter/material.dart';
import 'package:yanyou/constants/index.dart';
import 'package:yanyou/routes/Application.dart';

class MicroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    num screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      width: screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: microPage.map((micro) {
          return GestureDetector(
            onTap: () {
              Application.router.navigateTo(context, micro['path']);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(micro['url'], width: 36, height: 36),
                Container(
                  margin: EdgeInsets.only(top: 2),
                  child: Text(
                    micro['text'],
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
