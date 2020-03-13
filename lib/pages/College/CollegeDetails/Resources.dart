import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class Resources extends StatefulWidget {
  final String collegeName;
  Resources({Key key, this.collegeName}) : super(key: key);
  _ResourcesState createState() => _ResourcesState();
}

class _ResourcesState extends State<Resources> {
  List<Map> courceResources = [
    {
      'cource': '数据结构',
      'resource': [
        {
          'url': 'https://pan.baidu.com/s/1_JgZFUTxgyHbFtLIJpy4pA',
          'ident': 'fi1t',
        },
        {
          'url': 'https://pan.baidu.com/s/1_JgZFUTxgyHbFtLIJpy4pA',
          'ident': 'fi1t',
        },
        {
          'url': 'https://pan.baidu.com/s/1_JgZFUTxgyHbFtLIJpy4pA',
          'ident': 'fi1t',
        }
      ]
    },
    {
      'cource': '数据结构',
      'resource': [
        {
          'url': 'https://pan.baidu.com/s/1_JgZFUTxgyHbFtLIJpy4pA',
          'ident': 'fi1t',
        }
      ]
    },
    {
      'cource': '数据结构',
      'resource': [
        {
          'url': 'https://pan.baidu.com/s/1_JgZFUTxgyHbFtLIJpy4pA',
          'ident': 'fi1t',
        }
      ]
    },
    {
      'cource': '数据结构',
      'resource': [
        {
          'url': 'https://pan.baidu.com/s/1_JgZFUTxgyHbFtLIJpy4pA',
          'ident': 'fi1t',
        }
      ]
    },
    {
      'cource': '数据结构',
      'resource': [
        {
          'url': 'https://pan.baidu.com/s/1_JgZFUTxgyHbFtLIJpy4pA',
          'ident': 'fi1t',
        }
      ]
    },
    {
      'cource': '数据结构',
      'resource': [
        {
          'url': 'https://pan.baidu.com/s/1_JgZFUTxgyHbFtLIJpy4pA',
          'ident': 'fi1t',
        }
      ]
    },
  ];
  @override
  void initState() {
    super.initState();
    fetchRequest();
  }

  // 通过学校名称去拿资料
  Future<void> fetchRequest() async {}

  Function callCoundDisk(String url) {
    return () async {
      try {
        var result = await launch(url);
        if (!result) {
          Toast.show(
            '打开百度网盘失败，请自行粘贴地址到浏览器中打开',
            context,
            duration: Toast.LENGTH_LONG,
          );
        }
        print(result);
      } catch (err) {
        print(err);
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    num screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('真题资料'),
        centerTitle: true,
      ),
      body: Container(
        width: screenWidth,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: contentWidget(),
          ),
        ),
      ),
    );
  }

  List<Widget> contentWidget() {
    List<Widget> courcesWidget = courceResources
        .map((cource) {
          List<Widget> resources = cource['resource']
              .map((source) {
                return GestureDetector(
                  onTap: callCoundDisk(source['url']),
                  child: Container(
                    padding: EdgeInsets.all(4),
                    margin: EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SingleChildScrollView(
                          child: SelectableText(
                            '链接：${source['url']}',
                          ),
                        ),
                        SelectableText('密码：${source['ident']}'),
                      ],
                    ),
                  ),
                );
              })
              .cast<Widget>()
              .toList();
          return Container(
            color: Colors.blue[100],
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 8),
                  child: Text(
                    cource['cource'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: resources,
                  ),
                ),
              ],
            ),
          );
        })
        .cast<Widget>()
        .toList();
    return courcesWidget;
  }
}
