import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:winners/schema/LogUserSchema.dart';
import 'package:winners/schema/UserSchema.dart';
import 'package:winners/service/HttpService.dart';
import 'package:winners/shared/data/AppStore.dart';

class UserApi {
  getUser(userID) async {
    Response response = await HttpService().get("user/$userID");
    return UserSchema.fromJson(response.data);
  }

  getLogUser() async {
    var userRef = await AppStore.getUserData();
    return LogUserSchema.fromJson(json.decode(userRef!));
  }

  editUser(userID, data) async {
    await HttpService().update("user/$userID", data: data);
    Response res = await HttpService().get("me");
    var logUser = LogUserSchema.fromJson(res.data);
    if (logUser.user!.dob != null) {
      AppStore.setUserLoggedIn(true);
      AppStore.setUserData(logUser);
      AppStore.setUserToken(logUser.apiToken);
      return true;
    } else {
      return false;
    }
  }
}
