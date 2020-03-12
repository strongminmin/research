import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:yanyou/routes/RouteHanders.dart';

class Routes {
  // 首页
  static String root = '/';
  // 打卡
  static String checkPage = '/check';
  // 发布说说
  static String releaseMessagePage = '/releaseMessage';
  // 热点相关
  static String advisoryDetailsPage = '/advisoryDetails';
  static String rewardPage = '/reward';
  // 院校相关
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
  // 个人中心相关
  static String messagePage = 'personal/message';
  static String historyPage = 'personal/history';
  static String feedbackPage = 'personal/feedback';
  static String setupPage = 'personal/setup';
  static String releaseListPage = 'personal/release';

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
    // 打卡
    router.define(checkPage, handler: checkHandler);
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
    // 个人中心-我的消息
    router.define(messagePage, handler: personalMessageHandler);
    // 个人中心—我发布的
    router.define(releaseListPage, handler: personalReleaseListHandler);
    // 个人中心-浏览记录
    router.define(historyPage, handler: personalHistoryHandler);
    // 个人中心-系统反馈
    router.define(feedbackPage, handler: personalFeedbackHandler);
    // 个人中心-设置
    router.define(setupPage, handler: personalSetupHandler);
  }
}
