import 'package:flutter/material.dart';
import 'package:readbook/utils/coverImage.dart';
import '../../../data/bookMall/bookMall.dart';
import './classifyInfo.dart';

class classify extends StatefulWidget {
  @override
  _classifyState createState() => _classifyState();
}

class _classifyState extends State<classify> {
  Map<dynamic, dynamic> data = {};
  bool _isManExpanded = false;
  bool _isWomanExpanded = false;
  bool _isCartoonExpanded = false;
  bool _isPressExpanded = false;
  // 获取小说分类
  void getType() {
    // 请求数据
    BookMall().getType().then((res) {
      this.setState(() {
        this.data = res;
      });
    });
  }

  @override
  void initState() {
    this.getType();
    super.initState();
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
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
              icon: Icon(Icons.search),
              onPressed: () => Navigator.pushNamed(context, '/search'),
              color: Colors.black54,
            ),
          ],
          backgroundColor: Colors.grey[50],
          title: Center(
            child: Text(
              '分类',
              style: TextStyle(color: Colors.black54, fontSize: 16.0),
            ),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          child: ListView(
            children: <Widget>[
              ExpansionPanelList(
                children: <ExpansionPanel>[
                  ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                        title: Text('男生分类',
                            style: TextStyle(color: Colors.black54)),
                      );
                    },
                    body: buildTYpeList(this.data['male'], 'male'),
                    isExpanded: _isManExpanded,
                    canTapOnHeader: true,
                  ),
                  ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                        title: Text('女生分类',
                            style: TextStyle(color: Colors.black54)),
                      );
                    },
                    body: buildTYpeList(this.data['female'], 'female'),
                    isExpanded: _isWomanExpanded,
                    canTapOnHeader: true,
                  ),
                  ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                        title: Text('漫画分类',
                            style: TextStyle(color: Colors.black54)),
                      );
                    },
                    body: buildTYpeList(this.data['picture'], 'picture'),
                    isExpanded: _isCartoonExpanded,
                    canTapOnHeader: true,
                  ),
                  ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                        title: Text('出版分类',
                            style: TextStyle(color: Colors.black54)),
                      );
                    },
                    body: buildTYpeList(this.data['press'], 'press'),
                    isExpanded: _isPressExpanded,
                    canTapOnHeader: true,
                  ),
                ],
                expansionCallback: (panelIndex, isExpanded) {
                  switch (panelIndex) {
                    case 0:
                      this.setState(() {
                        _isManExpanded = !isExpanded;
                      });
                      break;
                    case 1:
                      this.setState(() {
                        _isWomanExpanded = !isExpanded;
                      });
                      break;
                    case 2:
                      this.setState(() {
                        _isCartoonExpanded = !isExpanded;
                      });
                      break;
                    case 3:
                      this.setState(() {
                        _isPressExpanded = !isExpanded;
                      });
                      break;
                    default:
                      this.setState(() {
                        _isManExpanded = false;
                        _isWomanExpanded = false;
                        _isCartoonExpanded = false;
                        _isPressExpanded = false;
                      });
                      break;
                  }
                },
                animationDuration: kThemeAnimationDuration,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 渲染分类标签
  Widget buildTYpeList(List context, type) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true, //解决无限高度问题
        physics: new NeverScrollableScrollPhysics(), //禁用滑动事件
        itemCount: context.length,
        itemBuilder: (BuildContext data, int index) {
          return GestureDetector(
            // 点击列表跳转路由，并传参
            onTap: () {
              Navigator.push(data, new MaterialPageRoute(builder: (_) {
                return new classifyInfo(gender: type, data: context[index]);
              }));
            },
            child: Container(
              height: 40.0,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Color(0xffe5e5e5)))),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100.0,
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(context[index]['name'],
                        style:
                            TextStyle(color: Colors.black87, fontSize: 16.0)),
                  ),
                  Container(
                    width: 150.0,
                    child: Text("共有${context[index]['bookCount']}部作品",
                        style:
                            TextStyle(fontSize: 14.0, color: Colors.black54)),
                  ),
                  Expanded(
                    child: Icon(Icons.chevron_right),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
