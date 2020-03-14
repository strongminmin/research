import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yanyou/common/index.dart';
import 'package:yanyou/components/College/CityDrawer.dart';
import 'package:yanyou/models/UserModel.dart';
import 'package:yanyou/provider/UserProvider.dart';
import 'package:yanyou/routes/Application.dart';
import 'package:yanyou/routes/Routes.dart';

class College extends StatefulWidget {
  _CollegeState createState() => _CollegeState();
}

class _CollegeState extends State<College> {
  void cityChangeHandler(String city) {
    print(city);
    Navigator.of(context).pop();
  }

  List<String> colleges = [
    '平顶山学院',
    '北京邮电大学',
    '西安电子科技大学',
    '平顶山学院',
    '平顶山学院',
    '平顶山学院',
  ];
  Function jumpCollegeDetails(String collegeName) {
    return () {
      String collegeNameEncode = FluroConvertUtils.fluroCnParamsEncode(
        collegeName,
      );
      UserModel userModel = Provider.of<UserProvider>(
        context,
        listen: false,
      ).userInfo;
      if (userModel.userId == 0) {
        Application.router.navigateTo(
          context,
          Routes.loginPage,
          transition: TransitionType.native,
        );
      } else {
        Application.router.navigateTo(
          context,
          '${Routes.collegeDetailsPage}?name=$collegeNameEncode',
          transition: TransitionType.native,
        );
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('院校'),
        centerTitle: true,
      ),
      drawer: CityDrawer(
        citys: ['北京市', '河南省'],
        changeHandler: cityChangeHandler,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 4,
            childAspectRatio: 3,
          ),
          itemCount: colleges.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: jumpCollegeDetails(colleges[index]),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(
                    colleges[index],
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.blue[300],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
