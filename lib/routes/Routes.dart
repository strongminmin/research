import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:yanyou/routes/RouteHanders.dart';

class Routes {
  static String root = '/';
  static String releaseMessagePage = '/releaseMessage';
  static String advisoryDetailsPage = '/advisoryDetails';
  static String rewardPage = '/reward';
  static String collegeDetailsPage = '/collegeDetails';
  static String graduateCollegePage = '$collegeDetailsPage/graduateCollege';
  static String reportRatioPage = '$collegeDetailsPage/reportRatio';
  static String experiencePage = '$collegeDetailsPage/experience';
  static String seniorPage = '$collegeDetailsPage/senior';
  static String totorPage = '$collegeDetailsPage/totor';
  static String resourcesPage = '$collegeDetailsPage/resources';
  static String admissionsPage = '$collegeDetailsPage/admissions';
  static String scoreLinePage = '$collegeDetailsPage/scoreLine';
  static String transferPage = '$collegeDetailsPage/transfer';
  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print("ROUTE WAS NOT FOUND !!!");
        return Container(
          child: Center(
            child: Text('ROUTE WAS NOT FOUND !!!'),
          ),
        );
      },
    );
    // 首页
    router.define(root, handler: rootHandler);
    // 发布消息
    router.define(releaseMessagePage, handler: releaseMessageHander);
    // 热点详情
    router.define(advisoryDetailsPage, handler: advisoryDetailsHandler);
    // 打赏
    router.define(rewardPage, handler: rewardPageHandler);
    // 院校详情
    router.define(collegeDetailsPage, handler: collegeDetailsHandler);
    // 院校详情-研究生院
    router.define(
      graduateCollegePage,
      handler: collegeDetailsGraduateCollegeHandler,
    );
    // 院校详情-报录比
    router.define(
      reportRatioPage,
      handler: collegeDetailsReportRatioHandler,
    );
    // 院校详情-考研经验
    router.define(
      experiencePage,
      handler: collegeDetailsExperienceHandler,
    );
    // 院校详情-直通学长
    router.define(
      seniorPage,
      handler: collegeDetailsSeniorHandler,
    );
    // 院校详情-研究生导师
    router.define(
      totorPage,
      handler: collegeDetailsTotorHandler,
    );
    // 院校详情-真题资料
    router.define(
      resourcesPage,
      handler: collegeDetailsResourcesHandler,
    );
    // 院校详情-招生简章
    router.define(
      admissionsPage,
      handler: collegeDetailsAdmissonsHandler,
    );
    // 院校详情-历年分数线
    router.define(
      scoreLinePage,
      handler: collegeDetailsScoreLineHandler,
    );
    // 院校详情-考研调剂
    router.define(
      transferPage,
      handler: collegeDetailsTransferHandler,
    );
  }
}
