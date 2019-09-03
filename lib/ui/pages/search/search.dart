import 'package:flutter/material.dart';
import '../../widget/bookDes.dart';
import '../../../data/bookMall/bookMall.dart';

class Search extends StatefulWidget {
  _Search createState() => _Search();
}

class _Search extends State<Search> {
  String searchValue;
  List bookList = [];

  void getSearch(String value) {
    BookMall().getSearch(value).then((res) {
      print(res['books']);
      print(res['books'].length);
      this.setState(() {
        this.bookList = res['books'];
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black54,
        ),
        backgroundColor: Colors.grey[50],
        title: Container(height: 40.0, child: buildSearchInput(context)),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              this.getSearch(this.searchValue);
            },
            color: Colors.black54,
          )
        ],
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              child: searchList(context),
            )
          ],
        ),
      ),
    );
  }

  // 输入框
  Widget buildSearchInput(BuildContext context) {
    final controller = TextEditingController();
    controller.text = searchValue;
    return TextField(
      maxLines: 1, //最大行数
      autocorrect: false, //是否自动更正
      autofocus: true, //是否自动对焦
      style: TextStyle(fontSize: 16.0, color: Colors.black87), //输入文本的样式
      decoration: InputDecoration(
          fillColor: Colors.grey[200],
          filled: true,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: '输入小说名称'),
      onSubmitted: (text) {
        //内容提交(按回车)的回调
        this.getSearch(text);
        this.searchValue = text;
        debugPrint('submit $text');
      },
      controller: controller,
    );
  }

  // 列表
  Widget searchList(BuildContext context) {
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
}
