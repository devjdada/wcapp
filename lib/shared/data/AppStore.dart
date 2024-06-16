import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:winners/schema/LogUserSchema.dart';
import 'package:winners/shared/data/AppString.dart';

class AppStore {
///////////////////////////////////////////////////////////////////////////////
  static Future<SharedPreferences> getInstance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

///////////////////////////////////////////////////////////////////////////////
  static Future<void> logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

///////////////////////////////////////////////////////////////////////////////
  static Future<bool?> isUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(AppString.isUserLoggedIn);
  }

  static Future<bool?> setUserLoggedIn(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(AppString.isUserLoggedIn, isLoggedIn);
  }

///////////////////////////////////////////////////////////////////////////////
  static Future<String?> getUserProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppString.userDB);
  }

  static Future<bool> setUserProfile(LogUserSchema user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userProfileJson = json.encode(user);
    return prefs.setString(AppString.userDB, userProfileJson);
  }

  static Future<bool> setUserToken(token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(AppString.tokenDB, token);
  }

  static Future<String?> getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppString.tokenDB);
  }
}
