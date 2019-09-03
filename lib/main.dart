import 'package:flutter/material.dart';
import 'ui/widget/BottomNavigationWidget.dart';
import 'ui/pages/search/search.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter bottomNavigationBar',
      theme: ThemeData.light(), //主题
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => BottomNavigationWidget(),
        '/search': (BuildContext context) => Search(),
        //  '/bookCity': (BuildContext context) => BookCity(),
      },
    );
  }
}
