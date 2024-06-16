import 'package:dio/dio.dart';
import 'package:winners/schema/YtSchema.dart';
import 'package:winners/service/HttpService.dart';
import 'package:winners/shared/data/AppString.dart';

class YtApi {
  getYT() async {
    Response response = await HttpService().get(AppString.yTUrl);
    return YtSchema.fromJson(response.data);
  }
}
