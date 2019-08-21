import 'package:readbook/data/dio_utils.dart';

class BookMall {
  // 获取排行榜类型
  Future<Map> getRankingType() async {
    try {
      return await DioUtils()
          .request<String>("/ranking/gender");
    } catch (e) {
      return e;
    }
  }
  // 获取排行榜列表
  Future<Map> getRankingList(id, callback) async {
    try {
      return await DioUtils().request<String>("/ranking/" + id);
    } catch (e) {
      return e;
    }
  }

  // 获取小说分类
  Future<Map> getType() async {
    try {
      return await DioUtils().request<String>("/cats/lv2/statistics");
    } catch (e) {
      return e;
    }
  }
}
