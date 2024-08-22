import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageViemodel extends ChangeNotifier {
  String _lang = "English";

  String get lang => _lang;

  void getLanguage() async {
    final pref = await SharedPreferences.getInstance();
    var val = pref.getString("language") ?? "English";
    _lang = val;
    notifyListeners();
  }

  void setLanguage(String value) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString("language", value);
  }
}
