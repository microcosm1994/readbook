import 'package:flutter/material.dart';
import '../../widget/bookDes.dart';
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
  String type = 'hot';
  var hotStyle = Colors.green[500];
  var nStyle = Colors.black87;
  var overStyle = Colors.black87;
  List books = [];
  // 获取分类小说列表
  void getTypeData() {
    this.setState(() {
      this.books = [];
    });
    Map<String, dynamic> params = {
      'gender': widget.gender,
      'major': widget.data['name'],
      'type': this.type,
      'minor': '',
      'start': '0',
      'limit': '20',
    };
    // 请求数据
    BookMall().getTypeData(params).then((res) {
      print(res['books'].length);
      this.setState(() {
        this.books = res['books'];
      });
    });
  }

  @override
  void initState() {
    this.getTypeData();
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
                          this.setState(() {
                            this.type = 'hot';
                            this.hotStyle = Colors.green[500];
                            this.nStyle = Colors.black87;
                            this.overStyle = Colors.black87;
                          });
                          this.getTypeData();
                        },
                        child: Text('热门', textAlign: TextAlign.center, style: TextStyle(
                          color: this.hotStyle
                        ),),
                      ),
                    ),
                    new Expanded(
                      child: new GestureDetector(
                        onTap: () {
                          this.setState(() {
                            this.type = 'new';
                            this.hotStyle = Colors.black87;
                            this.nStyle = Colors.green[500];
                            this.overStyle = Colors.black87;
                          });
                          this.getTypeData();
                        },
                        child: Text('新书', textAlign: TextAlign.center, style: TextStyle(
                          color: this.nStyle
                        ),),
                      ),
                    ),
                    new Expanded(
                      child: new GestureDetector(
                        onTap: () {
                          this.setState(() {
                            this.type = 'over';
                            this.hotStyle = Colors.black87;
                            this.nStyle = Colors.black87;
                            this.overStyle = Colors.green[500];
                          });
                          this.getTypeData();
                        },
                        child: Text('完结', textAlign: TextAlign.center, style: TextStyle(
                          color: this.overStyle
                        ),),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: ListView(
                  children: <Widget>[buildList(this.books)],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList(List books) {
    return ListView.builder(
        shrinkWrap: true, //解决无限高度问题
        physics: new NeverScrollableScrollPhysics(), //禁用滑动事件
        itemCount: books.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.only(left: 10),
            child: new BookDes(book: books[index]),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: Color(0xffe5e5e5)))),
          );
        });
  }
}
