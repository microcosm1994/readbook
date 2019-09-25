import 'package:flutter/material.dart';
import '../../../data/bookMall/bookMall.dart';
import './Catalog.dart';

// 书籍内容组件
class BookContent extends StatefulWidget {
  // 获取父组件的值
  BookContent({Key key, this.bookLink, this.bookId}) : super(key: key);
  String bookLink;
  String bookId;
  @override
  _BookContent createState() => _BookContent();
}

class _BookContent extends State<BookContent> {
  Map bookContent = {};
  // 获取排行榜数据
  void getBookContent(link) {
    // 请求数据
    BookMall().getBookContent(link).then((res) {
      print(res);
      this.setState(() {
        this.bookContent = res['chapter'];
      });
    });
  }

  @override
  void initState() {
    this.getBookContent(widget.bookLink);
    super.initState();
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Navigator.pushNamed(context, '/classify');
            },
            color: Colors.white,
          )
        ],
        backgroundColor: Color(0xff343434),
      ),
      drawer: new Drawer(
        elevation: double.infinity,
        child: Catalog(bookId: widget.bookId),
      ),
      body: new Container(
        
      ),
      bottomNavigationBar: new Row(
        children: <Widget>[
          Icon(Icons.book),
          Icon(Icons.book),
          Icon(Icons.book),
          Icon(Icons.book),
        ],
      ),
    );
  }

  // 小说内容
  Widget buildContent(BuildContext context){
    return Container(
      child: Text('data'),
    );
  }
}
