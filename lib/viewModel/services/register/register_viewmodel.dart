import 'package:flutter/material.dart';
import 'package:invoice_ui/res/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterViewmodel {
  void register(
      String username, String email, String contact, String password) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString("userName", username);
    await pref.setString("email", email);
    await pref.setString("contact", contact);
    // await pref.setString("password", password).then((value) {
    //   Navigator.push(context, route)
    // },);
  }
}
