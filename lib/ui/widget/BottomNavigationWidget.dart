import 'package:flutter/material.dart';
import '../pages/bookShelf.dart';
import '../pages/bookCity.dart';
import '../pages/myHome.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _BottomNavigationColor = Colors.blue;
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
                color: _BottomNavigationColor,
              ),
              title: Text(
                '书架',
                style: TextStyle(color: _BottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _BottomNavigationColor,
              ),
              title: Text(
                '书城',
                style: TextStyle(color: _BottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.perm_identity,
                color: _BottomNavigationColor,
              ),
              title: Text(
                '我的',
                style: TextStyle(color: _BottomNavigationColor),
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