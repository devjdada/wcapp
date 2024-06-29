import 'dart:convert';

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
        AppStore.setUserData(logUser);
        AppStore.setUserToken(logUser.apiToken);
        return true;
      }
    } catch (e) {
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
        AppStore.setUserData(logUser);
        AppStore.setUserToken(logUser.apiToken);

        return true;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  logUser() async {
    var userRef = await AppStore.getUserData();
    try {
      var decodeUser = LogUserSchema.fromJson(json.decode(userRef!));
      return decodeUser;
    } catch (e) {
      print(e);
    }
  }

  isUserLogin() async {
    return await AppStore.isUserLoggedIn() ?? false;
  }

  logOut() async {
    Response out = await HttpService().get('logout');
    print("LOGOU TEST");
    print(out.data);
    print("LOGOU TEST");

    await AppStore.logOut();
    return true;
  }
}
