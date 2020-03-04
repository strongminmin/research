import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:yanyou/pages/Home/AdvisoryDetails.dart';
import 'package:yanyou/pages/Home/RewardPage.dart';
import 'package:yanyou/pages/MessageCircle/ReleaseMessage.dart';
import 'package:yanyou/pages/index.dart';

// 主页
Handler rootHandler = Handler(
  handlerFunc: (BuildContext context, Map params) {
    return Index();
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
    return AdvisoryDetails();
  },
);

// 扫码支付页面
Handler rewardPageHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List> params) {
    print(params);
    return RewardPage(type: params['type'][0]);
  },
);
