import 'package:flutter/material.dart';

class NewsTab {
  String text;
  String tab;
  NewsTab(this.text,this.tab);
}
//定义tab页基本数据结构
final List<NewsTab> NewsTabs = <NewsTab>[
  new NewsTab('金融','financial'),
  new NewsTab('科技','technology'),
  new NewsTab('医疗','medical'),
];

class TabNavigation extends StatelessWidget {
  TabNavigation({this.currentTab, this.onSelectTab});
  final NewsTab currentTab;
  final ValueChanged<NewsTab> onSelectTab;  //这个参数比较关键，仔细理解下，省了setState()调用的环节

  @override
  Widget build(BuildContext context) {
    return Row(
      children: NewsTabs.map((item){
        return GestureDetector(    //手势监听控件，用于监听各种手势
          child: Container(
            padding: EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 0.0),
            child: Text(item.text,style: TextStyle(color: _colorTabMatching(item: item)),), 
          ),
          onTap: ()=>onSelectTab(item,)  
          //onSelectTab函数的使用非常巧妙，
          //相当于定义了一个接口，可操控当前控件以外的数据
        );
      }).toList()       
    );
  }

  //定义tab被选中和没被选中的颜色样式
  Color _colorTabMatching({NewsTab item}) {
    return currentTab == item ? Colors.black : Colors.grey;
  }
}