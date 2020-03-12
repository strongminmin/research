import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:yanyou/common/index.dart';
import 'package:yanyou/pages/College/CollegeDetails.dart';
import 'package:yanyou/pages/College/CollegeDetails/Admissions.dart';
import 'package:yanyou/pages/College/CollegeDetails/Experience.dart';
import 'package:yanyou/pages/College/CollegeDetails/GraduateCollege.dart';
import 'package:yanyou/pages/College/CollegeDetails/ReportRatio.dart';
import 'package:yanyou/pages/College/CollegeDetails/Resources.dart';
import 'package:yanyou/pages/College/CollegeDetails/ScoreLine.dart';
import 'package:yanyou/pages/College/CollegeDetails/Senior.dart';
import 'package:yanyou/pages/College/CollegeDetails/Totor.dart';
import 'package:yanyou/pages/College/CollegeDetails/Transfer.dart';
import 'package:yanyou/pages/Home/AdvisoryDetails.dart';
import 'package:yanyou/pages/Home/CheckPage.dart';
import 'package:yanyou/pages/Home/RewardPage.dart';
import 'package:yanyou/pages/MessageCircle/ReleaseMessage.dart';
import 'package:yanyou/pages/PersonalCenter/PersonalItem/Feedback.dart';
import 'package:yanyou/pages/PersonalCenter/PersonalItem/History.dart';
import 'package:yanyou/pages/PersonalCenter/PersonalItem/Message.dart';
import 'package:yanyou/pages/PersonalCenter/PersonalItem/ReleaseList.dart';
import 'package:yanyou/pages/PersonalCenter/PersonalItem/Setup.dart';
import 'package:yanyou/pages/index.dart';

// 主页
Handler rootHandler = Handler(
  handlerFunc: (BuildContext context, Map params) {
    return Index();
  },
);
// 打卡
Handler checkHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List> params) {
    return CheckPage();
  },
);

// 发布消息
Handler releaseMessageHander = Handler(
  handlerFunc: (BuildContext context, Map<String, List> params) {
    return ReleaseMessage();
  },
);

// 热点详情
Handler advisoryDetailsHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List> params) {
    print(params);
    int id = int.parse(params['advisoryId'][0]);
    return AdvisoryDetails(advisoryId: id);
  },
);

// 扫码支付页面
Handler rewardPageHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List> params) {
    print(params);
    return RewardPage(type: params['type'][0]);
  },
);

// 院校详情
Handler collegeDetailsHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List> params) {
    String collegeNameEncode = params['name'][0];
    String collegeName = FluroConvertUtils.fluroCnParamsDecode(
      collegeNameEncode,
    );
    return CollegeDetails(collegeName: collegeName);
  },
);

// 院校详情页中各项页面
// 研究生院
Handler collegeDetailsGraduateCollegeHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List> params) {
    String collegeNameEncode = params['name'][0];
    String collegeName = FluroConvertUtils.fluroCnParamsDecode(
      collegeNameEncode,
    );
    return GraduateCollege(collegeName: collegeName);
  },
);
// 报录比
Handler collegeDetailsReportRatioHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List> params) {
    String collegeNameEncode = params['name'][0];
    String collegeName = FluroConvertUtils.fluroCnParamsDecode(
      collegeNameEncode,
    );
    return ReportRatio(collegeName: collegeName);
  },
);
// 考研经验
Handler collegeDetailsExperienceHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List> params) {
    String collegeNameEncode = params['name'][0];
    String collegeName = FluroConvertUtils.fluroCnParamsDecode(
      collegeNameEncode,
    );
    return Experience(collegeName: collegeName);
  },
);
// 直通学长
Handler collegeDetailsSeniorHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List> params) {
    String collegeNameEncode = params['name'][0];
    String collegeName = FluroConvertUtils.fluroCnParamsDecode(
      collegeNameEncode,
    );
    return Senior(collegeName: collegeName);
  },
);

// 研究生导师
Handler collegeDetailsTotorHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List> params) {
    String collegeNameEncode = params['name'][0];
    String collegeName = FluroConvertUtils.fluroCnParamsDecode(
      collegeNameEncode,
    );
    return Totor(collegeName: collegeName);
  },
);

// 真题资料
Handler collegeDetailsResourcesHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List> params) {
    String collegeNameEncode = params['name'][0];
    String collegeName = FluroConvertUtils.fluroCnParamsDecode(
      collegeNameEncode,
    );
    return Resources(collegeName: collegeName);
  },
);

// 招生简章
Handler collegeDetailsAdmissonsHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List> params) {
    String collegeNameEncode = params['name'][0];
    String collegeName = FluroConvertUtils.fluroCnParamsDecode(
      collegeNameEncode,
    );
    return Admissions(collegeName: collegeName);
  },
);
// 历年分数线
Handler collegeDetailsScoreLineHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List> params) {
    String collegeNameEncode = params['name'][0];
    String collegeName = FluroConvertUtils.fluroCnParamsDecode(
      collegeNameEncode,
    );
    return ScoreLine(collegeName: collegeName);
  },
);
// 考研调剂
Handler collegeDetailsTransferHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List> params) {
    String collegeNameEncode = params['name'][0];
    String collegeName = FluroConvertUtils.fluroCnParamsDecode(
      collegeNameEncode,
    );
    return Transfer(collegeName: collegeName);
  },
);

// 个人中心各项路由
// 我的消息
Handler personalMessageHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List> params) {
    return Message();
  },
);
// 我发布的
Handler personalReleaseListHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List> params) {
    return ReleaseList();
  },
);
// 浏览记录
Handler personalHistoryHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List> params) {
    return History();
  },
);
// 系统反馈
Handler personalFeedbackHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List> params) {
    return SystemFeedback();
  },
);
// 设置
Handler personalSetupHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List> params) {
    return Setup();
  },
);
