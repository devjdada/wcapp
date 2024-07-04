import 'package:dio/dio.dart';
import 'package:winners/schema/TestimonySchema.dart';
import 'package:winners/service/HttpService.dart';

class TestimonyApi {
  getTestimony() async {
    Response response = await HttpService().get('testimony');
    return TestimonySchema.fromJson(response.data);
  }
}
