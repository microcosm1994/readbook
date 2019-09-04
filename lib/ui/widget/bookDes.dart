import 'package:flutter/material.dart';
import 'package:readbook/utils/coverImage.dart';

class BookDes extends StatefulWidget {
  // 获取父组件的值
  BookDes({Key key, this.book}) : super(key: key);
  Map book;
  @override
  _BookDes createState() => _BookDes();
}

class _BookDes extends State<BookDes> {
  Map data = {
    'cover': '',
    'title': '',
    'shortIntro': '',
    'author': '',
    'type': '',
  };
  @override
  void initState() {
    print(widget.book);
    this.setState(() {
      this.data['cover'] = widget.book['cover'];
      this.data['title'] = widget.book['title'];
      this.data['shortIntro'] = widget.book['shortIntro'];
      this.data['author'] = widget.book['author'];
      this.data['latelyFollower'] = widget.book['latelyFollower'];
      this.data['type'] = widget.book['majorCate'] is String
          ? widget.book['majorCate']
          : widget.book['cat'];
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: 70.0,
          child: Image.network(
              CoverImage.convertImageUrl(
                data['cover'],
              ),
              fit: BoxFit.contain),
        ),
        new Expanded(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: new Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: Text(
                  data['title'],
                  softWrap: false,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                ),
                Text(
                  data['shortIntro'],
                  softWrap: true,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: 100.0,
                      child: Text(
                        data['author'],
                        style: TextStyle(color: Colors.green),
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    new Expanded(
                        child: Text(data['type'],
                        textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.orangeAccent))),
                    new Expanded(
                        child: Text(
                      '🔥${data["latelyFollower"]}',
                      style: TextStyle(color: Colors.redAccent),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    )),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
