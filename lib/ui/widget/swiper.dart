import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../../data/bookMall/bookMall.dart';
import 'package:readbook/utils/coverImage.dart';

class SwiperPage extends StatefulWidget {
  // 获取父组件的值
  SwiperPage({Key key, this.books}) : super(key: key);
  List books; // 图片数组
  @override
  _SwiperPageState createState() {
    return _SwiperPageState();
  }
}

class _SwiperPageState extends State<SwiperPage> {
  // 排行id
  final String totalRank = '564d8494fe996c25652644d2';
  List swiperList; // 图片数组
  void getData() {
    print(widget.books);
    print(widget.books);
    // 取排行榜前三作为轮播图
      List arr = List();
      for (int i = 0; i < widget.books.length; i++) {
        if (i < 3) {
          arr.add(CoverImage.convertImageUrl(widget.books[i]['cover']));
        }
      }
      this.setState(() {
        this.swiperList = arr;
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData();
    print(this.swiperList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: 200.0,
          child: Swiper(
            itemBuilder: _swiperBuilder,
            itemCount: 3,
            pagination: new SwiperPagination(
                builder: DotSwiperPaginationBuilder(
              color: Colors.black54,
              activeColor: Colors.white,
            )),
            scrollDirection: Axis.horizontal,
            autoplay: true,
            onTap: (index) => print('点击了第$index个'),
          )),
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return (Image.network(
      this.swiperList[index],
      scale: 8.5,
      fit: BoxFit.contain,
    ));
  }
}
