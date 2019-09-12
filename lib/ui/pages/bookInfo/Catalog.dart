import 'package:flutter/material.dart';
import '../../../data/bookMall/bookMall.dart';

class Catalog extends StatefulWidget {
  // 获取父组件的值
  Catalog({Key key, this.bookId}) : super(key: key);
  String bookId;
  @override
  _Catalog createState() => _Catalog();
}

class _Catalog extends State<Catalog> {
  List bookList = [];
  // 获取排行榜数据
  void getBookCatalog() {
    // 请求数据
    BookMall().getBookCatalog(widget.bookId).then((res) {
      this.setState(() {
        this.bookList = res['mixToc']['chapters'];
      });
    });
  }

  @override
  void initState() {
    this.getBookCatalog();
    super.initState();
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 280,
      color: Colors.grey[50],
      child: ListView(
        children: <Widget>[
          Container(
            height: 40.0,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black12))),
            child: new GestureDetector(
              onTap: () {
                debugPrint('排序');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '目录',
                    style: TextStyle(color: Colors.black87, fontSize: 18.0),
                    textAlign: TextAlign.center,
                  ),
                  Icon(
                    Icons.import_export,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: buildList(context),
          )
        ],
      ),
    );
  }

  // 目录列表
  Widget buildList(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, //解决无限高度问题
      physics: new NeverScrollableScrollPhysics(), //禁用滑动事件
      itemCount: bookList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[200]))),
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 220.0,
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text.rich(
                    TextSpan(
                      text: '${index + 1}',
                      style: TextStyle(color: Colors.black54, fontSize: 12.0),
                      children: <TextSpan>[
                        TextSpan(
                            text: '${bookList[index]['title']}',
                            style: TextStyle(color: Colors.black54, fontSize: 14.0)),
                      ],
                    ),
                    softWrap: false,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 15.0),
                  // child: Text('${bookList[index]['unreadble']}'),
                )
              ],
            ));
      },
    );
  }
}
