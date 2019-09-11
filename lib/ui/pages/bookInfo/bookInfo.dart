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
    print(widget.book['latelyFollower']);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
          backgroundColor: Color(0xff605167),
        ),
        body: Container(
          color: Color(0xffe2e2e2),
          child: ListView(
            children: <Widget>[
              // 小说封面
              Container(
                height: 150.0,
                color: Color(0xff605167),
                child: buildHeader(context),
              ),
              // 操作栏
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 5.0),
                color: Colors.white,
                child: buildOpera(),
              ),
              // 小说简介
              Container(
                width: double.infinity,
                color: Colors.white,
                margin: EdgeInsets.only(top: 5.0),
                padding: EdgeInsets.all(15.0),
                child: Text(
                  widget.book['longIntro'],
                  softWrap: true,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ),
              // 最新章节
              Container(
                width: double.infinity,
                height: 40.0,
                margin: EdgeInsets.only(top: 5.0),
                color: Colors.white,
                child: buildNew(context),
              ),
              // 最新书评
              Container(
                width: double.infinity,
                height: 40.0,
                margin: EdgeInsets.only(top: 5.0),
                color: Colors.white,
                child: buildComment(context),
              ),
            ],
          ),
        ));
  }

  // 小说封面、名称
  Widget buildHeader(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 120.0,
          padding: EdgeInsets.only(left: 15.0),
          child: Image.network(CoverImage.convertImageUrl(widget.book['cover']),
              fit: BoxFit.contain),
        ),
        new Expanded(
          child: Container(
            width: double.infinity,
            height: 120.0,
            padding: EdgeInsets.only(left: 10.0),
            child: Column(
              children: <Widget>[
                Container(
                  height: 90.0,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        child: Text(
                          widget.book['title'],
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Text(
                          '作者：${widget.book['author']}',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Text(
                          '${widget.book['wordCount'] / 10000}万字',
                          style: TextStyle(fontSize: 14.0, color: Colors.white),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    child: Row(children: <Widget>[
                  new Expanded(
                    child: Text.rich(TextSpan(
                        text: widget.book['majorCate'],
                        style: TextStyle(color: Colors.white, fontSize: 14.0),
                        children: <TextSpan>[
                          TextSpan(text: '  |  '),
                          TextSpan(text: widget.book['minorCateV2']),
                        ])),
                  ),
                  new Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 30.0),
                      child: Text.rich(TextSpan(
                          text: '${widget.book["rating"]["score"]}',
                          style: TextStyle(
                              color: Colors.orangeAccent, fontSize: 20.0),
                          children: <TextSpan>[
                            TextSpan(
                                text: '分',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14.0)),
                          ])),
                    ),
                  ),
                ]))
              ],
            ),
          ),
        )
      ],
    );
  }

  // 按钮组
  Widget buildOpera() {
    return Row(
      children: <Widget>[
        new Expanded(
          child: Column(
            children: <Widget>[
              Container(
                  height: 30.0,
                  child: IconButton(
                    icon: Icon(Icons.add_to_photos),
                  )),
              Text(
                '加书架',
                style: TextStyle(fontSize: 12.0),
              )
            ],
          ),
        ),
        new Expanded(
          child: Column(
            children: <Widget>[
              Container(
                  height: 30.0,
                  child: IconButton(
                    icon: Icon(Icons.format_list_bulleted),
                  )),
              Text(
                '${widget.book['chaptersCount']}章',
                style: TextStyle(fontSize: 12.0),
              )
            ],
          ),
        ),
        new Expanded(
          child: Column(
            children: <Widget>[
              Container(
                  height: 30.0,
                  child: IconButton(
                    icon: Icon(Icons.local_activity),
                  )),
              Text(
                '支持作品',
                style: TextStyle(fontSize: 12.0),
              )
            ],
          ),
        ),
        new Expanded(
          child: Column(
            children: <Widget>[
              Container(
                  height: 30.0,
                  child: IconButton(
                    icon: Icon(Icons.file_download),
                  )),
              Text(
                '批量下载',
                style: TextStyle(fontSize: 12.0),
              )
            ],
          ),
        )
      ],
    );
  }

  // 小说最新章节
  Widget buildNew(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 100.0,
          padding: EdgeInsets.only(left: 15.0),
          child: Text('最新章节', style: TextStyle(fontSize: 16.0)),
        ),
        new Expanded(
            child: Text(
          '${widget.book['lastChapter']}',
          style: TextStyle(
            color: Colors.black54,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        )),
        Icon(
          Icons.chevron_right,
          color: Colors.black54,
        ),
      ],
    );
  }

  // 评论
  Widget buildComment(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 40.0,
          padding: EdgeInsets.only(left: 15.0),
          child: Row(
            children: <Widget>[Text('最新书评', style: TextStyle(fontSize: 16.0),),
            new Expanded(child: Text('写书评', textAlign: TextAlign.right)),
            Text('写书评', textAlign: TextAlign.right),
            new Expanded(child: Text('data'))],
          ),
        )
      ],
    );
  }
}
