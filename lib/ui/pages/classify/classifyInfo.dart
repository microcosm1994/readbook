import 'package:flutter/material.dart';
import 'package:readbook/utils/coverImage.dart';
import '../../../data/bookMall/bookMall.dart';

class classifyInfo extends StatefulWidget {
  // 获取父组件的值
  classifyInfo({Key key, this.gender, this.data}) : super(key: key);
  String gender;
  Map data;
  @override
  _classifyInfoState createState() => _classifyInfoState();
}

class _classifyInfoState extends State<classifyInfo> {
  Map<dynamic, dynamic> data = {};
  // 获取小说分类
  void getType() {
    // 请求数据
    BookMall().getType().then((res) {
      this.setState(() {
        this.data = res;
      });
    });
  }

  @override
  void initState() {
    // this.getType();
    print(widget.data);
    super.initState();
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.black54,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () => Navigator.pushNamed(context, '/search'),
              color: Colors.black54,
            ),
          ],
          backgroundColor: Colors.grey[50],
          title: Center(
            child: Text(
              widget.data['name'],
              style: TextStyle(color: Colors.black54, fontSize: 16.0),
            ),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Container(
                height: 40.0,
                child: Row(
                  children: <Widget>[
                    new Expanded(
                      child: new GestureDetector(
                        onTap: () {
                          debugPrint('hot');
                        },
                        child: Text('热门', textAlign: TextAlign.center),
                      ),
                    ),
                    new Expanded(
                      child: new GestureDetector(
                        onTap: () {
                          debugPrint('new');
                        },
                        child: Text('新书', textAlign: TextAlign.center),
                      ),
                    ),
                    new Expanded(
                      child: new GestureDetector(
                        onTap: () {
                          debugPrint('repulation');
                        },
                        child: Text('好评', textAlign: TextAlign.center),
                      ),
                    ),
                    new Expanded(
                      child: new GestureDetector(
                        onTap: () {
                          debugPrint('over');
                        },
                        child: Text('完结', textAlign: TextAlign.center),
                      ),
                    ),
                    new Expanded(
                      child: new GestureDetector(
                        onTap: () {
                          debugPrint('month');
                        },
                        child: Text('包月', textAlign: TextAlign.center),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
