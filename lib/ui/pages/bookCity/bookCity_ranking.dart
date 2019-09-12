import 'package:flutter/material.dart';
import '../../widget/swiper.dart';
import '../../widget/bookDes.dart';
import '../../../data/bookMall/bookMall.dart';

class Ranking extends StatefulWidget {
  // 获取父组件的值
  Ranking({Key key, this.tabsName}) : super(key: key);
  final tabsName;
  @override
  _Rankingstate createState() => _Rankingstate();
}

class _Rankingstate extends State<Ranking> {
// 排行id
  final String totalRank = '564d8494fe996c25652644d2';
  List books;
  Map data;
  // 获取排行榜数据
  void getRankingData() {
    // 请求数据
    BookMall().getRankingList(totalRank).then((res) {
      this.setState(() {
        this.books = res['ranking']['books'];
      });
    });
  }

  // 获取男生数据
  void getTypeData(params) {
    // 请求数据
    BookMall().getTypeData(params).then((res) {
      this.setState(() {
        this.books = res['books'];
      });
    });
  }

  @override
  void initState() {
    Map<String, dynamic> params = {
      'gender': 'male',
      'major': '玄幻',
      'type': 'hot',
      'minor': '',
      'start': '0',
      'limit': '20',
    };
    // 排行榜
    if (widget.tabsName == 'ranking') {
      this.getRankingData();
    }
    // 男生
    if (widget.tabsName == 'man') {
      params['gender'] = 'male';
      params['major'] = '玄幻';
      this.getTypeData(params);
    }
    // 女生
    if (widget.tabsName == 'woman') {
      params['gender'] = 'female';
      params['major'] = '古代言情';
      this.getTypeData(params);
    }
    // 出版
    if (widget.tabsName == 'publish') {
      params['gender'] = 'press';
      params['major'] = '传记名著';
      this.getTypeData(params);
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          child: SwiperPage(books: books),
          height: 200.0,
        ),
        Container(
          child: bookList(),
        ),
      ],
    );
  }

  Widget bookList() {
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
