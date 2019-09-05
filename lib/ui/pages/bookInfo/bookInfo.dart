import 'package:flutter/material.dart';
import 'package:readbook/utils/coverImage.dart';
import '../../../utils/coverImage.dart';

class bookInfo extends StatefulWidget {
  // 获取父组件的值
  bookInfo({Key key, this.book}) : super(key: key);
  Map book;
  @override
  _bookInfo createState() => _bookInfo();
}

class _bookInfo extends State<bookInfo> {
  @override
  void initState() {
    print(widget.book);
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Navigator.pushNamed(context, '/classify');
            },
            color: Colors.black54,
          )
        ],
        backgroundColor: Color(0xff605167),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Color(0xff605167),
            child: buildHeader(context),
          )
        ],
      ),
    );
  }

  // 小说封面、名称
  Widget buildHeader(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 120.0,
          child: Image.network(CoverImage.convertImageUrl(widget.book['cover']),
              fit: BoxFit.contain),
        ),
        Container(
          height: 120.0,
          padding: EdgeInsets.only(left: 10.0),
          child: Column(
            children: <Widget>[
              Text(widget.book['title'],
                  style: TextStyle(fontSize: 18.0, color: Colors.black87)),
              Text(widget.book['author'],
                  style: TextStyle(fontSize: 18.0, color: Colors.black54))
            ],
          ),
        )
      ],
    );
  }
}
