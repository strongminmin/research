import 'package:flutter/material.dart';

class Admissions extends StatefulWidget {
  final String collegeName;
  Admissions({Key key, this.collegeName}) : super(key: key);
  _AdmissionsState createState() => _AdmissionsState();
}

class _AdmissionsState extends State<Admissions> {
  String content =
      ' 2018年录取的保留入学资格2年、2019年录取的保留入学资格1年或2年的同学，若希望于2020年9月返校入学，请向录取院（系、所、中心）研究生办公室联系入学事宜。此类同学应先填写《清华大学保留入学资格返校申请表》，由所在工作单位人事部门签署意见（签字盖章），并于2020年5月1日前向所录取的院系业务办提交该申请表。';
  @override
  void initState() {
    super.initState();
    fetchRequest();
  }

  Future<void> fetchRequest() async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('招生简章'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: content == ''
            ? Center(
                child: Text('信息未录入'),
              )
            : Text(
                content,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
      ),
    );
  }
}
