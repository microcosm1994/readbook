import 'package:flutter/material.dart';
import '../../widget/swiper.dart';
import '../../../data/bookMall/bookMall.dart';
import 'package:readbook/utils/coverImage.dart';

class Ranking extends StatefulWidget {
  @override
  _Rankingstate createState() => _Rankingstate();
}

class _Rankingstate extends State<Ranking> {
// 排行id
  final String totalRank = '564d8494fe996c25652644d2';
  List books;
  List swiperList = List();
  Map data;
  void onChanged(val) {
    setState(() {
      data = val;
    });
  }

  @override
  void initState() {
    // 请求数据
    BookMall().getRankingList(totalRank).then((res) => {
          this.books = res['ranking']['books'],
          for (int i = 0; i < this.books.length; i++)
            {
              if (i < 3) {this.swiperList.add(res['ranking']['books'][i])}
            },
          this.setState(() => {swiperList: this.swiperList})
        });
    this.setState(() => {});
  }

  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(0.0),
                  margin: EdgeInsets.all(0.0),
                  child: SwiperPage(
                      swiperList: swiperList,
                      callBack: (value) => onChanged(value)),
                  height: 200.0,
                ),
                Container(
                  // Another fixed-height child.
                  color: const Color(0xff008000), // Green
                  height: 120.0,
                ),
                Container(
                  // Another fixed-height child.
                  color: const Color(0xff008000), // Green
                  height: 120.0,
                ),
                Container(
                  // Another fixed-height child.
                  color: Colors.black54, // Green
                  height: 120.0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
