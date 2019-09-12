import 'package:flutter/material.dart';
import 'package:readbook/utils/coverImage.dart';
import '../../../utils/coverImage.dart';
import './Catalog.dart';

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
        drawer: Catalog(bookId: widget.book['_id']),
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
            child: new GestureDetector(
          onTap: () {
            debugPrint('加书架');
          },
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
        )),
        new Expanded(
            child: new GestureDetector(
          onTap: () {
            debugPrint('目录');
          },
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
        )),
        new Expanded(
          child: new GestureDetector(
            onTap: () {
              debugPrint('支持作品');
            },
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
        ),
        new Expanded(
          child: new GestureDetector(
            onTap: () {
              debugPrint('批量下载');
            },
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

  // 评论数据
  List comments = [
    {
      'avator':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568875418&di=a8ff8b7dd4c97e85344244f2a5b459fb&imgtype=jpg&er=1&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201410%2F20%2F20141020224133_Ur54c.jpeg',
      'name': '不吃药',
      'content':
          '那年，葛小天在自家地头搭了个草棚，不料，里面蹿出俩壮汉。……帝国时代啊？可这是现代社会啊！难道要我推着火炮去攻打县城？我石乐志，还是你石乐志？算了，咱们还是一起去搬砖吧，等赚了钱，再包个小工地.'
    },
    {
      'avator':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568280733374&di=a46c53d16a459b0a614db1933742d823&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201605%2F26%2F20160526175100_XT8we.jpeg',
      'name': '绝欢',
      'content': '好久不更新了哦'
    },
    {
      'avator':
          'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3602060168,543481155&fm=26&gp=0.jpg',
      'name': '朽木',
      'content': '求更新，不够看！'
    }
  ];
  // 评论
  Widget buildComment(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 40.0,
          padding: EdgeInsets.only(left: 15.0),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black12))),
          child: Row(
            children: <Widget>[
              new Expanded(
                child: Text(
                  '最新书评',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              new Expanded(
                child: Container(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Icon(
                        Icons.edit,
                        size: 20.0,
                        color: Colors.green[600],
                      ),
                      Text(
                        '写书评',
                        style:
                            TextStyle(color: Colors.green[600], fontSize: 14.0),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: ListBody(
            children: <Widget>[
              ListView.builder(
                shrinkWrap: true, //解决无限高度问题
                physics: new NeverScrollableScrollPhysics(), //禁用滑动事件
                itemCount: comments.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.black12))),
                    child: Row(
                      children: <Widget>[
                        new ClipOval(
                          child: Image.network(
                            comments[index]['avator'],
                            fit: BoxFit.contain,
                            width: 40.0,
                          ),
                        ),
                        new Expanded(
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(left: 15.0),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: double.infinity,
                                  child: Text(
                                    comments[index]['name'],
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 14.0),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  child: Text(
                                    comments[index]['content'],
                                    softWrap: false,
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 12.0),
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text('sss',
                                          style:
                                              TextStyle(color: Colors.black54)),
                                      Text('sss',
                                          style:
                                              TextStyle(color: Colors.black54))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
        Container(
          height: 40.0,
          padding: EdgeInsets.only(left: 15.0),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black12))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                '查看更多',
                style: TextStyle(color: Colors.black54, fontSize: 14.0),
                textAlign: TextAlign.right,
              ),
              Icon(
                Icons.more_vert,
                size: 20.0,
                color: Colors.black54,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
