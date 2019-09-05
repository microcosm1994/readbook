import 'package:flutter/material.dart';
import '../../widget/bookDes.dart';
import '../../../data/bookMall/bookMall.dart';

class searchBarDelegate extends SearchDelegate<String> {
  List keyWords = [];
  List bookList = [];
  void getSearch(String value) {
    BookMall().getSearch(value).then((res) {
      bookList = res['books'];
    });
  }

  void getAutoSearch(String value) {
    if (value.isNotEmpty) {
      BookMall().getAutoSearch(value).then((res) {
        keyWords = res['keywords'];
        print(res);
      });
    }
  }

  // 搜索框右侧按钮
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = '';
        },
        color: Colors.black54,
      )
    ];
  }

  // 搜索框左侧返回按钮
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () => close(context, null));
  }

  // 搜索结果
  @override
  Widget buildResults(BuildContext context) {
    this.getSearch(query);
    return Container(
        child: ListView.builder(
            shrinkWrap: true, //解决无限高度问题
            physics: new NeverScrollableScrollPhysics(), //禁用滑动事件
            itemCount: this.bookList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.only(left: 10),
                child: BookDes(book: this.bookList[index]),
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 1, color: Color(0xffe5e5e5)))),
              );
            }));
  }

  // 搜索建议
  @override
  Widget buildSuggestions(BuildContext context) {
    this.getAutoSearch(query);
    if (this.keyWords != null) {
      return new GestureDetector(
        onTap: () {
          showResults(context);
        },
        child: Container(
            child: this.keyWords.length > 0
                ? ListView.builder(
                    shrinkWrap: true, //解决无限高度问题
                    physics: new NeverScrollableScrollPhysics(), //禁用滑动事件
                    itemCount: this.keyWords.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Container(
                          height: 40.0,
                          child: Text(this.keyWords[index],
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14.0,
                                  height: 2.0)),
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: Color(0xffe5e5e5)))),
                      );
                    })
                : Container()),
      );
    } else {
      return Center(
        child: Text('data'),
      );
    }
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return super.appBarTheme(context);
  }
}
