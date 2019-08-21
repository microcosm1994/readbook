import 'package:flutter/material.dart';
import '../../data/bookMall/bookMall.dart';
import '../widget/swiper.dart';

class BookCity extends StatelessWidget {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    var data = BookMall().getType();
    print(data);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            const Icon(Icons.search),
            const Expanded(
              child: Text('请输入搜索内容'),
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
              color: Colors.black,
            ),
          ],
        ),
      ),
      body: Center(
        child: SwiperPage(),
      ),
    );
  }

  void initSwiper() {}
}
