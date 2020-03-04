import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GraduateCollege extends StatefulWidget {
  final String collegeName;
  GraduateCollege({Key key, this.collegeName}) : super(key: key);
  _GraduateCollegeState createState() => _GraduateCollegeState();
}

class _GraduateCollegeState extends State<GraduateCollege> {
  WebViewController _webViewcontroller;
  String url = 'https://www.tsinghua.edu.cn/publish/yjsy/686/';
  String title = '研究生院';
  @override
  void initState() {
    super.initState();
    fetchRequest();
  }

  Future<void> fetchRequest() async {}
  void webViewFinishedHandler(url) {
    _webViewcontroller.evaluateJavascript('document.title').then((result) {
      setState(() {
        title = result.substring(1, result.length - 1);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted, //JS执行模式 是否允许JS执行
        onWebViewCreated: (controller) {
          _webViewcontroller = controller;
        },
        onPageFinished: webViewFinishedHandler,
      ),
    );
  }
}
