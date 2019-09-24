import 'dart:async';

import 'package:dio/dio.dart';
import 'dart:io';

BaseOptions options = new BaseOptions(
  baseUrl: "http://api.zhuishushenqi.com",
  connectTimeout: 5000,
  receiveTimeout: 3000,
  contentType: ContentType.parse("application/x-www-form-urlencoded"),
);
Dio dio = Dio(options);

class BookMall {
  // 获取排行榜类型
  Future<Map> getRankingType() async {
    try {
      Response response = await dio.get("/ranking/gender");
      return response.data;
    } catch (e) {
      return e;
    }
  }

  // 获取排行榜列表
  Future<Map> getRankingList(id) async {
    try {
      Response response = await dio.get("/ranking/" + id);
      return response.data;
    } catch (e) {
      return e;
    }
  }

   // 获取分类小说列表
  Future<Map> getTypeData(params) async {
    try {
      Response response = await dio.get("/book/by-categories?gender=${params['gender']}&type=${params['type']}&major=${params['major']}&minor=${params['minor']}&start=${params['start']}&limit=${params['limit']}");
      return response.data;
    } catch (e) {
      return e;
    }
  }

  // 获取小说分类
  Future<Map> getType() async {
    try {
      Response response = await dio.get("/cats/lv2/statistics");
      return response.data;
    } catch (e) {
      return e;
    }
  }

   // 搜索小说
  Future<Map> getSearch(String value) async {
    try {
      Response response = await dio.get("/book/fuzzy-search?query=$value");
      return response.data;
    } catch (e) {
      return e;
    }
  }

   // 搜索自动补全
  Future<Map> getAutoSearch(String value) async {
    try {
      Response response = await dio.get("/book/auto-complete?query=$value");
      return response.data;
    } catch (e) {
      return e;
    }
  }

   // 获取小说信息
  Future<Map> getBookInfo(String id) async {
    try {
      Response response = await dio.get("/book/$id");
      return response.data;
    } catch (e) {
      return e;
    }
  }

  // 获取小说目录
  Future<Map> getBookCatalog(String id) async {
    try {
      Response response = await dio.get("/mix-atoc/$id?view=chapters");
      return response.data;
    } catch (e) {
      return e;
    }
  }

  // 获取小说内容
  Future<Map> getBookContent(String link) async {
    try {
      Response response = await dio.get("/chapter/$link?view=chapters");
      return response.data;
    } catch (e) {
      return e;
    }
  }
}
