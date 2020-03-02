import 'package:flutter/material.dart';
import 'package:yanyou/routes/Application.dart';

class CheckIn extends StatefulWidget {
  _CheckInState createState() => _CheckInState();
}

class _CheckInState extends State<CheckIn> {
  String _year = '2021';
  String _remainDay = '292';
  bool _check = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '$_year 届考研倒计时',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    _remainDay,
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                  Text('天')
                ],
              ),
              GestureDetector(
                onTap: () {
                  Application.router.navigateTo(
                    context,
                    'checkin?check=$_check',
                  );
                },
                child: Container(
                  width: 70,
                  height: 30,
                  decoration: BoxDecoration(
                      color: _check ? Colors.grey : Colors.blue[400],
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2,
                        )
                      ]),
                  child: Center(
                    child: Text(
                      _check ? '已打卡' : '打卡',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
