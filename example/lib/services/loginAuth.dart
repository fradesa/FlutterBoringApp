import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginAuth {
  static late SharedPreferences prefs;

  static bool get isUserLoggedIn => prefs.getBool('log') ?? false;

  static void setUserLogStatus(bool val) {
    prefs.setBool('log', val);
  }
}
