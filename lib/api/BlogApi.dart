import 'package:dio/dio.dart';
import 'package:winners/schema/BlogsSchema.dart';
import 'package:winners/service/HttpService.dart';

class BlogApi {
  getBlog() async {
    Response response = await HttpService().get('blog');
    return BlogsSchema.fromJson(response.data);
  }
}
