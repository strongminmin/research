import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:yanyou/pages/index.dart';

Handler rootHandler = Handler(
  handlerFunc: (BuildContext context, Map params) {
    return Index();
  },
);
