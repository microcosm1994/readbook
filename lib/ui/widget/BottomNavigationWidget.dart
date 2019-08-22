import 'package:flutter/material.dart';
import '../pages/bookShelf.dart';
import '../pages/bookCity.dart';
import '../pages/myHome.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _BottomNavigationColor = Colors.black54;
  int _currentIndex = 0;
  List<Widget> list = List();

  @override
  void initState() {
    list = [BookShelf(), BookCity(), MyHome()];
    super.initState(); //无名无参需要调用
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //脚手架
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.book,
                color: Colors.black54,
              ),
              title: Text(
                '书架',
                style: TextStyle(color: Colors.black54),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black54,
              ),
              title: Text(
                '书城',
                style: TextStyle(color: Colors.black54),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.perm_identity,
                color: Colors.black54,
              ),
              title: Text(
                '我的',
                style: TextStyle(color: Colors.black54),
              )),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
//            Navigator.pushNamed(context, '/detail');
            _currentIndex = index;
          });
        },
      ),
    );
  }
}