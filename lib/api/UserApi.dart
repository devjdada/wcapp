import 'package:dio/dio.dart';
import 'package:winners/schema/UserSchema.dart';
import 'package:winners/service/HttpService.dart';

class UserApi {
  getUser(userID) async {
    Response response = await HttpService().get("user/$userID");
    return UserSchema.fromJson(response.data);
  }
}
