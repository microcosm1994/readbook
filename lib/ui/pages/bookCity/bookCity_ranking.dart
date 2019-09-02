import 'package:flutter/material.dart';
import '../../widget/swiper.dart';
import '../../../data/bookMall/bookMall.dart';
import 'package:readbook/utils/coverImage.dart';

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
    };
    if (widget.tabsName == 'ranking') {
      this.getRankingData();
    }
    if (widget.tabsName == 'man') {
      params['gender'] = 'male';
      params['major'] = '玄幻';
      this.getTypeData(params);
    }
    if (widget.tabsName == 'woman') {
      params['gender'] = 'female';
      params['major'] = '古代言情';
      this.getTypeData(params);
    }
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
            child: bookDes(books[index]),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: Color(0xffe5e5e5)))),
          );
        });
  }

  Widget bookDes(Map book) {
    print(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: 70.0,
          child: Image.network(
              CoverImage.convertImageUrl(
                book['cover'],
              ),
              fit: BoxFit.contain),
        ),
        new Expanded(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: new Column(
              children: <Widget>[
                Text(
                  book['title'],
                  softWrap: true,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  book['shortIntro'],
                  softWrap: true,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
