import 'dart:convert';

import 'package:firstapp/constants/consts.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Account with ChangeNotifier {
  static Future getLastAccount() async {
    final sp = await SharedPreferences.getInstance();
    String? lastAccountStr = sp.getString(StorageKeys.LAST_ACCOUNT);
    if (lastAccountStr == null) {
      return null;
    }
    return jsonDecode(lastAccountStr);
  }
}
