import 'package:dio/dio.dart';
import 'package:winners/schema/YtSchema.dart';
import 'package:winners/shared/data/AppString.dart';

class YtApi {
  getYT() async {
    Response res = await Dio().get(AppString.yTUrl);
    return YtSchema.fromJson(res.data);
  }
}
