import 'package:flutter/material.dart';
import 'package:readbook/ui/pages/bookCity/bookCity_ranking.dart'; // 排行榜组件

class BookCity extends StatelessWidget {
  // tabs
  String tabsName = 'ranking'; 
  void initState() {}
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
            color: Colors.black54,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.widgets),
              onPressed: () {
                Navigator.pushNamed(context, '/classify');
              },
              color: Colors.black54,
            )
          ],
          backgroundColor: Colors.grey[50],
          title: Center(
            child: Text(
              '二蛋阅读',
              style: TextStyle(color: Colors.black87),
            ),
          ),
          bottom: TabBar(
            isScrollable: true,
            labelColor: Colors.black87,
            unselectedLabelColor: Colors.black45,
            indicatorColor: Colors.orange,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 2.0,
            //是否可以滚动
            tabs: <Widget>[
              Tab(
                child: Center(child: Text('排行榜')),
              ),
              Tab(
                child: Center(child: Text('男生')),
              ),
              Tab(
                child: Center(child: Text('女生')),
              ),
              Tab(
                child: Center(child: Text('出版')),
              ),
            ],
          ),
        ),
        body: Center(
          child: TabBarView(
            children: <Widget>[
              // 排行榜
              new Ranking(tabsName: 'ranking'),
              // 男生
              new Ranking(tabsName: 'man'),
              // 女生
              new Ranking(tabsName: 'woman'),
              // 出版
              new Ranking(tabsName: 'publish'),
            ],
          ),
        ),
      ),
    );
  }
}
