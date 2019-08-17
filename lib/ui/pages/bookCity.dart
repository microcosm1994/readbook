import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class BookCity extends StatelessWidget {
  @override
  void initState() {
    print(111);
  }

  @override
  Widget build(BuildContext context) {
    getHttp();
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('书城')),
      ),
      body: Center(
        child: Text('书城'),
      ),
    );
  }

  // 请求书籍分类
  void getHttp() async {
    try {
      Response response = await Dio().get("http://api.zhuishushenqi.com/cats/lv2/statistics");
      print(response);
    } catch (e) {
      print(e);
    }
  }
}