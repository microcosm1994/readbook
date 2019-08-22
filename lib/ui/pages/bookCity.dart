import 'package:flutter/material.dart';
import '../../data/bookMall/bookMall.dart';
import '../widget/swiper.dart';

class BookCity extends StatelessWidget {
  void initState() {}
  @override
  Widget build(BuildContext context) {
    // var data = BookMall().getType();
    // print(data);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        title: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                  child: FlatButton(
                onPressed: this.goToSearch,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.search),
                    Expanded(child: Text('请输入搜索内容')),
                  ],
                ),
                color: Colors.grey[10],
                textColor: Colors.black54,
                splashColor: Colors.grey[50],
              )),
              IconButton(
                icon: Icon(Icons.apps),
                onPressed: () {},
                color: Colors.black54,
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: this.buildGrid(context),
      ),
    );
  }

  Widget buildGrid(BuildContext context) {
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
              ],
            ),
          ),
        );
      },
    );
  }

  void initSwiper() {}

  void goToSearch() {
    print(111);
  }
}
