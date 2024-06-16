import 'package:dio/dio.dart';
// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:winners/schema/LogUserSchema.dart';
import 'package:winners/service/HttpService.dart';
import 'package:winners/shared/data/AppStore.dart';

class AuthApi {
  login(data) async {
    try {
      Response res = await HttpService().post('login', data: data);
      var logUser = LogUserSchema.fromJson(res.data);
      if (logUser.apiToken != null) {
        AppStore.setUserLoggedIn(true);
        AppStore.setUserProfile(logUser);
        AppStore.setUserToken(logUser.apiToken);
        return true;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  register(data) async {
    try {
      print(data);
      Response res = await HttpService().post(
        'register',
        data: data,
      );
      print(res);
      var logUser = LogUserSchema.fromJson(res.data);
      if (logUser.apiToken != null) {
        AppStore.setUserLoggedIn(true);
        AppStore.setUserProfile(logUser);
        AppStore.setUserToken(logUser.apiToken);

        return true;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
