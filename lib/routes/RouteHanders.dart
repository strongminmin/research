import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:yanyou/pages/MessageCircle/ReleaseMessage.dart';
import 'package:yanyou/pages/index.dart';

Handler rootHandler = Handler(
  handlerFunc: (BuildContext context, Map params) {
    return Index();
  },
);

Handler releaseMessageHander = Handler(
  handlerFunc: (BuildContext context, Map params) {
    return ReleaseMessage();
  },
);
