import 'package:dio/dio.dart';

class BookType {
  void getHttp() async {
    print(111);
    try {
      Response response = await Dio().get("http://www.google.com");
      print(response);
    } catch (e) {
      print(e);
    }
  }
}