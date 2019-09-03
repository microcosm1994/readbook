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
  @override
  void initState() {
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
                widget.book['cover'],
              ),
              fit: BoxFit.contain),
        ),
        new Expanded(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: new Column(
              children: <Widget>[
                Text(
                  widget.book['title'],
                  softWrap: true,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  widget.book['shortIntro'],
                  softWrap: true,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
