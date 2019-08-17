import 'package:flutter/material.dart';
import 'ui/widget/BottomNavigationWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter bottomNavigationBar',
      theme: ThemeData.light(),//主题
      home: BottomNavigationWidget(),
//      routes: <String, WidgetBuilder>{
//        '/bookShelf': (BuildContext context) => BookShelf(),
//        '/bookCity': (BuildContext context) => BookCity(),
//      },
    );
  }
}