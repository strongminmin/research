import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:yanyou/routes/RouteHanders.dart';

class Routes {
  static String root = '/';
  static String releaseMessagePage = '/releaseMessage';
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
    router.define(root, handler: rootHandler);
    router.define(releaseMessagePage, handler: releaseMessageHander);
  }
}
