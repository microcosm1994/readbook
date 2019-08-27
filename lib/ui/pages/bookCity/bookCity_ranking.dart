import 'package:flutter/material.dart';
import '../../widget/swiper.dart';
import '../../../data/bookMall/bookMall.dart';
import 'package:readbook/utils/coverImage.dart';

class Ranking extends StatelessWidget {
  final String totalRank = '564d8494fe996c25652644d2';
  void initState() {}
  Widget build(BuildContext context) {
    // 请求数据
    var data = BookMall().getRankingList(totalRank);
    print(data is Map);
    print(data['ranking']);
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
                  child: SwiperPage(),
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
